class TemperatureUnit {
  final double Value;
  final String Unit;
  TemperatureUnit({
    required this.Value,
    required this.Unit,
  });
  factory TemperatureUnit.fromJson(dynamic json) {
    return TemperatureUnit(
      Value: json['Value'],
      Unit: json['Unit'],
    );
  }
}
