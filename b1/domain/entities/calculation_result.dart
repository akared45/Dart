class Calculation {
    final double num1;
    final double num2;
    final String operator;
    final double result;

    Calculation({
        required this.num1,
        required this.num2,
        required this.operator,
        required this.result
    });

    @override
    String toString() => "$num1 $operator $num2 = $result";
}