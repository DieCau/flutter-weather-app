import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherStateInitial()) {
    on<FetchWeather>((event, emit) async {
      emit(WeatherStateLoading());
      try {
        WeatherFactory wf = WeatherFactory(const String.fromEnvironment('WEATHER_API_KEY'),
            language: Language.SPANISH);
        Weather weather = await wf.currentWeatherByLocation(
          event.position.latitude,
          event.position.longitude,
        );

        emit(
          WeatherStateSucces(weather: weather),
        );
      } catch (_) {
        emit(
          WeatherStateFailure(),
        );
      }
    });
  }
}
