import 'package:hive/hive.dart';

part 'hive_location.g.dart';

@HiveType(typeId: 0)
class HiveLocation extends HiveObject {
  HiveLocation({
    required this.locationId,
    required this.cityName,
  });

  @HiveField(0)
  String locationId;

  @HiveField(1)
  String cityName;
}
