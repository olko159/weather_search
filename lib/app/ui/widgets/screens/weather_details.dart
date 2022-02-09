import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WeatherDetails extends StatefulWidget {
  const WeatherDetails({Key? key}) : super(key: key);

  @override
  _WeatherDetailsState createState() => _WeatherDetailsState();
}

class _WeatherDetailsState extends State<WeatherDetails> {
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextStyle headLine3 = themeData.textTheme.headline3!;
    final Color backgroundColor = themeData.backgroundColor;
    final Color secondaryHeaderColor = themeData.secondaryHeaderColor;
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: Container(
          height: size.height,
          width: size.height,
          decoration: BoxDecoration(
            color: backgroundColor,
          ),
          child: SafeArea(
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: size.height * 0.03,
                        ),
                        child: Center(
                          child: Text(
                            'Odessa',
                            style: headLine3,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: size.height * 0.005,
                        ),
                        child: Center(
                          child: Text(
                            'Today', //day
                            style: TextStyle(
                              color: secondaryHeaderColor,
                              fontSize: size.height * 0.035,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: size.height * 0.03,
                        ),
                        child: Center(
                          child: Text(
                            '10˚C', //curent temperature
                            style: TextStyle(
                              color: secondaryHeaderColor,
                              fontSize: size.height * 0.13,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.25),
                        child: Divider(
                          color: secondaryHeaderColor,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: size.height * 0.005,
                        ),
                        child: Center(
                          child: Text(
                            'Sunny', // weather
                            style: TextStyle(
                              color: secondaryHeaderColor,
                              fontSize: size.height * 0.03,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: size.height * 0.03,
                          bottom: size.height * 0.01,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '-1˚C', // min temperature
                              style: TextStyle(
                                color: secondaryHeaderColor,
                                fontSize: size.height * 0.03,
                              ),
                            ),
                            Text(
                              '/',
                              style: TextStyle(
                                color: secondaryHeaderColor,
                                fontSize: size.height * 0.03,
                              ),
                            ),
                            Text(
                              '20˚C', //max temperature
                              style: TextStyle(
                                color: secondaryHeaderColor,
                                fontSize: size.height * 0.03,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.05,
                          vertical: size.height * 0.02,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                            color: Colors.white.withOpacity(0.05),
                          ),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    top: size.height * 0.02,
                                    left: size.width * 0.03,
                                  ),
                                  child: Text(
                                    '7-day forecast',
                                    style: TextStyle(
                                      color: secondaryHeaderColor,
                                      fontSize: size.height * 0.025,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Divider(
                                color: secondaryHeaderColor,
                              ),
                              Padding(
                                padding: EdgeInsets.all(size.width * 0.005),
                                child: Column(
                                  children: [
                                    buildSevenDayForecast(
                                        "Today", //day
                                        1, //min temperature
                                        20, //max temperature
                                        CupertinoIcons
                                            .cloud_fill, //weather icon
                                        size,
                                        secondaryHeaderColor),
                                    buildSevenDayForecast(
                                      "Wed",
                                      -5,
                                      5,
                                      CupertinoIcons.sun_max,
                                      size,
                                      secondaryHeaderColor,
                                    ),
                                    buildSevenDayForecast(
                                      "Thu",
                                      -2,
                                      7,
                                      CupertinoIcons.cloud_rain_fill,
                                      size,
                                      secondaryHeaderColor,
                                    ),
                                    buildSevenDayForecast(
                                      "Fri",
                                      3,
                                      10,
                                      CupertinoIcons.sun_max,
                                      size,
                                      secondaryHeaderColor,
                                    ),
                                    buildSevenDayForecast(
                                      "San",
                                      5,
                                      12,
                                      CupertinoIcons.sun_max,
                                      size,
                                      secondaryHeaderColor,
                                    ),
                                    buildSevenDayForecast(
                                      "Sun",
                                      4,
                                      7,
                                      CupertinoIcons.cloud_fill,
                                      size,
                                      secondaryHeaderColor,
                                    ),
                                    buildSevenDayForecast(
                                      "Mon",
                                      -2,
                                      1,
                                      CupertinoIcons.snow,
                                      size,
                                      secondaryHeaderColor,
                                    ),
                                    buildSevenDayForecast(
                                      "Tues",
                                      0,
                                      3,
                                      CupertinoIcons.cloud_rain_fill,
                                      size,
                                      secondaryHeaderColor,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSevenDayForecast(String time, int minTemp, int maxTemp,
      IconData weatherIcon, Size size, Color secondaryHeaderColor) {
    return Padding(
      padding: EdgeInsets.all(
        size.height * 0.005,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.02,
                ),
                child: Text(
                  time,
                  style: TextStyle(
                    color: secondaryHeaderColor,
                    fontSize: size.height * 0.025,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.25,
                ),
                child: Icon(
                  weatherIcon,
                  color: secondaryHeaderColor,
                  size: size.height * 0.03,
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: size.width * 0.15,
                  ),
                  child: Text(
                    '$minTemp˚C',
                    style: TextStyle(
                      color: secondaryHeaderColor,
                      fontSize: size.height * 0.025,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.05,
                  ),
                  child: Text(
                    '$maxTemp˚C',
                    style: TextStyle(
                      color: secondaryHeaderColor,
                      fontSize: size.height * 0.025,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Divider(
            color: secondaryHeaderColor,
          ),
        ],
      ),
    );
  }
}
