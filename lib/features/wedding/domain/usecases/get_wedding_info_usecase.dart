import 'package:dartz/dartz.dart';
import 'package:wedding_invitation_app/core/error/failures.dart';
import 'package:wedding_invitation_app/features/wedding/domain/entities/wedding_info.dart';
import 'package:wedding_invitation_app/features/wedding/domain/repositories/wedding_repository.dart';
import 'package:wedding_invitation_app/core/base/base_usecase.dart';

/// Use case for getting wedding information
class GetWeddingInfoUseCase implements BaseUseCase<WeddingInfo, NoParams> {
  final WeddingRepository repository;

  const GetWeddingInfoUseCase({required this.repository});

  @override
  Future<Either<Failure, WeddingInfo>> call(NoParams params) async {
    return await repository.getWeddingInfo();
  }
}

/// Parameters class for use cases that don't need parameters
class NoParams {
  const NoParams();
}
