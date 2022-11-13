
import 'package:bloc_clean_architecture/data/datasources/joke_datasource.dart';
import 'package:bloc_clean_architecture/data/exceptions/exceptions.dart';
import 'package:bloc_clean_architecture/data/models/joke_model.dart';
import 'package:bloc_clean_architecture/data/repositories/random_joke_repository.dart';
import 'package:bloc_clean_architecture/domain/failures/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'random_joke_repository.mocks.dart';


@GenerateNiceMocks([MockSpec<JokeDatasourceImpl>()])

void main(){
  late MockJokeDatasourceImpl mockJokeDatasource;
  final successJokeModel = JokeModel(id: '7MVcJYj2SJSxemSGfhjBYA');
  setUp((){
    mockJokeDatasource = MockJokeDatasourceImpl();
  });

  group("Random Joke Repository Impl test", (){

    group("Success tests", (){
      test("Return JokeModel", () async{

        final randomJokeRepository = RandomJokeRepositoryImpl(jokeDatasource: mockJokeDatasource);

        when(mockJokeDatasource.getRandomJokeApi())
        .thenAnswer((realInvocation) => Future.value(successJokeModel));

        final result = await randomJokeRepository.getRandomJoke();
        expect(result.isRight(), true);
        expect(result.isLeft(), false);
        expect(result, Right<Failure, JokeModel>(successJokeModel));
        verify(mockJokeDatasource.getRandomJokeApi()).called(1);
        verifyNoMoreInteractions(mockJokeDatasource);
      });
    });

    group("Error test ", (){
      test("Server Exception", () async{

        final randomJokeRepository = RandomJokeRepositoryImpl(jokeDatasource: mockJokeDatasource);

        when(mockJokeDatasource.getRandomJokeApi())
            .thenThrow(ServerException());

        final result = await randomJokeRepository.getRandomJoke();
        expect(result.isRight(), false);
        expect(result.isLeft(), true);
        expect(result, Left<Failure, JokeModel>(ServerFailure()));
        verify(mockJokeDatasource.getRandomJokeApi()).called(1);
        verifyNoMoreInteractions(mockJokeDatasource);
      });

      test("Socket Failure", () async{

        final randomJokeRepository = RandomJokeRepositoryImpl(jokeDatasource: mockJokeDatasource);

        when(mockJokeDatasource.getRandomJokeApi())
            .thenThrow(InternetException());

        final result = await randomJokeRepository.getRandomJoke();
        expect(result.isRight(), false);
        expect(result.isLeft(), true);
        expect(result, Left<Failure, JokeModel>(SocketFailure()));
      });

      test("Authentication Failure", () async{

        final randomJokeRepository = RandomJokeRepositoryImpl(jokeDatasource: mockJokeDatasource);

        when(mockJokeDatasource.getRandomJokeApi())
            .thenThrow(AuthenticationException());

        final result = await randomJokeRepository.getRandomJoke();
        expect(result.isRight(), false);
        expect(result.isLeft(), true);
        expect(result, Left<Failure, JokeModel>(AuthenticationFailure()));
      });

      test("Unexpected Failure", () async{

        final randomJokeRepository = RandomJokeRepositoryImpl(jokeDatasource: mockJokeDatasource);

        when(mockJokeDatasource.getRandomJokeApi())
            .thenThrow(UnexpectedException());

        final result = await randomJokeRepository.getRandomJoke();
        expect(result.isRight(), false);
        expect(result.isLeft(), true);
        expect(result, Left<Failure, JokeModel>(UnexpectedFailure()));
      });
    });

  });
}
