import 'package:bloc/bloc.dart';

import './theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState(isDarkThemeOn: false));

  void toggleSwitch(bool value) => emit(state.copyWith(changeState: value));
}
