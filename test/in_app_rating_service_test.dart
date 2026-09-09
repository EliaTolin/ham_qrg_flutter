import 'package:flutter_test/flutter_test.dart';
import 'package:hamqrg/clients/in_app_review/app_review_client.dart';
import 'package:hamqrg/clients/storage/impl/shared_pref_storage_client/shared_pref_storage_client.dart';
import 'package:hamqrg/common/provider/offline_status_notifier/offline_status_notifier.dart';
import 'package:hamqrg/common/service/in_app_rating/in_app_rating_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'support/in_memory_storage_client.dart';

// ---------------------------------------------------------------------------
// Il prompt di recensione è una risorsa a quota (iOS: 3 volte per 365 giorni,
// richieste in più ignorate in silenzio). Questi test bloccano *quando* lo si
// chiede: è l'unica parte che possiamo sbagliare, il prompt in sé lo disegna
// il sistema operativo.
// ---------------------------------------------------------------------------

class _FakeAppReviewClient implements AppReviewClient {
  bool available = true;
  int requestCount = 0;

  @override
  Future<bool> isAvailable() async => available;

  @override
  Future<void> requestReview() async => requestCount++;
}

class _FakeOfflineStatus extends OfflineStatusNotifier {
  _FakeOfflineStatus({required this.offline});

  final bool offline;

  @override
  Future<bool> build() async => offline;
}

const _launchCountKey = 'in_app_rating_launch_count';
const _promptCountKey = 'in_app_rating_prompt_count';
const _lastPromptAtKey = 'in_app_rating_last_prompt_at';

void main() {
  late InMemoryStorageClient storage;
  late _FakeAppReviewClient review;

  /// Container con l'archivio e il client di recensione finti. [offline] va
  /// risolto prima dell'uso: il servizio legge lo stato in modo sincrono.
  Future<ProviderContainer> makeContainer({bool offline = false}) async {
    final container = ProviderContainer(
      overrides: [
        sharedPrefStorageClientProvider.overrideWith((ref) async => storage),
        appReviewClientProvider.overrideWithValue(review),
        offlineStatusProvider.overrideWith(
          () => _FakeOfflineStatus(offline: offline),
        ),
      ],
    );
    addTearDown(container.dispose);
    await container.read(offlineStatusProvider.future);
    return container;
  }

  setUp(() {
    storage = InMemoryStorageClient();
    review = _FakeAppReviewClient();
  });

  test('non chiede nulla al primo avvio', () async {
    // Chi ha appena installato non ha ancora un'opinione da dare.
    final container = await makeContainer();
    final service = container.read(inAppRatingServiceProvider);

    await service.registerAppLaunch();
    await service.requestReviewIfNeeded();

    expect(review.requestCount, 0);
    expect(await storage.read(_launchCountKey), '1');
  });

  test('chiede al secondo avvio', () async {
    await storage.write(_launchCountKey, '1');
    final container = await makeContainer();
    final service = container.read(inAppRatingServiceProvider);

    await service.registerAppLaunch();
    await service.requestReviewIfNeeded();

    expect(review.requestCount, 1);
    expect(await storage.read(_promptCountKey), '1');
    expect(await storage.read(_lastPromptAtKey), isNotNull);
  });

  test('chiede una volta sola per sessione', () async {
    // La home può rimontarsi (cambio tab, rotazione): il trigger riparte, la
    // richiesta no.
    await storage.write(_launchCountKey, '1');
    final container = await makeContainer();
    final service = container.read(inAppRatingServiceProvider);

    await service.registerAppLaunch();
    await service.requestReviewIfNeeded();
    await service.requestReviewIfNeeded();
    await service.requestReviewIfNeeded();

    expect(review.requestCount, 1);
  });

  test('conta un avvio solo per processo, anche se la splash si ricostruisce',
      () async {
    // La splash rifà `build()` al retry dopo un errore: non è un altro avvio.
    final container = await makeContainer();
    final service = container.read(inAppRatingServiceProvider);

    await service.registerAppLaunch();
    await service.registerAppLaunch();
    await service.registerAppLaunch();

    expect(await storage.read(_launchCountKey), '1');
  });

  test('non richiede al terzo avvio: il traguardo successivo è lontano',
      () async {
    // Chiesto al secondo avvio, il prossimo è il quinto — e comunque non
    // prima di 150 giorni.
    await storage.write(_launchCountKey, '2');
    await storage.write(_promptCountKey, '1');
    await storage.write(
      _lastPromptAtKey,
      DateTime.now().toUtc().toIso8601String(),
    );
    final container = await makeContainer();
    final service = container.read(inAppRatingServiceProvider);

    await service.registerAppLaunch();
    await service.requestReviewIfNeeded();

    expect(review.requestCount, 0);
  });

  test('al traguardo successivo tace finché non passano 100 giorni', () async {
    await storage.write(_launchCountKey, '6');
    await storage.write(_promptCountKey, '1');
    await storage.write(
      _lastPromptAtKey,
      DateTime.now()
          .toUtc()
          .subtract(const Duration(days: 90))
          .toIso8601String(),
    );
    final container = await makeContainer();
    final service = container.read(inAppRatingServiceProvider);

    await service.requestReviewIfNeeded();

    expect(review.requestCount, 0);
  });

  test('al traguardo successivo chiede se il tempo è passato', () async {
    await storage.write(_launchCountKey, '6');
    await storage.write(_promptCountKey, '1');
    await storage.write(
      _lastPromptAtKey,
      DateTime.now()
          .toUtc()
          .subtract(const Duration(days: 110))
          .toIso8601String(),
    );
    final container = await makeContainer();
    final service = container.read(inAppRatingServiceProvider);

    await service.requestReviewIfNeeded();

    expect(review.requestCount, 1);
    expect(await storage.read(_promptCountKey), '2');
  });

  test('la quinta richiesta esiste ancora, al centesimo avvio', () async {
    // Regressione: il tetto è la lunghezza della scala dei traguardi. Se
    // qualcuno reintroducesse una costante separata e la lasciasse a tre, gli
    // ultimi due traguardi diventerebbero irraggiungibili in silenzio.
    await storage.write(_launchCountKey, '100');
    await storage.write(_promptCountKey, '4');
    await storage.write(
      _lastPromptAtKey,
      DateTime.now()
          .toUtc()
          .subtract(const Duration(days: 200))
          .toIso8601String(),
    );
    final container = await makeContainer();
    final service = container.read(inAppRatingServiceProvider);

    await service.requestReviewIfNeeded();

    expect(review.requestCount, 1);
    expect(await storage.read(_promptCountKey), '5');
  });

  test('dopo cinque richieste non chiede mai più', () async {
    // Chi ha ignorato il prompt cinque volte ha già risposto.
    await storage.write(_launchCountKey, '500');
    await storage.write(_promptCountKey, '5');
    await storage.write(
      _lastPromptAtKey,
      DateTime.now()
          .toUtc()
          .subtract(const Duration(days: 3650))
          .toIso8601String(),
    );
    final container = await makeContainer();
    final service = container.read(inAppRatingServiceProvider);

    await service.requestReviewIfNeeded();

    expect(review.requestCount, 0);
  });

  test('offline non chiede: la recensione non potrebbe essere inviata',
      () async {
    await storage.write(_launchCountKey, '2');
    final container = await makeContainer(offline: true);
    final service = container.read(inAppRatingServiceProvider);

    await service.requestReviewIfNeeded();

    expect(review.requestCount, 0);
    expect(await storage.read(_promptCountKey), isNull);
  });

  test('dispositivo senza prompt disponibile: non consuma il traguardo',
      () async {
    // Su un Android senza Play Store il prompt non esiste: la richiesta non
    // va contata, altrimenti l'unica occasione utile andrebbe persa senza che
    // nessuno abbia visto nulla.
    review.available = false;
    await storage.write(_launchCountKey, '2');
    final container = await makeContainer();
    final service = container.read(inAppRatingServiceProvider);

    await service.requestReviewIfNeeded();

    expect(review.requestCount, 0);
    expect(await storage.read(_promptCountKey), isNull);
    expect(await storage.read(_lastPromptAtKey), isNull);
  });

  test('una data illeggibile non sblocca la richiesta', () async {
    // Nel dubbio si tace: contare male vuol dire bruciare la quota annuale.
    await storage.write(_launchCountKey, '50');
    await storage.write(_promptCountKey, '1');
    await storage.write(_lastPromptAtKey, 'non-una-data');
    final container = await makeContainer();
    final service = container.read(inAppRatingServiceProvider);

    await service.requestReviewIfNeeded();

    expect(review.requestCount, 0);
  });
}
