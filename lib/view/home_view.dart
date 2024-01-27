import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/get_weather_cubit.dart';
import 'package:weather/cubits/get_weather_states.dart';
import 'package:weather/view/no_weather_Page.dart';
import 'package:weather/view/search_Page.dart';
import 'package:weather/view/weather_info.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(

       centerTitle: true,
       title: const Text('Weather'),
       actions: [IconButton(
         onPressed: ()
         {
           Navigator.of(context)
               .push(MaterialPageRoute(builder: (context)
           {
             return const SearchView();
           },
           ),
           );
         },
         icon: const Icon(Icons.search),
       ),
       ],
     ),
     body: BlocBuilder <GetWeatherCubit,WeatherStates>
       (
       builder:(context,state)
       {
         if(state is WeatherInitialState)
         {
           return const NoWeatherView();
         }else if (state is WeatherLoadedState)
         {
           return  WeatherInfoView(weather: state.weatherModel,);
         }else
         {
           return const Center(
               child:  Text(
                   'Oops ‼️ There was an error 🚫',
                 style: TextStyle(
                   fontSize: 28,
                   fontWeight: FontWeight.bold,

                 ),

               ),
           );
         }
       } ,
     ),
   );

  }
}

