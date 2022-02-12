abstract class ForecastsEvent {
  ForecastsEvent([List props = const []]);
}

class FetchForecasts extends ForecastsEvent {
  final String locationID;

  FetchForecasts({required this.locationID});
}
