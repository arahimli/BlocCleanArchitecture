// Mocks generated by Mockito 5.3.2 from annotations
// in bloc_clean_architecture/test/features/joke_app/data/repositories/random_joke_repository.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:bloc_clean_architecture/features/joke_app/data/datasources/joke_datasource.dart'
    as _i4;
import 'package:bloc_clean_architecture/features/joke_app/data/models/joke_model.dart' as _i3;
import 'package:dio/dio.dart' as _i2;
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

class _FakeDio_0 extends _i1.SmartFake implements _i2.Dio {
  _FakeDio_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeJokeModel_1 extends _i1.SmartFake implements _i3.JokeModel {
  _FakeJokeModel_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [JokeDatasourceImpl].
///
/// See the documentation for Mockito's code generation for more information.
class MockJokeDatasourceImpl extends _i1.Mock
    implements _i4.JokeDatasourceImpl {
  @override
  _i2.Dio get dio => (super.noSuchMethod(
        Invocation.getter(#dio),
        returnValue: _FakeDio_0(
          this,
          Invocation.getter(#dio),
        ),
        returnValueForMissingStub: _FakeDio_0(
          this,
          Invocation.getter(#dio),
        ),
      ) as _i2.Dio);
  @override
  _i5.Future<_i3.JokeModel> getRandomJokeApi() => (super.noSuchMethod(
        Invocation.method(
          #getRandomJokeApi,
          [],
        ),
        returnValue: _i5.Future<_i3.JokeModel>.value(_FakeJokeModel_1(
          this,
          Invocation.method(
            #getRandomJokeApi,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i5.Future<_i3.JokeModel>.value(_FakeJokeModel_1(
          this,
          Invocation.method(
            #getRandomJokeApi,
            [],
          ),
        )),
      ) as _i5.Future<_i3.JokeModel>);
}
