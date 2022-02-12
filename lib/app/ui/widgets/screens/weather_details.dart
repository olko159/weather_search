import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_search/app/bloc/forecasts/forecasts_bloc.dart';
import 'package:weather_search/app/bloc/forecasts/forecasts_event.dart';
import 'package:weather_search/app/bloc/forecasts/forecasts_state.dart';
import 'package:weather_search/app/resources/dimensions.dart';

class WeatherDetails extends StatefulWidget {
  final String cityName;
  final String locationId;
  const WeatherDetails({
    Key? key,
    required this.cityName,
    required this.locationId,
  }) : super(key: key);

  @override
  _WeatherDetailsState createState() => _WeatherDetailsState();
}

class _WeatherDetailsState extends State<WeatherDetails> {
  late ForecastsBloc _forecastsBloc;

  @override
  void initState() {
    super.initState();
    _forecastsBloc = ForecastsBloc();
    _forecastsBloc.add(FetchForecasts(locationID: widget.locationId));
  }

  @override
  void dispose() {
    _forecastsBloc.close();
    super.dispose();
  }

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
          child: BlocBuilder(
            bloc: _forecastsBloc,
            builder: (event, state) {
              if (state is ForecastsLoading) {
                return CircularProgressIndicator(
                  color: secondaryHeaderColor,
                );
              }
              if (state is ForecastsLoaded) {
                final forecasts = state.forecasts;
                final currentCondtions = state.currentConditions;

                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: Dimensions.mainPadding - 4,
                        ),
                        child: Center(
                          child: Text(
                            widget.cityName,
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
                            'Today',
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
                            '${currentCondtions.temperature.round()}˚C', //curent temperature
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
                            currentCondtions.weatherState, // weather
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
                              '${forecasts[0].minTemperature.round()}˚C', // min temperature
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
                              '${forecasts[0].maxTemperature.round()}˚C', //max temperature
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
                                    for (var forecast in forecasts)
                                      buildSevenDayForecast(
                                        forecast.date, //day
                                        forecast
                                            .minTemperature, //min temperature
                                        forecast
                                            .maxTemperature, //max temperature
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
                );
              }
              if (state is ForecastsError) {
                return const Text(
                  'Something went wrong!',
                  style: TextStyle(
                    color: Colors.red,
                  ),
                );
              }

              return Container();
            },
          ),
        ),
      ),
    );
  }

  Widget buildSevenDayForecast(
    String time,
    double minTemp,
    double maxTemp,
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
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    '${minTemp.round()}˚C',
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
                    '${maxTemp.round()}˚C',
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
