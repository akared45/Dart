import 'package:postgres/postgres.dart';

class DatabaseConfig {
  static Future<Connection> getConnection() async {
    return await Connection.open(
      Endpoint(
        host: 'localhost',
        database: 'Student',
        username: 'postgres',
        password: '123456',
      ),
      settings: ConnectionSettings(sslMode: SslMode.disable),
    );
  }
}