import 'package:weather_search/data/mappings/forecast/forecast_temperature_dto.dart';

class ForecastDTO {
  final String Date;
  final int EpochDate;
  final ForecastTemperatureDTO Temperature;
  ForecastDTO({
    required this.Date,
    required this.Temperature,
    required this.EpochDate,
  });
  factory ForecastDTO.fromJson(dynamic json) {
    return ForecastDTO(
      Date: json['Date'],
      EpochDate: json['EpochDate'],
      Temperature: ForecastTemperatureDTO.fromJson(json['Temperature']),
    );
  }
}
