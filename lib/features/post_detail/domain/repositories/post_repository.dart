import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/post_entity.dart';

abstract class PostRepository {
  Future<Either<Failure, PostEntity>> getPost(int id);
}
