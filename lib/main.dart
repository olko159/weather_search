import 'package:flutter/material.dart';
import 'package:weather_search/app/navigation/location_builder.dart';

import 'app/resources/theme_data.dart';
import 'package:beamer/beamer.dart';

import 'injection.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Weather Search',
      theme: lightAppTheme,
      darkTheme: darkAppTheme,
      themeMode: ThemeMode.system,
      routerDelegate: weatherRouterDelegate,
      routeInformationParser: BeamerParser(),
    );
  }
}
