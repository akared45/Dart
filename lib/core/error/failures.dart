abstract class Failure {
  final String message;
  Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure(super.message);
}

class NetworkFailure extends Failure {
  NetworkFailure() : super("Eo co mang");
}

class CacheFailure extends Failure {
  CacheFailure() : super('Loi truy cap bo nho');
}

class ServerException implements Exception {}