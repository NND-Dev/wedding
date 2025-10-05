import 'package:equatable/equatable.dart';

/// Base failure class
abstract class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object> get props => [message];
}

/// General failure
class GeneralFailure extends Failure {
  const GeneralFailure(String message) : super(message);
}

/// Server failure
class ServerFailure extends Failure {
  const ServerFailure(String message) : super(message);
}

/// Cache failure
class CacheFailure extends Failure {
  const CacheFailure(String message) : super(message);
}

/// Network failure
class NetworkFailure extends Failure {
  const NetworkFailure(String message) : super(message);
}

/// Validation failure
class ValidationFailure extends Failure {
  const ValidationFailure(String message) : super(message);
}
