
import 'package:bloc_clean_architecture/domain/entities/joke_entity.dart';
import 'package:bloc_clean_architecture/domain/failures/failures.dart';
import 'package:bloc_clean_architecture/domain/usecases/joke_usecases.dart';
import 'package:bloc_clean_architecture/presentation/logic/random_joke/bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:test/scaffolding.dart';


class MockJokeUseCases extends Mock implements JokeUseCases{}



void main(){

  late MockJokeUseCases mockJokeUseCases;
  const successJokeEntity = JokeEntity( id: '7MVcJYj2SJSxemSGfhjBYA');

  setUp((){
    mockJokeUseCases = MockJokeUseCases();
  });

  group("Random Joke Bloc test", (){

    group("Loaded test", (){

      blocTest<RandomJokeBloc, RandomJokeState>(
        "No action and no event",
        build: () => RandomJokeBloc( jokeUseCases: mockJokeUseCases),
        expect: () => const <RandomJokeState>[],
      );

      blocTest<RandomJokeBloc, RandomJokeState>(
        "[RandomJokeLoading, RandomJokeLoaded]",
        setUp: () => when(() => mockJokeUseCases.getRandomJoke())
            .thenAnswer((invocation) =>
            Future.value(const Right<Failure, JokeEntity>(successJokeEntity))),
        build: () => RandomJokeBloc( jokeUseCases: mockJokeUseCases ),
        act: (bloc) => bloc.add(RandomJokeGetData()),
        wait: const Duration(seconds: 1),
        expect: () => <RandomJokeState>[
          RandomJokeLoading(),
          const RandomJokeLoaded(joke: successJokeEntity),
          // RandomJokeError(failure: ServerFailure())
        ],
      );

    });

    group("Error tests", (){

      blocTest<RandomJokeBloc, RandomJokeState>(
        "[RandomJokeLoading, RandomJokeError]",
        setUp: () => when(() => mockJokeUseCases.getRandomJoke())
            .thenAnswer((invocation) =>
            Future.value( Left<Failure, JokeEntity>(SocketFailure()) )),
        build: () => RandomJokeBloc( jokeUseCases: mockJokeUseCases ),
        act: (bloc) => bloc.add(RandomJokeGetData()),
        wait: const Duration(seconds: 1),
        expect: () => <RandomJokeState>[
          RandomJokeLoading(),
          RandomJokeError(failure: ServerFailure())
        ],
      );
    });

  });
}
