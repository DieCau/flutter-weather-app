part of 'weather_bloc.dart';

sealed class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

final class WeatherStateInitial extends WeatherState {}

final class WeatherStateLoading extends WeatherState {}

final class WeatherStateFailure extends WeatherState {}

final class WeatherStateSucces extends WeatherState {
  final Weather weather;

  const WeatherStateSucces({required this.weather});
  @override
  List<Object> get props => [weather];
}
