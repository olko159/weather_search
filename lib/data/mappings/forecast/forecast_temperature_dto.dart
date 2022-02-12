import 'package:weather_search/data/mappings/temperature_unit.dart';

class ForecastTemperatureDTO {
  final TemperatureUnit Minimum;
  final TemperatureUnit Maximum;
  ForecastTemperatureDTO({
    required this.Minimum,
    required this.Maximum,
  });
  factory ForecastTemperatureDTO.fromJson(dynamic json) {
    return ForecastTemperatureDTO(
      Minimum: TemperatureUnit.fromJson(json['Minimum']),
      Maximum: TemperatureUnit.fromJson(json['Maximum']),
    );
  }
}
