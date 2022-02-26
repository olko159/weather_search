import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:weather_search/core/model/city.dart';

@immutable
abstract class CitiesState extends Equatable {
  @override
  List<Object> get props => [];
}

class CitiesEmpty extends CitiesState {}

class CitiesLoading extends CitiesState {}

class CitiesLoaded extends CitiesState {
  final List<City> cities;
  CitiesLoaded({required this.cities});

  @override
  List<Object> get props => [...cities];
}

class CitiesError extends CitiesState {
  final Exception error;
  CitiesError({required this.error});
}
