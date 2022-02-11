import 'package:injectable/injectable.dart';
import 'package:weather_search/core/model/city.dart';
import 'package:weather_search/data/repositories/weather_api_client.dart';

@injectable
class WeatherRepository {
  final WeatherApiClient weatherApiClient;

  WeatherRepository({required this.weatherApiClient});

  Future<List<City>> getCities(String query) async {
    final citiesDTO = await weatherApiClient.getCities(query);
    return citiesDTO
        .map((c) => City(
            id: c.Key, name: c.LocalizedName, country: c.Country.LocalizedName))
        .toList();
  }
}
