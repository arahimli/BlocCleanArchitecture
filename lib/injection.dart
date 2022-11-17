

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'features/joke_app/data/datasources/joke_datasource.dart';
import 'features/joke_app/data/repositories/random_joke_repository.dart';
import 'features/joke_app/data/utils/endpoints.dart';
import 'features/joke_app/domain/repositories/random_joke_repository.dart';
import 'features/joke_app/domain/usecases/joke_usecases.dart';
import 'features/joke_app/presentation/logic/random_joke/bloc.dart';
import 'features/joke_app/presentation/logic/random_joke/bloc.dart';

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
