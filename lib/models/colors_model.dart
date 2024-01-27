import 'package:flutter/material.dart';

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.grey;
  }
  switch (condition) {
    case 'Partly cloudy':
      return Colors.cyan;
    case 'Sunny':
      return Colors.orange;
    case 'Heavy snow':
    case 'Patchy snow possible':
    case 'Patchy sleet possible':
    case 'Patchy freezing drizzle possible':
    case 'Blowing snow':
    case 'Blizzard':
    case 'Thundery outbreaks possible':
      return Colors.blue;
    case 'Cloudy':
    case 'Overcast':
    case 'Mist':
    case 'Fog':
    case 'Patchy rain possible':
      return Colors.grey;
    default:
      return Colors.blue;
  }
}