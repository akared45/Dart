import '../../domain/entities/calculation_result.dart';
import '../../domain/repositories/i_calculator_repository.dart';

class CalculatorRepositoryImpl implements ICalculatorRepository {
  @override
  Calculation calculate(double a, double b, String op) {
    double res;
    String symbol;

    switch (op) {
      case '1': res = a + b; symbol = '+'; break;
      case '2': res = a - b; symbol = '-'; break;
      case '3': res = a * b; symbol = '*'; break;
      case '4':
        if (b == 0) throw Exception("Cannot be divided by zero");
        res = a / b; symbol = '/';
        break;
      default: throw Exception("Invalid operator");
    }

    return Calculation(num1: a, num2: b, operator: symbol, result: res);
  }
}