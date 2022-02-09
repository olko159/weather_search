import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
//temporary
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 1),
      () => context.beamToNamed('/weather'),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextStyle headLine2 = themeData.textTheme.headline2!;
    final TextStyle headLine3 = themeData.textTheme.headline3!;
    final Color backgroundColor = themeData.backgroundColor;
    final Color primaryColor = themeData.primaryColor;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(
                      width: 200,
                      height: 200,
                      child: RiveAnimation.asset(
                        'assets/weather_splash.riv',
                        animations: ['Complex ainmation 1'],
                      )),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      'Weather Search',
                      style: headLine3,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator(
                    color: primaryColor,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Text(
                        'Loading...',
                        textAlign: TextAlign.center,
                        style: headLine2,
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
