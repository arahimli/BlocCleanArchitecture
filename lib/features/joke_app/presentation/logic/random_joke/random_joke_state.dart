part of 'bloc.dart';

@immutable
abstract class RandomJokeState extends Equatable {
  const RandomJokeState();
}

class RandomJokeInitial extends RandomJokeState {
  @override
  List<Object> get props => [];
}

class RandomJokeLoading extends RandomJokeState {
  @override
  List<Object> get props => [];
}

class RandomJokeLoaded extends RandomJokeState {
  final JokeEntity joke;

  const RandomJokeLoaded({required this.joke});
  @override
  List<Object> get props => [];
}

class RandomJokeError extends RandomJokeState {
  final Failure failure;

  const RandomJokeError({required this.failure});
  @override
  List<Object> get props => [];
}
