
import 'package:bloc_clean_architecture/domain/failures/failures.dart';
import 'package:dartz/dartz.dart';

import '../entities/joke_entity.dart';

abstract class RandomJokeRepository{
  Future<Either<Failure, JokeEntity>> getRandomJoke();
}