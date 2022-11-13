part of 'bloc.dart';



class RandomJokeBloc extends Bloc<RandomJokeEvent, RandomJokeState> {

  final JokeUseCases jokeUseCases;

  RandomJokeBloc({required this.jokeUseCases}) : super(RandomJokeInitial()) {
    on<RandomJokeGetData>(_getDataEvent);
  }

  _getDataEvent(RandomJokeGetData event, emit) async{
    emit(RandomJokeLoading());
    // emit(RandomJokeError(failure: SocketFailure()));
    final result = await jokeUseCases.getRandomJoke();
    result.fold(
      (failure) => emit(RandomJokeError(failure: failure)),
      (success) => emit(RandomJokeLoaded(joke: success))
    );
  }
}
