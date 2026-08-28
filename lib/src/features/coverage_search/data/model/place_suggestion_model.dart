/// DTO di un risultato di geocodifica Mapbox v6.
///
/// Non usa `@freezed` con `json_serializable` perché la risposta è annidata in
/// GeoJSON (`features[].properties`, `features[].geometry.coordinates`) e la
/// mappatura a mano è più leggibile del wrapper che servirebbe a generarla.
class PlaceSuggestionModel {
  const PlaceSuggestionModel({
    required this.label,
    required this.latitude,
    required this.longitude,
    this.context,
  });

  /// Costruisce il modello da un elemento di `features`.
  ///
  /// Restituisce `null` se il feature è privo di nome o di coordinate usabili:
  /// un suggerimento senza etichetta o senza posizione non è mostrabile.
  static PlaceSuggestionModel? fromFeature(Map<String, dynamic> feature) {
    final properties = feature['properties'];
    final geometry = feature['geometry'];
    if (properties is! Map<String, dynamic> ||
        geometry is! Map<String, dynamic>) {
      return null;
    }

    final name = properties['name'];
    if (name is! String || name.isEmpty) return null;

    // GeoJSON ordina [longitudine, latitudine]: invertirle è l'errore classico
    // e manda il pin dall'altra parte del pianeta senza fallire.
    final coordinates = geometry['coordinates'];
    if (coordinates is! List || coordinates.length < 2) return null;
    final longitude = (coordinates[0] as num?)?.toDouble();
    final latitude = (coordinates[1] as num?)?.toDouble();
    if (latitude == null || longitude == null) return null;

    final placeFormatted = properties['place_formatted'];

    return PlaceSuggestionModel(
      label: name,
      latitude: latitude,
      longitude: longitude,
      context: placeFormatted is String && placeFormatted.isNotEmpty
          ? placeFormatted
          : null,
    );
  }

  final String label;
  final double latitude;
  final double longitude;
  final String? context;
}
