//变量
//(https://dart.cn/guides/language/language-tour#variables)

void default_value(){
  int? lineCount;
  //assert() 的调用将会在生产环境的代码中被忽略掉。在开发过程中，assert(condition) 将会在 条件判断 为 false 时抛出一个异常。
  assert(lineCount == null);

  int lineCount1 = 0;
  assert(lineCount1==0);
}

late String description;
void late_variables(){
  description = 'LateString!';
  print("LateString!");
}

//实例变量 可以是 final 的但不可以是 const
void final_and_const(){
  final name = 'Bob'; // Without a type annotation
  final String nickname = 'Bobby';
  //a final variable can only be set once.

  //如果使用 const 修饰类中的变量，则必须加上 static 关键字，即 static const
  const bar = 1000000; // Unit of pressure (dynes/cm2)
  const double atm = 1.01325 * bar; // Standard atmosphere

  var foo = const [];
  final bar1 = const [];
  const baz = []; // Equivalent to `const []`
                  //Constant variables can't be assigned a value

  foo = [1, 2, 3]; // Was const []
}

void main(){
  default_value();
  late_variables();
  final_and_const();
}