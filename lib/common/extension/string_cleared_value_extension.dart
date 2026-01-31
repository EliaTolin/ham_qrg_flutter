extension StringClearedExtension on String? {
  String? clearedValue() {
    if (this != null && this!.isNotEmpty) {
      return this;
    } else {
      return null;
    }
  }
}
