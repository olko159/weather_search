import 'package:weather_search/core/model/city.dart';

abstract class CitiesState {}

class CitiesEmpty extends CitiesState {}

class CitiesLoading extends CitiesState {}

class CitiesLoaded extends CitiesState {
  final List<City> cities;

  CitiesLoaded({required this.cities});
}

class CitiesError extends CitiesState {
  final Exception error;
  CitiesError({required this.error});
}
