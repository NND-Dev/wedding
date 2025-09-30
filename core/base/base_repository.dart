import 'package:dartz/dartz.dart';
import '../error/failures.dart';

abstract class BaseRepository<T> {
  Future<Either<Failure, List<T>>> getAll();
  Future<Either<Failure, T?>> getById(String id);
  Future<Either<Failure, void>> add(T item);
  Future<Either<Failure, void>> update(T item);
  Future<Either<Failure, void>> delete(String id);
}