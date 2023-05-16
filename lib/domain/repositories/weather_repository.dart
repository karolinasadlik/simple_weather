import 'package:simple_weather/domain/models/weather_model.dart';

import '../../data/remote_data_sources/weather_remote_data_source.dart';

class WeatherRepository {
  WeatherRepository(this._weatherRemoteDataSource); //konstraktor

  final WeatherRemoteDataSource _weatherRemoteDataSource; //zmienna

  Future<WeatherModel?> getWeatherModel({
    required String city,
  }) async {
    final responseData = await _weatherRemoteDataSource.getWeatherData(
      city: city,
    );
    if (responseData == null) {
      return null;
    }
    final name = responseData['location']['name'] as String;
    final temperature = (responseData['current']['temp_c'] + 0.0)
        as double; // chcemy zeby wyswietlalo inty i double bo temp moze miec jedna lub dwie cyfry
    // te finals powyżej odnosz się do danych z rest api z internetu, każdy z nich ma swoją grupę i trzeba podać ich przynależność

    return WeatherModel(city: name, temperature: temperature);
  }
}
