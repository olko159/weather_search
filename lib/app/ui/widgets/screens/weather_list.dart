import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_search/app/bloc/cities/cities_bloc.dart';
import 'package:weather_search/app/bloc/cities/cities_event.dart';
import 'package:weather_search/app/bloc/cities/cities_state.dart';
import 'package:weather_search/app/resources/dimensions.dart';

class WeatherList extends StatefulWidget {
  const WeatherList({Key? key}) : super(key: key);

  @override
  _WeatherListState createState() => _WeatherListState();
}

class _WeatherListState extends State<WeatherList> {
  late CitiesBloc _citiesBloc;
  late TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _citiesBloc = CitiesBloc();
    _textController = TextEditingController();
  }

  @override
  void dispose() {
    _citiesBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextStyle headLine3 = themeData.textTheme.headline3!;
    final Color backgroundColor = themeData.backgroundColor;
    final Color secondaryHeaderColor = themeData.secondaryHeaderColor;
    final Color primaryColor = themeData.primaryColor;
    final Color cardColor = themeData.cardColor;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(Dimensions.mainPadding - 8),
              child: TextField(
                controller: _textController,
                style: TextStyle(color: secondaryHeaderColor),
                cursorColor: secondaryHeaderColor,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    size: 20,
                    color: secondaryHeaderColor,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: primaryColor, width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: primaryColor, width: 2.0),
                  ),
                  hintText: "Search for a city...",
                ),
                onSubmitted: (String value) async {
                  _citiesBloc.add(FetchCities(query: value));
                },
              ),
            ),
            BlocBuilder(
              bloc: _citiesBloc,
              builder: (event, state) {
                if (state is CitiesLoading) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: secondaryHeaderColor,
                    ),
                  );
                }
                if (state is CitiesLoaded) {
                  final cities = state.cities;

                  return Expanded(
                    child: ListView.builder(
                      itemCount: cities.length,
                      itemBuilder: (ctx, index) {
                        return GestureDetector(
                          key: ValueKey(cities[index].id),
                          onTap: () {
                            context.beamToNamed(
                              '/weather/forecasts',
                              data: cities[index],
                            );
                          },
                          child: Card(
                            margin: const EdgeInsets.all(10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            color: cardColor,
                            child: ListTile(
                              contentPadding: const EdgeInsets.all(
                                Dimensions.secondaryPadding - 3,
                              ),
                              leading: Column(children: [
                                Text(
                                  cities[index].name,
                                  style: headLine3,
                                ),
                              ]),
                              trailing: Column(children: [
                                Text(
                                  cities[index].country,
                                  style: headLine3,
                                ),
                              ]),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
                if (state is CitiesError) {
                  return const Text(
                    'Something went wrong!',
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  );
                }

                return Center(
                  child: Text(
                    'Please Select a City',
                    style: TextStyle(
                      color: secondaryHeaderColor,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
