import '../entities/calculation_result.dart';

abstract class ICalculatorRepository {
  Calculation calculate(double a, double b, String op);
}