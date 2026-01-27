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
}
