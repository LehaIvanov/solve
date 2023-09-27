import 'package:solve/solve.dart' as solve;

void main(List<String> arguments) {
  final [a, b, c] = arguments.map((e) => double.parse(e)).toList();

  print(solve.solve(a, b, c));
}
