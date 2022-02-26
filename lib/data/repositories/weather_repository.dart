import 'package:injectable/injectable.dart';
import 'package:weather_search/core/model/city.dart';
import 'package:weather_search/core/model/current_conditions.dart';
import 'package:weather_search/core/model/forecast.dart';
import 'package:weather_search/data/repositories/weather_api_client.dart';

abstract class IWeatherRepository {
  Future<List<City>> getCities(String query);
}

@injectable
class WeatherRepository implements IWeatherRepository {
  final WeatherApiClient weatherApiClient;

  WeatherRepository({required this.weatherApiClient});

  @override
  Future<List<City>> getCities(String query) async {
    final citiesDTO = await weatherApiClient.getCities(query);
    return citiesDTO
        .map(
          (c) => City(
            id: c.Key,
            name: c.LocalizedName,
            country: c.Country.LocalizedName,
          ),
        )
        .toList();
  }

  Future<List<Forecast>> getForecasts(String locationId) async {
    final forecastsDTO = await weatherApiClient.getForecasts(locationId);
    return forecastsDTO
        .map(
          (f) => Forecast(
            date: f.EpochDate,
            minTemperature: f.Temperature.Minimum.Value,
            maxTemperature: f.Temperature.Maximum.Value,
          ),
        )
        .toList();
  }

  Future<CurrentConditions> getCurrentConditions(String locationId) async {
    final currentConditionsDTO =
        await weatherApiClient.getCurrentConditions(locationId);
    return CurrentConditions(
      date: currentConditionsDTO.EpochTime,
      weatherState: currentConditionsDTO.WeatherText,
      temperature: currentConditionsDTO.Temperature.Metric.Value,
    );
  }
}
