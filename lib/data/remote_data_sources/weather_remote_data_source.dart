import 'package:dio/dio.dart';

class WeatherRemoteDataSource {
  Future<Map<String, dynamic>?> getWeatherData({
    required String city,
  }) async {
    try {
      final response = await Dio().get<Map<String, dynamic>>(
          'http://api.weatherapi.com/v1/current.json?key=2a37f87cc68c4047bd7184921231605&q=$city&aqi=no');
      //link z internetu, dio get jest temu bo chcemy zeby ta baza danych nam przeslala dane, trzeba pamietac o imporcie do dio
      return response.data;
    } on DioError catch (error) {
      throw Exception(
          error.response?.data['error']['message'] ?? 'Unknown error');
    }
  }
}
