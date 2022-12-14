// Mocks generated by Mockito 5.3.2 from annotations
// in bloc_clean_architecture/test/features/joke_app/domain/usecases/joke_usecases.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:bloc_clean_architecture/features/joke_app/data/datasources/joke_datasource.dart'
    as _i2;
import 'package:bloc_clean_architecture/features/joke_app/data/repositories/random_joke_repository.dart'
    as _i4;
import 'package:bloc_clean_architecture/features/joke_app/domain/entities/joke_entity.dart'
    as _i7;
import 'package:bloc_clean_architecture/features/joke_app/domain/failures/failures.dart' as _i6;
import 'package:dartz/dartz.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeJokeDatasource_0 extends _i1.SmartFake
    implements _i2.JokeDatasource {
  _FakeJokeDatasource_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEither_1<L, R> extends _i1.SmartFake implements _i3.Either<L, R> {
  _FakeEither_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [RandomJokeRepositoryImpl].
///
/// See the documentation for Mockito's code generation for more information.
class MockRandomJokeRepositoryImpl extends _i1.Mock
    implements _i4.RandomJokeRepositoryImpl {
  @override
  _i2.JokeDatasource get jokeDatasource => (super.noSuchMethod(
        Invocation.getter(#jokeDatasource),
        returnValue: _FakeJokeDatasource_0(
          this,
          Invocation.getter(#jokeDatasource),
        ),
        returnValueForMissingStub: _FakeJokeDatasource_0(
          this,
          Invocation.getter(#jokeDatasource),
        ),
      ) as _i2.JokeDatasource);
  @override
  _i5.Future<_i3.Either<_i6.Failure, _i7.JokeEntity>> getRandomJoke() =>
      (super.noSuchMethod(
        Invocation.method(
          #getRandomJoke,
          [],
        ),
        returnValue: _i5.Future<_i3.Either<_i6.Failure, _i7.JokeEntity>>.value(
            _FakeEither_1<_i6.Failure, _i7.JokeEntity>(
          this,
          Invocation.method(
            #getRandomJoke,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i5.Future<_i3.Either<_i6.Failure, _i7.JokeEntity>>.value(
                _FakeEither_1<_i6.Failure, _i7.JokeEntity>(
          this,
          Invocation.method(
            #getRandomJoke,
            [],
          ),
        )),
      ) as _i5.Future<_i3.Either<_i6.Failure, _i7.JokeEntity>>);
}
