
import 'package:dartz/dartz.dart';

import '../entities/joke_entity.dart';
import '../failures/failures.dart';

abstract class RandomJokeRepository{
  Future<Either<Failure, JokeEntity>> getRandomJoke();
}