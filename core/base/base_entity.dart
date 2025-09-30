import 'package:equatable/equatable.dart';

abstract class BaseEntity extends Equatable {
  const BaseEntity();

  Map<String, dynamic> toJson();

  @override
  List<Object?> get props => [];
}