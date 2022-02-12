import 'package:weather_search/data/mappings/current_conditions/current_conditions_temperature.dart';

class CurrentConditionsDTO {
  final String LocalObservationDateTime;
  final String WeatherText;
  final CurrentConditionsTemperatureDTO Temperature;

  CurrentConditionsDTO({
    required this.LocalObservationDateTime,
    required this.WeatherText,
    required this.Temperature,
  });
  factory CurrentConditionsDTO.fromJson(dynamic json) {
    return CurrentConditionsDTO(
      LocalObservationDateTime: json['LocalObservationDateTime'],
      WeatherText: json['WeatherText'],
      Temperature:
          CurrentConditionsTemperatureDTO.fromJson(json['Temperature']),
    );
  }
}
