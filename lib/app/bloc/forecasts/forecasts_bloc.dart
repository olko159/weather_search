import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_search/app/bloc/forecasts/forecasts_event.dart';
import 'package:weather_search/app/bloc/forecasts/forecasts_state.dart';
import 'package:weather_search/data/repositories/weather_repository.dart';
import 'package:weather_search/injection.dart';

class ForecastsBloc extends Bloc<ForecastsEvent, ForecastsState> {
  ForecastsBloc() : super(ForecastsLoading()) {
    on<FetchForecasts>((event, emit) async {
      try {
        final List<dynamic> futures = await Future.wait([
          getIt<WeatherRepository>().getForecasts(event.locationID),
          getIt<WeatherRepository>().getCurrentConditions(event.locationID),
        ]);

        emit(ForecastsLoaded(
          forecasts: futures[0],
          currentConditions: futures[1],
        ));
      } catch (_) {
        emit(ForecastsError());
      }
    });
  }
}
