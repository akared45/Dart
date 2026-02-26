import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/post_entity.dart';
import '../repositories/post_repository.dart';

class GetPost implements UseCase<PostEntity, int> {
  final PostRepository repository;

  GetPost(this.repository);

  @override
  Future<Either<Failure, PostEntity>> call(int id) async {
    return await repository.getPost(id);
  }
}
