import 'package:bloc_test/bloc_test.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_search/app/bloc/cities/cities_bloc.dart';
import 'package:weather_search/app/bloc/cities/cities_event.dart';
import 'package:weather_search/app/bloc/cities/cities_state.dart';
import 'package:weather_search/data/repositories/weather_repository.dart';

import 'mock_weather_repository.dart';

void main() {
  group('CitiesBloc', () {
    late CitiesBloc bloc;
    IWeatherRepository weatherRepository;

    setUp(() {
      EquatableConfig.stringify = true;
      weatherRepository = MockWeatherRepository();
      bloc = CitiesBloc(weatherRepository);
    });

    blocTest<CitiesBloc, CitiesState>(
      'emits [] when nothing is added',
      build: () => bloc,
      expect: () => [],
    );

    blocTest<CitiesBloc, CitiesState>(
      'emits [CitiesLoading, CitiesLoaded] when FectchCities added',
      build: () => bloc,
      act: (CitiesBloc bloc) => bloc.add(FetchCities(query: 'Odessa')),
      expect: () => [
        CitiesLoading(),
        CitiesLoaded(cities: mockCities),
      ],
      wait: const Duration(seconds: 2),
    );

    tearDown(() {
      bloc.close();
    });
  });
}
