import 'package:equatable/equatable.dart';

class City extends Equatable {
  final String id;
  final String name;
  final String? country;

  const City({
    required this.id,
    required this.name,
    this.country,
  });

  @override
  List<Object?> get props => [id, name, country];
}
