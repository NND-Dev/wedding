import 'package:dartz/dartz.dart';
import 'package:wedding_invitation_app/core/error/failures.dart';

/// Base use case interface
abstract class BaseUseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

/// Parameters class for use cases that don't need parameters
class NoParams {
  const NoParams();
}
