import 'package:weather_search/core/model/current_conditions.dart';
import 'package:weather_search/core/model/forecast.dart';

abstract class ForecastsState {}

class ForecastsEmpty extends ForecastsState {}

class ForecastsLoading extends ForecastsState {}

class ForecastsLoaded extends ForecastsState {
  final List<Forecast> forecasts;
  final CurrentConditions currentConditions;

  ForecastsLoaded({
    required this.forecasts,
    required this.currentConditions,
  });
}

class ForecastsError extends ForecastsState {
  final Exception error;
  ForecastsError({required this.error});
}
