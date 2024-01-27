import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/get_weather_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Search City',),
      ),
      body:  Padding(
        padding:  const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child:  TextField(
            onSubmitted: (value)
            async{
              var cubit = BlocProvider.of<GetWeatherCubit>(context);
              cubit.getWeather(cityName: value);
             Navigator.pop(context);
            },
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                vertical: 32,
                horizontal: 16,
              ),
              labelText: 'search',
              suffixIcon: Icon(Icons.search),
              hintText: 'Enter City Name',
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ),
    );
  }
}
