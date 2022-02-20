import 'package:bloc/bloc.dart';
import 'package:weather_search/core/model/city.dart';
import 'package:weather_search/data/repositories/weather_repository.dart';
import 'package:weather_search/injection.dart';

import 'cities_event.dart';
import 'cities_state.dart';

class CitiesBloc extends Bloc<CitiesEvent, CitiesState> {
  CitiesBloc() : super(CitiesEmpty()) {
    on<FetchCities>((event, emit) async {
      emit(CitiesLoading());
      try {
        final List<City> cities =
            await getIt<WeatherRepository>().getCities(event.query);
        emit(CitiesLoaded(cities: cities));
      } catch (error) {
        emit(CitiesError(error: error as Exception));
      }
    });
  }
}
