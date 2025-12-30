import '../../domain/entities/calculation_result.dart';
import '../../domain/repositories/i_calculator_repository.dart';

class PerformCalculationUseCase {
  final ICalculatorRepository repository;

  PerformCalculationUseCase(this.repository);

  Calculation execute(double a, double b, String op) {
    return repository.calculate(a, b, op);
  }
}