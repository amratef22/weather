import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/get_weather_cubit.dart';
import 'package:weather/models/colors_model.dart';
import 'package:weather/models/weather_model.dart';

class WeatherInfoView extends StatelessWidget {
  const WeatherInfoView({super.key, required this.weather});
  final WeatherModel weather;
  @override
  Widget build(BuildContext context) {
   WeatherModel weatherModel = BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    return  Scaffold(
      body:  Container(
        decoration: BoxDecoration(
          gradient: LinearGradient
            (colors:
          [
            getThemeColor(weatherModel.condition),
            getThemeColor(weatherModel.condition)[300]!,
            getThemeColor(weatherModel.condition)[50]!,
          ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,

          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:
              [
                Text(
                  weatherModel.cityName,
                  style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                  ),
                ),
                 const SizedBox(height: 12,),
                 Text(
                  'Last Update at : ${weatherModel.time.hour}:${weatherModel.time.minute}',
                  style: const TextStyle(fontSize: 24,),),
                const SizedBox(height: 25,),
                 Row(
                  children:
                  [
                    Image.network(
                        'https:${weatherModel.image}',
                    ),
                    const Spacer(flex: 1,),
                     Text(
                       '${weatherModel.temp.round()}°C',
                       style: const TextStyle(
                           fontSize: 30,
                           fontWeight: FontWeight.bold,
                       ),
                     ),
                    const Spacer(flex: 1,),
                     Column(
                      children:
                      [
                        Text('MaxTemp : ${weatherModel.maxTemp.round()} °C',),
                        Text('MinTemp : ${weatherModel.minTemp.round()} °C',),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 25,),
                 Text(
                  weatherModel.condition,
                  style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
