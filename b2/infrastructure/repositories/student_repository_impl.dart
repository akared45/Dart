import '../../domain/entities/student.dart';
import '../../domain/enums/student_status.dart';
import '../../domain/repositories/i_student_repository.dart';
import '../datasources/student_datasource.dart';
import '../mappers/student_mapper.dart';

class StudentRepositoryImpl implements IStudentRepository {
  final IStudentDataSource _dataSource;

  StudentRepositoryImpl(this._dataSource);

  @override
  Future<void> add(Student entity) async {
    final data = StudentPersistenceMapper.toDbMap(entity);
    const sql = r'''
      INSERT INTO students (name, email, age, status, favorite_subjects) 
      VALUES ($1, $2, $3, $4, $5)
    ''';
    
    await _dataSource.execute(sql, [
      data['name'], 
      data['email'], 
      data['age'], 
      data['status'], 
      data['favorite_subjects']
    ]);
  }

  @override
  Future<Student?> findByEmail(String email) async {
    const sql = r'SELECT * FROM students WHERE email = $1';
    final result = await _dataSource.execute(sql, [email]);

    if (result.isEmpty) return null;
    return StudentPersistenceMapper.toEntity(result.first.toColumnMap());
  }

  @override
  Future<List<Student>> searchByNameOrEmail(String execute) async {
    const sql = r'SELECT * FROM students WHERE name ILIKE $1 OR email ILIKE $1';
    final result = await _dataSource.execute(sql, ['%$execute%']);

    return result
        .map((row) => StudentPersistenceMapper.toEntity(row.toColumnMap()))
        .toList();
  }

  @override
  Future<List<Student>> getByStatus(StudentStatus status) async {
    const sql = r'SELECT * FROM students WHERE status = $1';
    final result = await _dataSource.execute(sql, [status.name]);

    return result
        .map((row) => StudentPersistenceMapper.toEntity(row.toColumnMap()))
        .toList();
  }

  @override
  Future<void> update(Student entity) async {
    final data = StudentPersistenceMapper.toDbMap(entity);
    const sql = r'''
      UPDATE students 
      SET name = $1, email = $2, age = $3, status = $4, favorite_subjects = $5 
      WHERE id = $6
    ''';

    await _dataSource.execute(sql, [
      data['name'],
      data['email'],
      data['age'],
      data['status'],
      data['favorite_subjects'],
      entity.id
    ]);
  }

  @override
  Future<void> delete(int? id) async {
    const sql = r'DELETE FROM students WHERE id = $1';
    await _dataSource.execute(sql, [id]);
  }

  @override
  Future<Student?> getById(int? id) async {
    const sql = r'SELECT * FROM students WHERE id = $1';
    final result = await _dataSource.execute(sql, [id]);

    if (result.isEmpty) return null;
    return StudentPersistenceMapper.toEntity(result.first.toColumnMap());
  }

  @override
  Future<List<Student>> getAll() async {
    const sql = r'SELECT * FROM students ORDER BY id ASC';
    final result = await _dataSource.execute(sql);

    return result
        .map((row) => StudentPersistenceMapper.toEntity(row.toColumnMap()))
        .toList();
  }

  @override
  Future<void> updateFavoriteSubjects(int studentId, List<String> subjects) async {
    const sql = r'UPDATE students SET favorite_subjects = $1 WHERE id = $2';
    await _dataSource.execute(sql, [subjects, studentId]);
  }
}