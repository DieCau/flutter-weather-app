import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/features/home/ui/bloc/weather_bloc/weather_bloc.dart';

class SunriseWidget extends StatelessWidget {
  const SunriseWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        if (state is WeatherStateSucces) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/11.png',
                    scale: 8,
                  ),
                  const SizedBox(width: 3),
                  Column(
                    children: [
                      const Text(
                        "Sunrise",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        DateFormat().add_jm().format(state.weather.sunrise!),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Image.asset(
                    'assets/12.png',
                    scale: 8,
                  ),
                  const SizedBox(width: 3),
                  Column(
                    children: [
                      const Text(
                        "Sunset",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        DateFormat().add_jm().format(state.weather.sunrise!),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          );
        } else {
          return Container();
        }
      },
    );
  }
}
