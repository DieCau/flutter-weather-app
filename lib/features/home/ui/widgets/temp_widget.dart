import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/home/ui/bloc/weather_bloc/weather_bloc.dart';

class TempWidget extends StatelessWidget {
  const TempWidget({
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
                    'assets/13.png',
                    scale: 8,
                  ),
                  const SizedBox(width: 3),
                  Column(
                    children: [
                      const Text(
                        "Temp Max",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        "${state.weather.tempMax!.celsius!.round().toString()}˚C",
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
                    'assets/14.png',
                    scale: 8,
                  ),
                  const SizedBox(width: 3),
                  Column(
                    children: [
                      const Text(
                        "Temp Min",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        "${state.weather.tempMin!.celsius!.round().toString()}˚C",
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
