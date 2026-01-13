import '../../domain/repositories/i_user_repository.dart';
import '../dtos/user_response.dto.dart';

class GetUserUseCase {
  final UserRepository repository;
  GetUserUseCase(this.repository);

  Future<UserResponseDTO> execute(String id) {
    return repository.fetchUserById(id).then((user) {
      return UserResponseDTO(
        "User ID: ${user.id}, Name: ${user.name}, Age: ${user.age}",
      );
    });
  }
}
