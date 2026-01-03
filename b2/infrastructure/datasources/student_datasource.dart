import 'package:postgres/postgres.dart';

abstract class IStudentDataSource {
  Future<Result> execute(String sql, [List<Object?>? parameters]);
}
