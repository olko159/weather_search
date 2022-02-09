import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

class WeatherList extends StatefulWidget {
  const WeatherList({Key? key}) : super(key: key);

  @override
  _WeatherListState createState() => _WeatherListState();
}

class _WeatherListState extends State<WeatherList> {
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
              padding: const EdgeInsets.all(12.0),
              child: TextField(
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
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  GestureDetector(
                    onTap: () => context.beamToNamed('/weather/something'),
                    child: Card(
                      margin: const EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      color: cardColor,
                      child: ListTile(
                          contentPadding: const EdgeInsets.all(5),
                          leading: Column(children: [
                            Text('Odessa', style: headLine3),
                          ]),
                          trailing: Column(
                            children: [
                              Text(
                                '4°',
                                style: headLine3,
                              )
                            ],
                          )),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
