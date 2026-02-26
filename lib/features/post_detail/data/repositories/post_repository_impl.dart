import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/post_entity.dart';
import '../../domain/repositories/post_repository.dart';
import '../datasources/post_remote_data_source.dart';

class PostRepositoryImpl implements PostRepository {
  final PostRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  PostRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, PostEntity>> getPost(int id) async {
    if (await networkInfo.isConnected) {
      try {
        final remotePost = await remoteDataSource.getPost(id);
        return Right(remotePost);
      } on ServerException {
        return Left(ServerFailure('Loi ket noi toi Server'));
      } catch (e) {
        return Left(ServerFailure('Loi gi do ko p'));
      }
    } else {
      return Left(NetworkFailure());
    }
  }
}
