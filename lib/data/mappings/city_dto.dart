import 'package:weather_search/data/mappings/country_dto.dart';

class CityDTO {
  final String Key;
  final String LocalizedName;
  final CountryDTO Country;
  CityDTO({
    required this.Key,
    required this.LocalizedName,
    required this.Country,
  });
  factory CityDTO.fromJson(dynamic json) {
    return CityDTO(
      Key: json['Key'],
      LocalizedName: json['LocalizedName'],
      Country: CountryDTO.fromJson(json['Country']),
    );
  }
}
