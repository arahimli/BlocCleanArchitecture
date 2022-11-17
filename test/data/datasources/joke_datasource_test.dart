import 'dart:async';

import 'package:bloc_clean_architecture/features/joke_app/data/datasources/joke_datasource.dart';
import 'package:bloc_clean_architecture/features/joke_app/data/exceptions/exceptions.dart';
import 'package:bloc_clean_architecture/features/joke_app/data/models/joke_model.dart';
import 'package:bloc_clean_architecture/features/joke_app/data/utils/endpoints.dart';
import 'package:dio/dio.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'joke_datasource_test.mocks.dart';

@GenerateNiceMocks([MockSpec<Dio>()])
@GenerateNiceMocks([MockSpec<DioAdapter>()])

void main(){
  final mockDio = MockDio();
  setUp((){
    mockDio.options = EndPointConfig.baseOptions;
  });

  group("Joke Data Source test", (){

    group("Success tests", (){
      test("200 response test", () async{

        final jokeDatasourceTest = JokeDatasourceImpl(dio: mockDio);
        Map<String, dynamic> responseMap = {"categories":[],"created_at":"2020-01-05 13:42:27.496799","icon_url":"https://assets.chucknorris.host/img/avatar/chuck-norris.png","id":"7MVcJYj2SJSxemSGfhjBYA","updated_at":"2020-01-05 13:42:27.496799","url":"https://api.chucknorris.io/jokes/7MVcJYj2SJSxemSGfhjBYA","value":"The actual definition of thunder is Chuck Norris coming to kill you."};


        when(mockDio.get(EndPointConfig.randomJoke))
            .thenAnswer((realInvocation) =>
            Future.value(Response(data: responseMap, statusCode: 200, requestOptions: RequestOptions(path: EndPointConfig.randomJoke)))
        );

        final result = await jokeDatasourceTest.getRandomJokeApi();

        expect(result, JokeModel(id: '7MVcJYj2SJSxemSGfhjBYA'));

      });
      test("200 response wrong data ", () async{


        final jokeDatasourceTest = JokeDatasourceImpl(dio: mockDio);
        Map<String, dynamic> responseMap = {
          "d":"7MVcJYj2SJSxemSGfhjBYA", // id null
          "updated_at":"2020-01-05 13:42:27.496799",
          "url":"https://api.chucknorris.io/jokes/7MVcJYj2SJSxemSGfhjBYA",
          "value":"The actual definition of thunder is Chuck Norris coming to kill you.",
          "categories":[],
          "created_at":"2020-01-05 13:42:27.496799",
          "icon_url":"https://assets.chucknorris.host/img/avatar/chuck-norris.png",
        };


        when(mockDio.get(EndPointConfig.randomJoke))
            .thenAnswer((realInvocation) =>
            Future.value(Response(data: responseMap, statusCode: 200, requestOptions: RequestOptions(path: EndPointConfig.randomJoke)))
        );

        final result = await jokeDatasourceTest.getRandomJokeApi();

        expect(result, JokeModel());

      });
    });

    group("Error test ", (){
      test("401 response test", () async{

        final jokeDatasourceTest = JokeDatasourceImpl(dio: mockDio);

        when(mockDio.get(EndPointConfig.randomJoke))
            .thenAnswer((realInvocation) =>
            Future.value(Response(statusCode: 401, requestOptions: RequestOptions(path: EndPointConfig.randomJoke)))
        );

        expect(() => jokeDatasourceTest.getRandomJokeApi(), throwsA(isA<AuthenticationException>()));

      });
      test("500 response test", () async{

        final jokeDatasourceTest = JokeDatasourceImpl(dio: mockDio);

        when(mockDio.get(EndPointConfig.randomJoke))
            .thenAnswer((realInvocation) =>
            Future.value(Response(statusCode: 500, requestOptions: RequestOptions(path: EndPointConfig.randomJoke)))
        );

        expect(() => jokeDatasourceTest.getRandomJokeApi(), throwsA(isA<ServerException>()));

      });
    });

  });
}
