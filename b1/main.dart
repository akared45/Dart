import 'infrastructure/repositories/calculator_repository_impl.dart';
import 'application/use_cases/perform_calculation.dart';
import 'presentation/console_ui.dart';

void main() {
  final repo = CalculatorRepositoryImpl();
  final useCase = PerformCalculationUseCase(repo);
  final ui = ConsoleUI(useCase);

  ui.init();
}
