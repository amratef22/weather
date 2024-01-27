import 'package:flutter/material.dart';
import 'package:weather/view/search_Page.dart';

class NoWeatherView extends StatelessWidget {
  const NoWeatherView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
          [
           Text('No Weather Found 😔',style: TextStyle(fontSize: 30,),),
           SizedBox(height: 8,),
           Text('Start Searching Now 🔎',style: TextStyle(fontSize: 30,),)
          ],
        ),
      ),
    );
  }
}
