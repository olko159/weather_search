import 'package:weather_search/core/model/city.dart';
import 'package:weather_search/data/repositories/weather_repository.dart';

const mockCities = <City>[
  City(
    id: '45345345',
    name: 'Odessa',
    country: 'Ukraine',
  ),
  City(
    id: '45345346',
    name: 'Odessa',
    country: 'USA',
  ),
];

class MockWeatherRepository implements IWeatherRepository {
  @override
  Future<List<City>> getCities(String query) async {
    return Future.delayed(
      const Duration(seconds: 2),
      () => mockCities,
    );
  }
}
