//内置类型
//(https://dart.cn/guides/language/language-tour#built-in-types)

//Dart 支持两种 Number 类型:int 和 double
void numbers() {
  //(1)整数是不带小数点的数字
  var x = 1;
  var hex = 0xDEADBEEF;

  //(2)浮点型包含小数点
  var y = 1.1;
  var exponents = 1.42e5;

  // (3)x can have both int and double values
  num x1 = 1;
  x1 += 2.5;

  //(4)整型字面量将会在必要的时候自动转换成浮点数字面量
  double z = 1; // Equivalent to double z = 1.0.

  //(5)字符串和数字之间的转换方式
  // String -> int
  var one = int.parse('1');
  assert(one == 1);

  // String -> double
  var onePointOne = double.parse('1.1');
  assert(onePointOne == 1.1);

  // int -> String
  String oneAsString = 1.toString();
  assert(oneAsString == '1');

  // double -> String
  String piAsString = 3.14159.toStringAsFixed(2);
  assert(piAsString == '3.14');

  //(6)整型支持传统的位移操作，比如移位（<<、>> 和 >>>）、补码 (~)、按位与 (&)、按位或 (|) 以及按位异或 (^)
  assert((3 << 1) == 6); // 0011 << 1 == 0110
  assert((3 | 4) == 7); // 0011 | 0100 == 0111
  assert((3 & 4) == 0); // 0011 & 0100 == 0000

  //(7)数字字面量为编译时常量。很多算术表达式只要其操作数是常量，则表达式结果也是编译时常量
  const msPerSecond = 1000;
  const secondsUntilRetry = 5;
  const msUntilRetry = secondsUntilRetry * msPerSecond;
}

void strings() {
  //使用单引号或者双引号来创建字符串
  var s1 = 'Single quotes work well for string literals.';
  var s2 = "Double quotes work just as well.";
  var s3 = 'It\'s easy to escape the string delimiter.';
  var s4 = "It's even easier to use the other delimiter.";

  //在字符串中，请以 ${表达式} 的形式使用表达式，如果表达式是一个标识符，可以省略掉 {}。如果表达式的结果为一个对象，则 Dart 会调用该对象的 toString 方法来获取一个字符串
  var s = 'string interpolation';
  assert('Dart has $s, which is very handy.' ==
      'Dart has string interpolation, ' 'which is very handy.');
  assert('That deserves all caps. ' '${s.toUpperCase()} is very handy!' ==
      'That deserves all caps. ' 'STRING INTERPOLATION is very handy!');

  //使用 + 运算符或并列放置多个字符串来连接字符串
  var s5 = 'String '
      'concatenation'
      " works even over line breaks.";
  print(s5);

  var s6 = 'The + operator ' + 'works, as well.';
  print(s6);

  //使用三个单引号或者三个双引号也能创建多行字符串
  var s7 = '''
  You can create
  multi-line strings like this one.
  ''';
  print(s7);

  var s8 = """This is also a
  multi-line string.""";
  print(s8);

  //在字符串前加上 r 作为前缀创建 “raw” 字符串（即不会被做任何处理（比如转义）的字符串）
  var s9 = r'In a raw string, not even \n gets special treatment.';
  print(s9);
}

//不允许使用类似 if (nonbooleanValue) 或者 assert (nonbooleanValue) 这样的代码检查布尔值
//相反，应显示地检查布尔值
void booleans() {
  // Check for an empty string.
  var fullName = '';
  assert(fullName.isEmpty);

// Check for zero.
  var hitPoints = 0;
  assert(hitPoints <= 0);

// Check for null.
  var unicorn;
  assert(unicorn == null);

// Check for NaN.
  var iMeantToDoThis = 0 / 0;
  assert(iMeantToDoThis.isNaN);
}

void lists() {
  //这里 Dart 推断出 list 的类型为 List<int>，如果往该数组中添加一个非 int 类型的对象则会报错
  var list = [1, 2, 3];
  assert(list.length == 3);
  assert(list[1] == 2);

  list[1] = 1;
  assert(list[1] == 1);

  var list2 = [0, ...list];
  assert(list2.length == 4);
}

void sets() {
  var halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};

  var names = <String>{};
  // Set<String> names = {}; // This works, too.
  // var names = {}; // Creates a map, not a set.

  var elements = <String>{};
  elements.add('fluorine');
  elements.addAll(halogens);
  print(elements);
  assert(elements.length == 6);
}

void maps() {
  var gifts = {
    // Key:    Value
    'first': 'partridge',
    'second': 'turtledoves',
    'fifth': 'golden rings'
  };

  var nobleGases = {
    2: 'helium',
    10: 'neon',
    18: 'argon',
  };

  //如果你向这两个 Map 对象中添加不正确的类型值，将导致运行时异常
  gifts['fourth'] = 'calling birds';

  //如果检索的 Key 不存在于 Map 中则会返回一个 null
  assert(gifts['fifth'] == 'null');
}

void main() {
  numbers();
  strings();
  booleans();
  lists();
  sets();
  maps();
}
