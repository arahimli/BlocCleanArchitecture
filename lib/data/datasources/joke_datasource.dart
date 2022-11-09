
import 'package:dio/dio.dart';

import '../utils/endpoints.dart';
import '../exceptions/exceptions.dart';
import '../models/joke_model.dart';
import '../utils/exception.dart';

abstract class JokeDatasource{
  Future<JokeModel> getRandomJokeApi();
}

class JokeDatasourceImpl implements JokeDatasource{
  final Dio dio;

  JokeDatasourceImpl({required this.dio});

  @override
  Future<JokeModel> getRandomJokeApi() async{
    try {
      Response response;
      response = await dio.get(EndPointConfig.randomJoke);
      return JokeModel.fromJson(response.data);
    } on DioError catch (e, stacktrace) {
      throw ExceptionUtils.dioErrorHandle(e, stacktrace);
    } catch (e) {
      throw UnexpectedException();
    }
  }
}