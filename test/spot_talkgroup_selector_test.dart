import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hamqrg/l10n/app_localizations.dart';
import 'package:hamqrg/src/features/brandmeister/domain/bm_talkgroup.dart';
import 'package:hamqrg/src/features/brandmeister/provider/get_bm_talkgroup_names/get_bm_talkgroup_names_provider.dart';
import 'package:hamqrg/src/features/brandmeister/provider/get_bm_talkgroups/get_bm_talkgroups_provider.dart';
import 'package:hamqrg/src/features/repeaters/domain/access/access_mode.dart';
import 'package:hamqrg/src/features/repeaters/domain/access/repeater_access.dart';
import 'package:hamqrg/src/features/repeaters/domain/network/network.dart';
import 'package:hamqrg/src/features/repeaters/domain/network/network_kind.dart';
import 'package:hamqrg/src/features/spots/presentation/widgets/talkgroup_selector.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Il TG si dichiara solo sul DMR (decisione di prodotto, non una scorciatoia
/// di implementazione): questi test bloccano sia la condizione che il
/// contratto del valore restituito al chiamante.
void main() {
  const bmNodeId = 222999;

  final network = Network(
    id: 'net-bm',
    name: 'BrandMeister',
    kind: NetworkKind.dmr,
    createdAt: DateTime(2026),
  );

  RepeaterAccess access({
    required AccessMode mode,
    int? nodeId,
    Network? network,
  }) {
    return RepeaterAccess(
      id: 'access-1',
      repeaterId: 'repeater-1',
      mode: mode,
      source: 'test',
      createdAt: DateTime(2026),
      updatedAt: DateTime(2026),
      nodeId: nodeId,
      network: network,
    );
  }

  Future<int?> pumpSelector(
    WidgetTester tester, {
    required RepeaterAccess? selected,
    List<BmTalkgroup> talkgroups = const [],
    Map<String, String> names = const {},
  }) async {
    int? captured;

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          getBmTalkgroupsProvider(bmNodeId).overrideWith((ref) async {
            return talkgroups;
          }),
          getBmTalkgroupNamesProvider.overrideWith((ref) async => names),
        ],
        child: MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: const Locale('it'),
          home: Scaffold(
            body: StatefulBuilder(
              builder: (context, setState) => TalkgroupSelector(
                access: selected,
                value: captured,
                onChanged: (value) => setState(() => captured = value),
              ),
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
    return captured;
  }

  testWidgets('non compare su un accesso analogico', (tester) async {
    await pumpSelector(tester, selected: access(mode: AccessMode.analog));

    expect(find.text('Talkgroup (opzionale)'), findsNothing);
    expect(find.byType(ChoiceChip), findsNothing);
  });

  testWidgets('non compare quando nessun accesso è selezionato',
      (tester) async {
    await pumpSelector(tester, selected: null);

    expect(find.text('Talkgroup (opzionale)'), findsNothing);
  });

  testWidgets('supports() riconosce solo il DMR', (tester) async {
    expect(TalkgroupSelector.supports(access(mode: AccessMode.dmr)), isTrue);
    expect(TalkgroupSelector.supports(access(mode: AccessMode.c4fm)), isFalse);
    expect(TalkgroupSelector.supports(access(mode: AccessMode.dstar)), isFalse);
    expect(TalkgroupSelector.supports(null), isFalse);
  });

  testWidgets('su DMR senza BrandMeister resta solo il campo libero',
      (tester) async {
    await pumpSelector(tester, selected: access(mode: AccessMode.dmr));

    expect(find.text('Talkgroup (opzionale)'), findsOneWidget);
    expect(find.text('Altro'), findsOneWidget);
    expect(find.byType(TextField), findsNothing);

    await tester.tap(find.text('Altro'));
    await tester.pumpAndSettle();
    expect(find.byType(TextField), findsOneWidget);
  });

  testWidgets('il campo libero accetta un TG valido e rifiuta lo zero',
      (tester) async {
    await pumpSelector(tester, selected: access(mode: AccessMode.dmr));

    await tester.tap(find.text('Altro'));
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextField), '222');
    await tester.pumpAndSettle();
    expect(find.text('Inserisci un numero tra 1 e 16777215'), findsNothing);

    await tester.enterText(find.byType(TextField), '0');
    await tester.pumpAndSettle();
    expect(find.text('Inserisci un numero tra 1 e 16777215'), findsOneWidget);
  });

  testWidgets('i TG statici BrandMeister diventano chip, senza duplicati',
      (tester) async {
    await pumpSelector(
      tester,
      selected: access(
        mode: AccessMode.dmr,
        nodeId: bmNodeId,
        network: network,
      ),
      talkgroups: const [
        // Lo stesso TG legato su entrambi i timeslot: una sola chip.
        BmTalkgroup(talkgroupId: 222, slot: 1, repeaterId: bmNodeId),
        BmTalkgroup(talkgroupId: 222, slot: 2, repeaterId: bmNodeId),
        BmTalkgroup(talkgroupId: 91, slot: 1, repeaterId: bmNodeId),
      ],
      names: const {'222': 'Italia', '91': 'Worldwide'},
    );

    expect(find.text('TG 91 · Worldwide'), findsOneWidget);
    expect(find.text('TG 222 · Italia'), findsOneWidget);
    expect(find.text('Altro'), findsOneWidget);
  });

  testWidgets('la chip toccata due volte azzera la dichiarazione',
      (tester) async {
    int? captured;

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          getBmTalkgroupsProvider(bmNodeId).overrideWith((ref) async {
            return const [
              BmTalkgroup(talkgroupId: 222, slot: 1, repeaterId: bmNodeId),
            ];
          }),
          getBmTalkgroupNamesProvider.overrideWith((ref) async => const {}),
        ],
        child: MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: const Locale('it'),
          home: Scaffold(
            body: StatefulBuilder(
              builder: (context, setState) => TalkgroupSelector(
                access: access(
                  mode: AccessMode.dmr,
                  nodeId: bmNodeId,
                  network: network,
                ),
                value: captured,
                onChanged: (value) => setState(() => captured = value),
              ),
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.text('TG 222'));
    await tester.pumpAndSettle();
    expect(captured, 222);

    await tester.tap(find.text('TG 222'));
    await tester.pumpAndSettle();
    expect(captured, isNull);
  });
}
