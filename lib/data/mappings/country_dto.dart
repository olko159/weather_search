class CountryDTO {
  final String ID;
  final String LocalizedName;
  CountryDTO({
    required this.ID,
    required this.LocalizedName,
  });
  factory CountryDTO.fromJson(dynamic json) {
    return CountryDTO(
      ID: json['ID'],
      LocalizedName: json['LocalizedName'],
    );
  }
}
