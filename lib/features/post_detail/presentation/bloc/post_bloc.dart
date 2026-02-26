import 'package:flutter_bloc/flutter_bloc.dart';
import 'post_event.dart';
import 'post_state.dart';
import '../../domain/usecases/get_post.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final GetPost getPostUseCase;

  PostBloc({required this.getPostUseCase}) : super(PostInitial()) {
    on<GetPostEvent>((event, emit) async {
      emit(PostLoading());

      final failureOrPost = await getPostUseCase(event.id);

      failureOrPost.fold(
        (failure) => emit(PostError(failure.message)),
        (post) => emit(PostLoaded(post)),
      );
    });
  }
}
