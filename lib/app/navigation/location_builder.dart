import 'package:weather_search/app/ui/widgets/screens/splash_screen.dart';
import 'package:weather_search/app/ui/widgets/screens/weather_details.dart';
import 'package:weather_search/app/ui/widgets/screens/weather_list.dart';
import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

final weatherLocationBuilder = RoutesLocationBuilder(
  routes: {
    '/': (context, state, data) => const SplashScreen(),
    '/weather': (context, state, data) => const WeatherList(),
    '/weather/:forecastId': (context, state, data) {
      final forecastId = state.pathParameters['forecastId']!;

      return BeamPage(
        key: ValueKey(forecastId),
        title: forecastId,
        child: const WeatherDetails(),
      );
    }
  },
);

final weatherRouterDelegate =
    BeamerDelegate(locationBuilder: weatherLocationBuilder);
