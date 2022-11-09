
abstract class Failure with FailureMessage{}

class ServerFailure extends Failure{}

class SocketFailure extends Failure{}

class AuthenticationFailure extends Failure{}

class UnexpectedFailure extends Failure{}


mixin FailureMessage {
  String getMessage(){
    if(this is ServerFailure){
      return 'ServerError';
    } else if(this is SocketFailure){
      return 'There are some issues on your internet connection';
    } else if(this is AuthenticationFailure){
      return 'Authentication failure';
    } else{
      return 'Undefined issue, please try again';
    }
  }
}