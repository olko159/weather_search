import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:weather_search/data/mappings/city_dto.dart';
import 'dart:convert';

@injectable
class WeatherApiClient {
  static const baseUrl = 'http://dataservice.accuweather.com';
  static const apiKey = 'JyGyNk3EzAFiPzkwOvn3JwERGVyJevkV';
  http.Client httpClient = http.Client();

  WeatherApiClient();

  Future<List<CityDTO>> getCities(String query) async {
    final citiesUrl = Uri.parse(
        '$baseUrl/locations/v1/cities/search?q=$query&apikey=$apiKey');
    final citiesResponse = await httpClient.get(citiesUrl);
    if (citiesResponse.statusCode != 200) {
      throw Exception('error getting cities');
    }
    final citiesDTOs = jsonDecode(citiesResponse.body) as List<dynamic>;

    return citiesDTOs.map((item) => CityDTO.fromJson(item)).toList();
  }
}
