

import 'package:bloc_clean_architecture/data/repositories/random_joke_repository.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'data/utils/endpoints.dart';
import 'data/datasources/joke_datasource.dart';
import 'domain/repositories/random_joke_repository.dart';
import 'domain/usecases/joke_usecases.dart';
import 'presentation/logic/random_joke/bloc.dart';

final sl = GetIt.I;  // Service location

Future<void> init() async{

  // Factory - each time a new instance of the Class

  // Presentation layer
  sl.registerFactory(
          () => RandomJokeBloc(jokeUseCases: sl()));

  // Domain layer
  sl.registerFactory(
          () => JokeUseCases(randomJokeRepository: sl()));

  // Data layer
  sl.registerFactory<RandomJokeRepository>(
          () => RandomJokeRepositoryImpl(jokeDatasource: sl()));


  sl.registerFactory<JokeDatasource>(
    () => JokeDatasourceImpl(
      dio: Dio(
          BaseOptions(
            baseUrl: EndPointConfig.baseUrl,
            receiveDataWhenStatusError: true,
            headers: {
              'content-type' : 'application/json',
            },
            connectTimeout: 60*1000,
            receiveTimeout: 60*1000,
        )
      ))
  );

}
