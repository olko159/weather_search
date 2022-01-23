import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/bloc/theme/theme_cubit.dart';
import 'app/bloc/theme/theme_state.dart';
import 'app/ui/widgets/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeCubit>(
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Weather Search',
            theme: state.theme,
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}
