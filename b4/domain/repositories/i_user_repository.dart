import '../entities/user.entity.dart';

abstract class UserRepository{
  Future<User> fetchUserById(String id);
}