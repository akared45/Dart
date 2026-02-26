import 'package:equatable/equatable.dart';

abstract class PostEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetPostEvent extends PostEvent {
  final int id;
  GetPostEvent(this.id);

  @override
  List<Object> get props => [id];
}
