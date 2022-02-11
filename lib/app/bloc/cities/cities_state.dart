import 'package:weather_search/core/model/city.dart';

abstract class CitiesState {
  CitiesState([List props = const []]);
}

class CitiesEmpty extends CitiesState {}

class CitiesLoading extends CitiesState {}

class CitiesLoaded extends CitiesState {
  final List<City> cities;

  CitiesLoaded({required this.cities});
}

class CitiesError extends CitiesState {}
