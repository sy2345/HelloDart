//变量
//(https://dart.cn/guides/language/language-tour#variables)
void default_value() {
  //assert只能在调式模式作用，assert(condition)将会在条件判断为false时抛出一个异常。
  //未初始化以及可空类型的变量拥有一个默认的初始值 null
  int? lineCount;
  assert(lineCount == 0);
}

late String description;
void late_variables() {
  description = 'LateString!';
  print("LateString!");
}

//实例变量 可以是 final 的但不可以是 const
void final_and_const() {
  //a final variable can only be set once.
  final name = 'Bob'; // Without a type annotation
  final String nickname = 'Bobby';

  //在声明 const 变量时可以直接为其赋值，也可以使用其它的 const 变量为其赋值
  const bar = 1000000;
  const double atm = 1.01325 * bar;

  //没有使用 final 或 const 修饰的变量的值是可以被更改的，即使这些变量之前引用过 const 的值
  //Constant variables can't be assigned a value
  var foo = const [];
  final bar1 = const [];
  const baz = [];
  foo = [1, 2, 3];
}

void main() {
  default_value();
  late_variables();
  final_and_const();
}
