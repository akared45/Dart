import '../../domain/entities/user.entity.dart';
import '../../domain/repositories/i_user_repository.dart';
import '../../domain/value_objects/age.dart';

class UserRepositoryImpl implements UserRepository {
  @override
  Future<User> fetchUserById(String id) {
    return Future.delayed(Duration(seconds: 3), () {
      if (id == "101") {
        return User(id: "101", name: 'User101', age: Age(20));
      } else {
        throw Exception("User $id does not exist on server.");
      }
    });
  }
}
