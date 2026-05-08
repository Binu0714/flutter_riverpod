sealed class Failure {
  final String message;
  Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure([String? message]) : super(message ?? "Server error occurred");
}

class NetworkFailure extends Failure {
  NetworkFailure() : super("No internet connection");
}