import 'package:flutter/material.dart';

import 'theme_data.dart';

class ThemeState {
  final bool isDarkThemeOn;
  late ThemeData theme;
  ThemeState({required this.isDarkThemeOn}) {
    if (isDarkThemeOn) {
      theme = appThemeData[AppTheme.DarkAppTheme]!;
    } else {
      theme = appThemeData[AppTheme.LightAppTheme]!;
    }
  }

  ThemeState copyWith({required bool changeState}) {
    return ThemeState(isDarkThemeOn: changeState);
  }
}
