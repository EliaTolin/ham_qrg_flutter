/// Constants for Mapbox map layer and source identifiers
abstract final class MapKeys {
  /// Source ID for repeaters GeoJSON data
  static const String repeatersSource = 'repeaters-source';

  /// Layer ID for cluster circles
  static const String clusterLayer = 'repeaters-cluster';

  /// Layer ID for cluster count text
  static const String clusterCountLayer = 'repeaters-cluster-count';

  /// Layer ID for same-location cluster circles (synthetic clusters)
  static const String sameLocationClusterLayer =
      'repeaters-same-location-cluster';

  /// Layer ID for same-location cluster count text
  static const String sameLocationClusterCountLayer =
      'repeaters-same-location-cluster-count';

  /// Layer ID for unclustered repeater points
  static const String unclusteredPointLayer = 'repeaters-unclustered';

  /// Source ID for POTA spots GeoJSON data
  static const String potaSource = 'pota-source';

  /// Layer ID for POTA spot markers
  static const String potaLayer = 'pota-spots';

  /// Image ID for POTA logo marker
  static const String potaLogoImage = 'pota-logo';

  /// Source ID for SOTA spots GeoJSON data
  static const String sotaSource = 'sota-source';

  /// Layer ID for SOTA spot markers
  static const String sotaLayer = 'sota-spots';

  /// Image ID for SOTA logo marker
  static const String sotaLogoImage = 'sota-logo';
}
