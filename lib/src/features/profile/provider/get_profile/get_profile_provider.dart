import 'package:hamqrg/clients/supabase/supabase_client/supabase_client.dart';
import 'package:hamqrg/common/provider/keep_alive_for_ref.dart';
import 'package:hamqrg/src/features/authentication/provider/get_user_id/get_user_id_provider.dart';
import 'package:hamqrg/src/features/profile/data/repository/profile_repository.dart';
import 'package:hamqrg/src/features/profile/domain/profile/profile.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_profile_provider.g.dart';

@riverpod
Future<Profile> getProfile(Ref ref) async {
  ref.keepAliveFor(kHandoverKeepAlive);
  // Read all providers upfront before any async gaps
  final repositoryFuture = ref.read(profileRepositoryProvider.future);
  final userIdFuture = ref.read(getUserIdProvider.future);

  final repository = await repositoryFuture;
  // `getUserIdProvider` può essersi risolto prima che esistesse una sessione
  // (primo avvio dopo l'installazione: il login anonimo arriva dopo) e restare
  // fermo su `null`. Prima di fallire si rilegge la sessione viva: è la stessa
  // sorgente (`auth.currentUser?.id`), solo senza la cache del provider.
  final userId = await userIdFuture ??
      ref.read(supabaseClientProvider).auth.currentUser?.id;

  if (userId == null) {
    throw Exception('User ID is null. Cannot fetch profile.');
  }
  return repository.getProfile(userId);
}
