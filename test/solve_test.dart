import 'package:solve/solve.dart';
import 'package:test/test.dart';

const epsilon = 1e-5;

void main() {
  group('solve', () {
    test(
      'returns empty list of roots if discriminant is negative',
      () => expect(solve(1, 0, 1), []),
    );
    test(
      'returns two distinct roots if discriminant is positive',
      () => expect(solve(1, 0, -1), [-1, 1]),
    );
    test(
      'returns two equal roots if discriminant is zero',
      () {
        // act
        final result = solve(1, 2 + epsilon * 0.1, 1, epsilon);

        // assert
        expect(result[0], closeTo(-1, epsilon));
        expect(result[1], closeTo(-1, epsilon));
      },
    );
    test(
      'throws exception if "a" is zero',
      () {
        expect(() => solve(0, 1, -1), throwsArgumentError);
        expect(() => solve(epsilon, 1, -1, epsilon), throwsArgumentError);
        expect(() => solve(epsilon * 0.1, 1, -1, epsilon), throwsArgumentError);
      },
    );
    test(
        'throw exception if any of the coefficients equals infinity, nan or negativeInfinity',
        () {
      expect(() => solve(double.infinity, 1, -1), throwsArgumentError);
      expect(() => solve(0, double.nan, -1), throwsArgumentError);
      expect(() => solve(0, 1, double.negativeInfinity), throwsArgumentError);
    });
  });
}
