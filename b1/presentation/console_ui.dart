import 'dart:io';
import '../application/use_cases/perform_calculation.dart';

class ConsoleUI {
  final PerformCalculationUseCase useCase;

  ConsoleUI(this.useCase);

  void init() {
    while (true) {
      print('\n--- MÁY TÍNH CLEAN ARCH (FULL ENTITIES) ---');
      print('1: +, 2: -, 3: *, 4: /, 5: Thoát');
      stdout.write('Chọn: ');
      String? choice = stdin.readLineSync();

      if (choice == '5') break;

      try {
        stdout.write('Nhập a: ');
        double a = double.parse(stdin.readLineSync()!);
        stdout.write('Nhập b: ');
        double b = double.parse(stdin.readLineSync()!);
        final calculation = useCase.execute(a, b, choice!);
        print('=> ${calculation.toString()}');
      } catch (e) {
        print('=> Lỗi: $e');
      }
    }
  }
}