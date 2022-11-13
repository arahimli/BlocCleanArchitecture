

import 'package:bloc_clean_architecture/data/repositories/random_joke_repository.dart';
import 'package:bloc_clean_architecture/domain/entities/joke_entity.dart';
import 'package:bloc_clean_architecture/domain/failures/failures.dart';
import 'package:bloc_clean_architecture/domain/usecases/joke_usecases.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'joke_usecases.mocks.dart';

@GenerateNiceMocks([MockSpec<RandomJokeRepositoryImpl>()])

void main(){
  late MockRandomJokeRepositoryImpl mockJokeRepositoryImpl;
  const successJokeEntity = JokeEntity( id: '7MVcJYj2SJSxemSGfhjBYA');
  setUp((){
    mockJokeRepositoryImpl = MockRandomJokeRepositoryImpl();
  });

  group("Random Joke Use Case test", (){

    group("Success tests", (){
      test("Return JokeEntity", () async{

        final jokeUseCases = JokeUseCases(randomJokeRepository: mockJokeRepositoryImpl);

        when(mockJokeRepositoryImpl.getRandomJoke())
            .thenAnswer((realInvocation) =>
            Future.value( const Right(successJokeEntity)
            )
        );

        final result = await jokeUseCases.getRandomJoke();
        expect(result.isRight(), true);
        expect(result.isLeft(), false);
        expect(result, const Right<Failure, JokeEntity>(successJokeEntity));
        verify(mockJokeRepositoryImpl.getRandomJoke()).called(1);
        verifyNoMoreInteractions(mockJokeRepositoryImpl);
      });
    });

    group("Error test ", (){
      test("Server Exception", () async{

        final jokeUseCases = JokeUseCases(randomJokeRepository: mockJokeRepositoryImpl);

        when(mockJokeRepositoryImpl.getRandomJoke())
            .thenAnswer((realInvocation) => Future.value(Left(ServerFailure())));

        final result = await jokeUseCases.getRandomJoke();
        expect(result.isRight(), false);
        expect(result.isLeft(), true);
        expect(result, Left<Failure, JokeEntity>(ServerFailure()));
        verify(mockJokeRepositoryImpl.getRandomJoke()).called(1);
        verifyNoMoreInteractions(mockJokeRepositoryImpl);
      });

      test("Socket Failure", () async{

        final jokeUseCases = JokeUseCases(randomJokeRepository: mockJokeRepositoryImpl);

        when(mockJokeRepositoryImpl.getRandomJoke())
            .thenAnswer((realInvocation) => Future.value(Left(SocketFailure())));

        final result = await jokeUseCases.getRandomJoke();
        expect(result.isRight(), false);
        expect(result.isLeft(), true);
        expect(result, Left<Failure, JokeEntity>(SocketFailure()));
      });

      test("Authentication Failure", () async{

        final jokeUseCases = JokeUseCases(randomJokeRepository: mockJokeRepositoryImpl);

        when(mockJokeRepositoryImpl.getRandomJoke())
            .thenAnswer((realInvocation) => Future.value(Left(AuthenticationFailure())));

        final result = await jokeUseCases.getRandomJoke();
        expect(result.isRight(), false);
        expect(result.isLeft(), true);
        expect(result, Left<Failure, JokeEntity>(AuthenticationFailure()));
      });

      test("Unexpected Failure", () async{

        final jokeUseCases = JokeUseCases(randomJokeRepository: mockJokeRepositoryImpl);

        when(mockJokeRepositoryImpl.getRandomJoke())
            .thenAnswer((realInvocation) => Future.value(Left(UnexpectedFailure())));

        final result = await jokeUseCases.getRandomJoke();
        expect(result.isRight(), false);
        expect(result.isLeft(), true);
        expect(result, Left<Failure, JokeEntity>(UnexpectedFailure()));
      });
    });

  });
}
