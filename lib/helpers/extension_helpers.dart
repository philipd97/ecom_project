extension Normalize on double {
  double normalized({
    required double selfRangeMin,
    required double selfRangeMax,
    required double normalizedRangeMin,
    required double normalizedRangeMax,
  }) =>
      (normalizedRangeMax - normalizedRangeMin) *
          ((this - selfRangeMin) / (selfRangeMax - selfRangeMin)) +
      normalizedRangeMin;
}
