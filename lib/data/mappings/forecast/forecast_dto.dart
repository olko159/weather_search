import 'package:weather_search/data/mappings/forecast/forecast_temperature_dto.dart';

class ForecastDTO {
  final String Date;
  final ForecastTemperatureDTO Temperature;
  ForecastDTO({
    required this.Date,
    required this.Temperature,
  });
  factory ForecastDTO.fromJson(dynamic json) {
    return ForecastDTO(
      Date: json['Date'],
      Temperature: ForecastTemperatureDTO.fromJson(json['Temperature']),
    );
  }
}
