import 'package:hamqrg/src/features/repeaters/data/model/repeater/repeater_model.dart';

/// Involucro del ripetitore in cache, con il momento in cui è stato scritto.
///
/// Il timestamp sta nel payload e non si legge dalla colonna `created_at` della
/// tabella di `remote_caching`: quella colonna esiste ma il pacchetto non la
/// espone. Senza questo dato non si potrebbe segnalare una postazione con dati
/// oltre i 30 giorni (FR-046), né mostrare una data onesta quando i suoi
/// ripetitori sono stati aggiornati in momenti diversi.
class CachedRepeaterModel {
  const CachedRepeaterModel({required this.repeater, required this.cachedAt});

  factory CachedRepeaterModel.fromJson(Object? json) {
    final map = json! as Map<String, dynamic>;
    return CachedRepeaterModel(
      repeater: RepeaterModel.fromJson(map['repeater'] as Map<String, dynamic>),
      cachedAt: DateTime.parse(map['cachedAt'] as String),
    );
  }

  final RepeaterModel repeater;
  final DateTime cachedAt;

  Map<String, dynamic> toJson() => {
        'repeater': repeater.toJson(),
        'cachedAt': cachedAt.toIso8601String(),
      };
}
