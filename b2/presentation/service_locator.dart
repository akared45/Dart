import 'package:get_it/get_it.dart';
import 'package:postgres/postgres.dart';

import '../application/interfaces/i_create_student_usecase.dart';
import '../application/interfaces/i_get_student_usecase.dart';
import '../application/interfaces/i_register_subjects_use_case.dart';
import '../application/usecases/create_student_usecase.dart';
import '../application/usecases/get_student_usecase.dart';
import '../application/usecases/register_subject_usecase.dart';
import '../domain/repositories/i_student_repository.dart';
import '../infrastructure/config/database_config.dart';
import '../infrastructure/datasources/_connection.execute.dart';
import '../infrastructure/datasources/student_datasource.dart';
import '../infrastructure/repositories/student_repository_impl.dart';
import 'controllers/student_controller.dart';
import 'views/student_view.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // --- 1. EXTERNA ---
  final connection = await DatabaseConfig.getConnection();
  sl.registerSingleton<Connection>(connection);

  // --- 2. DATA SOURCES ---
  sl.registerLazySingleton<IStudentDataSource>(
    () => PostgresStudentDataSource(sl<Connection>()),
  );

  // --- 3. REPOSITORIES ---
  sl.registerLazySingleton<IStudentRepository>(
    () => StudentRepositoryImpl(sl<IStudentDataSource>()),
  );

  // --- 4. USE CASES ---
  sl.registerLazySingleton<ICreateStudentUseCase>(
    () => CreateStudentUseCase(sl<IStudentRepository>()),
  );
  
  sl.registerLazySingleton<IGetStudentUseCase>(
    () => GetStudentUseCase(sl<IStudentRepository>()),
  );
  
  sl.registerLazySingleton<IRegisterSubjectsUseCase>(
    () => RegisterSubjectsUseCase(sl<IStudentRepository>()),
  );
  // --- 5. CONTROLLERS & VIEWS---
  sl.registerLazySingleton<StudentController>(
    () => StudentController(
      sl<ICreateStudentUseCase>(),
      sl<IGetStudentUseCase>(),
      sl<IRegisterSubjectsUseCase>(),
    ),
  );
  
  sl.registerFactory(() => StudentView(sl<StudentController>()));
}