import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:weather/models/weather_model.dart';

class WeatherServices
{
  final String baseUrl= 'http://api.weatherapi.com/v1';
  final String apiKey= '6401e6191d564859b4e112116240101';
  final Dio dio;
  WeatherServices(this.dio);


  Future<WeatherModel> getCurrentWeather({required cityName})
  async{
   try {
     Response response= await dio.get(
          '$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');

     WeatherModel weatherModel = WeatherModel.fromJson(response.data);
     return weatherModel;
   }on DioException catch (error)
   {
    final String errorMessage = error.response?.data['error']['message']?? 'Oops there was an error ! please try later';
     throw Exception(errorMessage);
   } catch (error){
     log(error.toString());
     throw Exception('Oops there was an error ! please try later');
   }
  }
}
