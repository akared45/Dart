import 'presentation/service_locator.dart' as di;
import 'presentation/views/student_view.dart';

void main() async {
  await di.init();
  final view = di.sl<StudentView>();
  await view.showMenu();
}
