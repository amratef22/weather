import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/get_weather_cubit.dart';
import 'package:weather/cubits/get_weather_states.dart';
import 'package:weather/models/colors_model.dart';
import 'package:weather/view/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) =>
            BlocBuilder<GetWeatherCubit, WeatherStates>(
              builder: (context, state) {
                return MaterialApp(
                  theme: ThemeData(
                    appBarTheme: AppBarTheme(
                      color: getThemeColor(BlocProvider
                          .of<GetWeatherCubit>(context)
                          .weatherModel
                          ?.condition),
                    ),
                    primarySwatch: getThemeColor(BlocProvider
                        .of<GetWeatherCubit>(context)
                        .weatherModel
                        ?.condition),
                  ),
                  debugShowCheckedModeBanner: false,
                  home: const Home(),
                );
              },
            ),

      ),
    );
  }

}

