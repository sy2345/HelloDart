//dart:math - 数学和随机数
//(https://dart.cn/guides/libraries/library-tour#dartmath---math-and-random)

import 'dart:math';

//最大值和最小值
void maximum_and_minimum() {
  assert(max(1, 1000) == 1000);
  assert(min(1, -1000) == -1000);
}

//数学常数
void math_constants() {
// See the Math library for additional constants.
  print(e); // 2.718281828459045
  print(pi); // 3.141592653589793
  print(sqrt2); // 1.4142135623730951
}

//随机数
void random_numbers() {
  var random = Random();
  print(random.nextDouble()); // Between 0.0 and 1.0: [0, 1)
  print(random.nextInt(10)); // Between 0 and 9.

  print(random.nextBool()); // true or false
}

void main(List<String> args) {
  maximum_and_minimum();
  math_constants();
  random_numbers();
}
