import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
          ),
          Column(
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
                        style: Theme.of(context).textTheme.headline3,
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
                        color: Theme.of(context).primaryColor),
                    Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Text(
                          'Loading...',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headline2,
                        )),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
