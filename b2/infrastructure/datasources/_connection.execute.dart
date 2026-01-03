import 'package:postgres/postgres.dart';

import 'student_datasource.dart';

class PostgresStudentDataSource implements IStudentDataSource {
  final Connection _connection;

  PostgresStudentDataSource(this._connection);

  @override
  Future<Result> execute(String sql, [List<Object?>? parameters]) async {
    try {
      return await _connection.execute(sql, parameters: parameters);
    } catch (e) {
      print("Database Error: $e");
      rethrow;
    }
  }
}