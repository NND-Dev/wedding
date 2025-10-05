import 'package:dartz/dartz.dart';
import 'package:wedding_invitation_app/core/error/failures.dart';
import 'package:wedding_invitation_app/features/wedding/domain/entities/wedding_info.dart';

/// Abstract repository interface for wedding data
abstract class WeddingRepository {
  /// Get wedding information
  Future<Either<Failure, WeddingInfo>> getWeddingInfo();

  /// Save wedding information
  Future<Either<Failure, void>> saveWeddingInfo(WeddingInfo weddingInfo);

  /// Update wedding information
  Future<Either<Failure, void>> updateWeddingInfo(WeddingInfo weddingInfo);
}
