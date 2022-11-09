
import 'package:bloc_clean_architecture/domain/failures/failures.dart';
import 'package:dartz/dartz.dart';

import '../../domain/repositories/random_joke_repository.dart';
import '../datasources/joke_datasource.dart';
import '../exceptions/exceptions.dart';
import '../models/joke_model.dart';


class RandomJokeRepositoryImpl implements RandomJokeRepository{
  final JokeDatasource jokeDatasource;

  const RandomJokeRepositoryImpl({required this.jokeDatasource});

  @override
  Future<Either<Failure, JokeModel>> getRandomJoke() async{
    try{
      final result = await jokeDatasource.getRandomJokeApi();
      return right(result);
    } on ServerException catch(_){
      return left(ServerFailure());
    } on InternetException catch(_){
      return left(SocketFailure());
    } on AuthenticationException catch(_){
      return left(AuthenticationFailure());
    }catch(e){
      return left(UnexpectedFailure());
    }
  }
}

