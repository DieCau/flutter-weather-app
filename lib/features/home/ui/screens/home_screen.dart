import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/features/home/ui/bloc/weather_bloc/weather_bloc.dart';
import 'package:weather_app/features/home/ui/widgets/sunrise_widget.dart';
import 'package:weather_app/features/home/ui/widgets/temp_widget.dart';
import 'package:weather_app/shared/location/position_bloc/poistion_bloc.dart';

class HomeScreen extends StatefulWidget {
  static const name = "home_screen";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PoistionBloc()..add(FecthPosition()),
        ),
        BlocProvider(
          create: (context) => WeatherBloc(),
        ),
      ],
      child: HomeViewBloc(size: size),
    );
  }
}

class HomeViewBloc extends StatelessWidget {
  const HomeViewBloc({
    super.key,
    required this.size,
  });

  final Size size;

  Widget getWeatherIcon(int code) {
    switch (code) {
      case >= 200 && < 300:
        return Image.asset('assets/1.png');
      case >= 300 && < 400:
        return Image.asset('assets/2.png');
      case >= 500 && < 600:
        return Image.asset('assets/3.png');
      case >= 600 && < 700:
        return Image.asset('assets/4.png');
      case >= 700 && < 800:
        return Image.asset('assets/5.png');
      case == 800:
        return Image.asset('assets/6.png');
      case > 800 && <= 804:
        return Image.asset('assets/7.png');
      default:
        return Image.asset('assets/7.png');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PoistionBloc, PoistionState>(
      listener: (context, state) {
        if (state is PoistionSuccesState) {
          context.read<WeatherBloc>().add(FetchWeather(position: state.position));
        }
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarBrightness: Brightness.dark,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, kToolbarHeight, kToolbarHeight, 20),
          child: SizedBox(
            height: size.height,
            child: Stack(
              children: [
                Align(
                  alignment: const AlignmentDirectional(3, -0.3),
                  child: Container(
                    height: 300,
                    width: 300,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Color.fromARGB(255, 103, 58, 183)),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(-3, -0.3),
                  child: Container(
                    height: 300,
                    width: 300,
                    decoration:
                        const BoxDecoration(shape: BoxShape.circle, color: Colors.deepPurple),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0, -1),
                  child: Container(
                    height: 300,
                    width: 300,
                    decoration: const BoxDecoration(
                      color: Color(
                        0XFFFFAB40,
                      ),
                    ),
                  ),
                ),
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                    ),
                  ),
                ),
                BlocBuilder<WeatherBloc, WeatherState>(
                  builder: (context, state) {
                    if (state is WeatherStateLoading) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Color(
                            0XFFFFAB40,
                          ),
                        ),
                      );
                    }
                    if (state is WeatherStateSucces) {
                      return SizedBox(
                        height: double.infinity,
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              "📍 ${state.weather.areaName}",
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            const Text(
                              "Good Morning",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            getWeatherIcon(state.weather.weatherConditionCode!),
                            Text(
                              "${state.weather.temperature!.celsius!.round()}˚C",
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 55,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 12),
                            Text(
                              state.weather.weatherMain!,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 25,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              DateFormat('EEEE dd *').add_jm().format(state.weather.date!),
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                                fontSize: 16,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 12),
                            const SunriseWidget(),
                            const Divider(
                              color: Colors.grey,
                            ),
                            const TempWidget(),
                          ],
                        ),
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
