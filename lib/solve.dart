import 'dart:math';

const _invalidValues = [double.negativeInfinity, double.nan, double.infinity];

void _validate(double a, double b, double c, double e) {
  if (a.abs() <= e) {
    throw ArgumentError.value(0, "a", "can't be zero");
  }

  final invalidEntry = <String, double>{
    "a": a,
    "b": b,
    "c": c,
  }.entries.where((entry) => _invalidValues.contains(entry.value)).firstOrNull;
  if (invalidEntry != null) {
    throw ArgumentError.value(
        invalidEntry.value, invalidEntry.key, "invalid value");
  }
}

List<double> solve(double a, double b, double c, [double e = 1e-5]) {
  _validate(a, b, c, e);

  final discriminant = b * b - 4 * a * c;

  if (discriminant > e) {
    return [
      (-b - sqrt(discriminant)) / 2 * a,
      (-b + sqrt(discriminant)) / 2 * a
    ];
  } else if (discriminant.abs() <= e) {
    final x = -b / (2 * a);
    return [x, x];
  }

  return [];
}
