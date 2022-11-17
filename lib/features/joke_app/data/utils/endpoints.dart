
import 'package:dio/dio.dart';

class EndPointConfig {
  EndPointConfig._();

  static BaseOptions baseOptions = BaseOptions(
    baseUrl: EndPointConfig.baseUrl,
    receiveDataWhenStatusError: true,
    headers: {
      'content-type' : 'application/json',
    },
    connectTimeout: 60*1000,
    receiveTimeout: 60*1000,
  );

  static Options options = Options(
    headers: {
      'content-type' : 'application/json',
    },
    receiveTimeout: 60*1000,
  );


  static const String baseUrl = '';
  static const String jokeApiServerKey = '';
  static const String randomJoke = 'https://api.chucknorris.io/jokes/random';
}