part of 'bloc.dart';

@immutable
abstract class RandomJokeEvent extends Equatable {}

class RandomJokeGetData extends RandomJokeEvent{
  final String search;

  RandomJokeGetData({this.search = ''});

  @override
  List<Object?> get props => [search];
}
