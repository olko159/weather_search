import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_search/app/resources/dimensions.dart';

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
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: Dimensions.mainPadding - 4,
                  ),
                  child: Center(
                    child: Text(
                      'Odessa',
                      style: headLine3,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: Dimensions.mainPadding - 12,
                  ),
                  child: Center(
                    child: Text(
                      'Today', //day
                      style: TextStyle(
                        color: secondaryHeaderColor,
                        fontSize: Dimensions.mainFontSize,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: Dimensions.mainPadding - 4,
                  ),
                  child: Center(
                    child: Text(
                      '10˚C', //curent temperature
                      style: TextStyle(
                        color: secondaryHeaderColor,
                        fontSize: Dimensions.largeFontSize,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Dimensions.largePadding,
                  ),
                  child: Divider(
                    color: secondaryHeaderColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 8,
                  ),
                  child: Center(
                    child: Text(
                      'Sunny', // weather
                      style: TextStyle(
                        color: secondaryHeaderColor,
                        fontSize: Dimensions.mainFontSize + 4,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: Dimensions.mainPadding - 4,
                    bottom: Dimensions.mainPadding - 2,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '-1˚C', // min temperature
                        style: TextStyle(
                          color: secondaryHeaderColor,
                          fontSize: Dimensions.mainFontSize,
                        ),
                      ),
                      Text(
                        '/',
                        style: TextStyle(
                          color: secondaryHeaderColor,
                          fontSize: Dimensions.mainFontSize,
                        ),
                      ),
                      Text(
                        '20˚C', //max temperature
                        style: TextStyle(
                          color: secondaryHeaderColor,
                          fontSize: Dimensions.mainFontSize,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Dimensions.mainPadding - 4,
                    vertical: Dimensions.mainPadding - 4,
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
                            padding: const EdgeInsets.only(
                              top: Dimensions.secondaryPadding,
                              left: Dimensions.secondaryPadding,
                            ),
                            child: Text(
                              '7-day forecast',
                              style: TextStyle(
                                color: secondaryHeaderColor,
                                fontSize: Dimensions.mainFontSize - 4,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Divider(
                          color: secondaryHeaderColor,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(
                            Dimensions.secondaryPadding - 6,
                          ),
                          child: Column(
                            children: [
                              buildSevenDayForecast(
                                "Today", //day
                                1, //min temperature
                                20, //max temperature
                                CupertinoIcons.cloud_fill, //weather icon
                                size,
                                secondaryHeaderColor,
                              ),
                              buildSevenDayForecast(
                                "Wed",
                                -5,
                                -5,
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
                                -3,
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
        ),
      ),
    );
  }

  Widget buildSevenDayForecast(
    String time,
    int minTemp,
    int maxTemp,
    IconData weatherIcon,
    Size size,
    Color secondaryHeaderColor,
  ) {
    return Padding(
      padding: const EdgeInsets.all(Dimensions.secondaryPadding - 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                flex: 2,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    time,
                    style: TextStyle(
                      color: secondaryHeaderColor,
                      fontSize: Dimensions.secondaryFontSize,
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 2,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Icon(
                    weatherIcon,
                    color: secondaryHeaderColor,
                    size: Dimensions.mainFontSize,
                  ),
                ),
              ),
              Flexible(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    '$minTemp˚C',
                    style: TextStyle(
                      color: secondaryHeaderColor,
                      fontSize: Dimensions.secondaryFontSize,
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 2,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    '$maxTemp˚C',
                    style: TextStyle(
                      color: secondaryHeaderColor,
                      fontSize: Dimensions.secondaryFontSize,
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
