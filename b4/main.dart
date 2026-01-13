import 'application/usecases/get_user_usecase.dart';
import 'infrastructure/repositories/user_repository_impl.dart';

void main() {
  final repository = UserRepositoryImpl();
  final useCase = GetUserUseCase(repository);

  print("--- Get info user ---");

  List<String> userIds = ["101", "102", "103"];

  userIds.forEach((id) {
    useCase
        .execute(id)
        .then((response) {
          print("Info: ${response.info}");
        })
        .catchError((error) {
          print("Error $id: $error");
        });
  });

    print("---wait ---");
}
