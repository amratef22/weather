import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/get_weather_states.dart';
import 'package:weather/models/weather_model.dart';
import '../servies/weather_services.dart';

class GetWeatherCubit extends Cubit <WeatherStates>{
  GetWeatherCubit() : super(WeatherInitialState());

  WeatherModel? weatherModel;
  getWeather({required String cityName})
  async {
    try {
       weatherModel =
      await  WeatherServices(Dio()).getCurrentWeather(cityName: cityName);
      emit(WeatherLoadedState(weatherModel!));
    }catch (e)
    {
      emit(WeatherFailureState());
    }

  }
}