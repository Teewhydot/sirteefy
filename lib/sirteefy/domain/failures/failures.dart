abstract class Failure {
   final String message;
   Failure({required this.message});
}
abstract class Success {}

class MessageSentSuccess extends Success {}

class ServerFailure extends Failure {
  ServerFailure({required super.message});
}

class CacheFailure extends Failure {
  CacheFailure({required super.message});
}

class UnknownFailure extends Failure {
  UnknownFailure({required super.message});

}

class NoInternetFailure extends Failure {
  NoInternetFailure({required super.message});
}

class TimeoutFailure extends Failure {
  TimeoutFailure({required super.message});
}
