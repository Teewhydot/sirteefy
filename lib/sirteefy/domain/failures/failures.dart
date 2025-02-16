abstract class Failure {
   final String failureMessage;
   Failure({required this.failureMessage});
}
abstract class Success {}

class MessageSentSuccess extends Success {}
class DownloadSuccess extends Success {}

class ServerFailure extends Failure {
  ServerFailure({required super.failureMessage});
}

class CacheFailure extends Failure {
  CacheFailure({required super.failureMessage});
}

class UnknownFailure extends Failure {
  UnknownFailure({required super.failureMessage});

}

class NoInternetFailure extends Failure {
  NoInternetFailure({required super.failureMessage});
}

class TimeoutFailure extends Failure {
  TimeoutFailure({required super.failureMessage});
}
