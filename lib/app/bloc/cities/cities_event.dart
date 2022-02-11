abstract class CitiesEvent {
  CitiesEvent([List props = const []]);
}

class FetchCities extends CitiesEvent {
  final String query;

  FetchCities({required this.query});
}
