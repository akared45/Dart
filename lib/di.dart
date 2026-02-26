import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'package:api_hw/core/network/network_info.dart';
import 'package:api_hw/features/post_detail/data/repositories/post_repository_impl.dart';
import 'package:api_hw/features/post_detail/domain/repositories/post_repository.dart';
import 'package:api_hw/features/post_detail/domain/usecases/get_post.dart';
import 'package:api_hw/features/post_detail/presentation/bloc/post_bloc.dart';
import 'package:api_hw/features/post_detail/data/datasources/post_remote_data_source.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => PostBloc(getPostUseCase: sl()));

  sl.registerLazySingleton(() => GetPost(sl()));

  sl.registerLazySingleton<PostRepository>(
        () => PostRepositoryImpl(
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  sl.registerLazySingleton<PostRemoteDataSource>(
    () => PostRemoteDataSourceImpl(client: sl()),
  );

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker.instance);
}
