import 'package:weather_search/data/mappings/temperature_unit.dart';

class CurrentConditionsTemperatureDTO {
  final TemperatureUnit Imperial;
  final TemperatureUnit Metric;
  CurrentConditionsTemperatureDTO({
    required this.Imperial,
    required this.Metric,
  });
  factory CurrentConditionsTemperatureDTO.fromJson(dynamic json) {
    return CurrentConditionsTemperatureDTO(
      Imperial: TemperatureUnit.fromJson(json['Imperial']),
      Metric: TemperatureUnit.fromJson(json['Metric']),
    );
  }
}
