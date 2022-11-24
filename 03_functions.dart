//函数
//(https://dart.cn/guides/language/language-tour#functions)

//使用 [] 将一系列参数包裹起来作为可选位置参数
String say(String from, String msg, [String? device]) {
  var result = '$from says $msg';
  if (device != null) {
    result = '$result with a $device';
  }
  return result;
}

//为位置参数设置默认值
String say1(String from, String msg, [String device = 'carrier pigeon']) {
  var result = '$from says $msg with a $device';
  return result;
}

//List 或 Map 同样也可以作为默认值
void doStuff(
    {List<int> list = const [1, 2, 3],
    Map<String, String> gifts = const {
      'first': 'paper',
      'second': 'cotton',
      'third': 'leather'
    }}) {
  print('list:  $list');
  print('gifts: $gifts');
}

//每个 Dart 程序都必须有一个 main() 顶级函数作为程序的入口， main() 函数返回值为 void 并且有一个 List<String> 类型的可选参数。
//void main(List<String> arguments) {}

//函数是一级对象
//可以将函数作为参数传递给另一个函数
void printElement(int element) {
  print(element);
}

//也可以将函数赋值给一个变量
var loudify = (msg) => '!!! ${msg.toUpperCase()} !!!';

//词法作用域
bool topLevel = true;
void scope() {
  var insideMain = true;

  void myFunction() {
    var insideFunction = true;

    void nestedFunction() {
      var insideNestedFunction = true;

      assert(topLevel);
      assert(insideMain);
      assert(insideFunction);
      assert(insideNestedFunction);
    }
  }
}

//词法闭包
//闭包,即一个函数对象，即使函数对象的调用在它原始作用域之外，依然能够访问在它词法作用域内的变量
/// Returns a function that adds [addBy] to the function's argument.
Function makeAdder(int addBy) {
  return (int i) => addBy + i;
}

void closure() {
  // Create a function that adds 2.
  var add2 = makeAdder(2);

  // Create a function that adds 4.
  var add4 = makeAdder(4);

  assert(add2(3) == 5);
  assert(add4(3) == 7);
}

//下面是顶级函数，静态方法和示例方法相等性的测试示例
void foo() {} // A top-level function

class A {
  static void bar() {} // A static method
  void baz() {} // An instance method
}

void test() {
  Function x;
  // Comparing top-level functions.
  x = foo;
  assert(foo == x);

  // Comparing static methods.
  x = A.bar;
  assert(A.bar == x);

  // Comparing instance methods.
  var v = A(); // Instance #1 of A
  var w = A(); // Instance #2 of A
  var y = w;
  x = w.baz;

  // These closures refer to the same instance (#2),
  // so they're equal.
  assert(y.baz == x);

  // These closures refer to different instances,
  // so they're unequal.
  assert(v.baz != w.baz);
}

//所有的函数都有返回值。没有显示返回语句的函数最后一行默认为执行 return null

//函数可以被赋值给变量或者作为其它函数的参数
//语法 => 表达式 是 { return 表达式; } 的简写， => 有时也称之为 箭头 函数。
void main() {
  //不使用可选参数调用say函数
  assert(say('Bob', 'Howdy') == 'Bob says Howdy');
  //使用可选参数调用say函数
  assert(say('Bob', 'Howdy', 'smoke signal') ==
      'Bob says Howdy with a smoke signal');
  assert(say1('Bob', 'Howdy') == 'Bob says Howdy with a carrier pigeon');

  doStuff();

  var list = [1, 2, 3];
  // Pass printElement as a parameter.
  list.forEach(printElement);

  assert(loudify('hello') == '!!! HELLO !!!');

  //创建一个没有名字的方法，称之为 匿名函数、 Lambda 表达式 或 Closure 闭包
  const list1 = ['apples', 'bananas', 'oranges'];
  list1.map((item) {
    return item.toUpperCase();
  }).forEach((item) {
    print('$item: ${item.length}');
  });
  //list.map((item) => item.toUpperCase()).forEach((item) => print('$item: ${item.length}'));

  scope();
  closure();
  test();
}
