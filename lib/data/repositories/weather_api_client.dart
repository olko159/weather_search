import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:weather_search/data/mappings/city/city_dto.dart';
import 'package:weather_search/data/mappings/current_conditions/current_conditions_dto.dart';
import 'dart:convert';

import 'package:weather_search/data/mappings/forecast/forecast_dto.dart';

@injectable
class WeatherApiClient {
  static const baseUrl = 'http://dataservice.accuweather.com';
  static const apiKey = 'KZDijGNnxREsCUzY4yfkQrrDKHotbsc4';

  Future<List<CityDTO>> getCities(String query) async {
    final citiesUrl = Uri.parse(
        '$baseUrl/locations/v1/cities/search?q=$query&apikey=$apiKey');
    final response = await http.get(citiesUrl);
    _handleErrors(response);
    final citiesDTOs = jsonDecode(response.body) as List<dynamic>;

    return citiesDTOs.map((item) => CityDTO.fromJson(item)).toList();
  }

  Future<List<ForecastDTO>> getForecasts(String locationId) async {
    final forecastsUrl = Uri.parse(
      '$baseUrl/forecasts/v1/daily/5day/$locationId?apikey=$apiKey&metric=true',
    );
    final response = await http.get(forecastsUrl);
    _handleErrors(response);
    final forecastsDTOs =
        jsonDecode(response.body)?['DailyForecasts'] as List<dynamic>?;

    return forecastsDTOs?.map((item) => ForecastDTO.fromJson(item)).toList() ??
        [];
  }

  Future<CurrentConditionsDTO> getCurrentConditions(String locationId) async {
    final url = Uri.parse(
      '$baseUrl/currentconditions/v1/$locationId?apikey=$apiKey',
    );
    final response = await http.get(url);
    _handleErrors(response);
    final currentConditionsDTO = jsonDecode(response.body)?[0] as Map?;

    return CurrentConditionsDTO.fromJson(currentConditionsDTO);
  }

  void _handleErrors(http.Response response) {
    if (response.statusCode != 200) {
      final errorBody = jsonDecode(response.body);
      throw Exception(errorBody['Message']);
    }
  }
}
