import 'package:equatable/equatable.dart';
import '../../domain/entities/post_entity.dart';

abstract class PostState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PostInitial extends PostState {}

class PostLoading extends PostState {}

class PostLoaded extends PostState {
  final PostEntity post;
  PostLoaded(this.post);
  @override
  List<Object?> get props => [post];
}

class PostError extends PostState {
  final String message;
  PostError(this.message);
  @override
  List<Object?> get props => [message];
}
