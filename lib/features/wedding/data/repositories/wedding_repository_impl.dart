import 'package:dartz/dartz.dart';
import 'package:wedding_invitation_app/core/error/failures.dart';
import 'package:wedding_invitation_app/features/wedding/domain/entities/wedding_info.dart';
import 'package:wedding_invitation_app/features/wedding/domain/repositories/wedding_repository.dart';
import 'package:wedding_invitation_app/features/wedding/data/datasources/wedding_local_datasource.dart';

/// Implementation of wedding repository
class WeddingRepositoryImpl implements WeddingRepository {
  final WeddingLocalDataSource localDataSource;

  const WeddingRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Failure, WeddingInfo>> getWeddingInfo() async {
    try {
      final weddingInfo = await localDataSource.getWeddingInfo();
      return Right(weddingInfo);
    } catch (e) {
      return Left(CacheFailure('Failed to get wedding info: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, void>> saveWeddingInfo(WeddingInfo weddingInfo) async {
    try {
      await localDataSource.cacheWeddingInfo(weddingInfo);
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('Failed to save wedding info: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, void>> updateWeddingInfo(
    WeddingInfo weddingInfo,
  ) async {
    try {
      await localDataSource.cacheWeddingInfo(weddingInfo);
      return const Right(null);
    } catch (e) {
      return Left(
        CacheFailure('Failed to update wedding info: ${e.toString()}'),
      );
    }
  }
}
