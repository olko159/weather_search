import 'package:weather_search/app/ui/widgets/screens/splash_screen.dart';
import 'package:weather_search/app/ui/widgets/screens/weather_details.dart';
import 'package:weather_search/app/ui/widgets/screens/weather_list.dart';
import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:weather_search/core/model/city.dart';

final weatherLocationBuilder = RoutesLocationBuilder(
  routes: {
    '/': (context, state, data) => const SplashScreen(),
    '/weather': (context, state, data) => const WeatherList(),
    '/weather/forecasts': (context, state, data) {
      final city = data as City;
      return BeamPage(
        key: ValueKey(city.id),
        child: WeatherDetails(
          locationId: city.id,
          cityName: city.name,
        ),
      );
    }
  },
);

final weatherRouterDelegate =
    BeamerDelegate(locationBuilder: weatherLocationBuilder);
