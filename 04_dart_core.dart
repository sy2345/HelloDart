//dart:core
//(https://dart.cn/guides/libraries/library-tour#dartcore---numbers-collections-strings-and-more)
import 'dart:core';

//顶级 print() 方法接受一个参数任意对象）并输出显示这个对象的字符串值(由 toString() 返回) 到控制台
void print_to_console() {
  String anObject = "hello world";
  print(anObject);
  print('I drink $anObject.');
}

//数字
void numbers() {
  assert(int.parse('42') == 42);
  assert(int.parse('0x42') == 66);
  assert(double.parse('0.50') == 0.5);

  assert(num.parse('42') is int);
  assert(num.parse('0x42') is int);
  assert(num.parse('0.50') is double);

  //radix 参数指定整数的进制基数
  assert(int.parse('42', radix: 16) == 66);

  // Convert an int to a string.
  assert(42.toString() == '42');

// Convert a double to a string.
  assert(123.456.toString() == '123.456');

// Specify the number of digits after the decimal.
  assert(123.456.toStringAsFixed(2) == '123.46');

// Specify the number of significant figures.
  assert(123.456.toStringAsPrecision(2) == '1.2e+2');
  assert(double.parse('1.2e+2') == 120.0);
}

//字符和正则表达式
void strings_and_regular_expressions() {
//在字符串中搜索
  // Check whether a string contains another string.
  assert('Never odd or even'.contains('odd'));

  // Does a string start with another string?
  assert('Never odd or even'.startsWith('Never'));

  // Does a string end with another string?
  assert('Never odd or even'.endsWith('even'));

  // Find the location of a string inside a string.
  assert('Never odd or even'.indexOf('odd') == 6);

//从字符串中提取数据
  // Grab a substring.
  assert('Never odd or even'.substring(6, 9) == 'odd');

  // Split a string using a string pattern.
  var parts = 'progressive web apps'.split(' ');
  assert(parts.length == 3);
  assert(parts[0] == 'progressive');

  // Get a UTF-16 code unit (as a string) by index.
  assert('Never odd or even'[0] == 'N');

  // Use split() with an empty string parameter to get
  // a list of all characters (as Strings); good for
  // iterating.
  for (final char in 'hello'.split('')) {
    print(char);
  }

  // Get all the UTF-16 code units in the string.
  var codeUnitList = 'Never odd or even'.codeUnits.toList();
  assert(codeUnitList[0] == 78);

//首字母大小写转换
  // Convert to uppercase.
  assert('web apps'.toUpperCase() == 'WEB APPS');

  // Convert to lowercase.
  assert('WEB APPS'.toLowerCase() == 'web apps');

//Trimming 和空字符串,使用 trim() 移除首尾空格。使用 isEmpty 检查一个字符串是否为空（长度为 0）
  // Trim a string.
  assert('  hello  '.trim() == 'hello');

  // Check whether a string is empty.
  assert(''.isEmpty);

  // Strings with only white space are not empty.
  assert('  '.isNotEmpty);

//替换部分字符串
//字符串是不可变的对象，也就是说字符串可以创建但是不能被修改
//没有一个方法实际的改变了字符串的状态。方法 replaceAll() 返回一个新字符串，并没有改变原始字符串
  var greetingTemplate = 'Hello, NAME!';
  var greeting = greetingTemplate.replaceAll(RegExp('NAME'), 'Bob');

  // greetingTemplate didn't change.
  assert(greeting != greetingTemplate);

//构建一个字符串
//writeAll() 的第二个参数为可选参数，用来指定分隔符
  var sb = StringBuffer();
  sb
    ..write('Use a StringBuffer for ')
    ..writeAll(['efficient', 'string', 'creation'], ' ')
    ..write('.');

  var fullString = sb.toString();

  assert(fullString == 'Use a StringBuffer for efficient string creation.');

//正则表达式
  // Here's a regular expression for one or more digits.
  var numbers = RegExp(r'\d+');

  var allCharacters = 'llamas live fifteen to twenty years';
  var someDigits = 'llamas live 15 to 20 years';

  // contains() can use a regular expression.
  assert(!allCharacters.contains(numbers));
  assert(someDigits.contains(numbers));

  // Replace every match with another string.
  var exedOut = someDigits.replaceAll(numbers, 'XX');
  assert(exedOut == 'llamas live XX to XX years');
}

void collections() {
//lists
  // Create an empty list of strings.
  var grains = <String>[];
  assert(grains.isEmpty);

  // Create a list using a list literal.
  var fruits = ['apples', 'oranges'];
  // Access a list item by index.
  assert(fruits[0] == 'apples');
  // Find an item in a list.
  assert(fruits.indexOf('apples') == 0);
  // Add to a list.
  fruits.add('kiwis');
  // Add multiple items to a list.
  fruits.addAll(['grapes', 'bananas']);
  // Get the list length.
  assert(fruits.length == 5);

  // Remove a single item.
  var appleIndex = fruits.indexOf('apples');
  fruits.removeAt(appleIndex);
  assert(fruits.length == 4);

  // Remove all elements from a list.
  fruits.clear();
  assert(fruits.isEmpty);

  // You can also create a List using one of the constructors.
  var vegetables = List.filled(99, 'broccoli');
  assert(vegetables.every((v) => v == 'broccoli'));

//sets
//set 是一个无序的，元素唯一的集合
  // Create an empty set of strings.
  var ingredients = <String>{};

  // Add new items to it.
  ingredients.addAll(['gold', 'titanium', 'xenon']);
  assert(ingredients.length == 3);

  // Adding a duplicate item has no effect.
  ingredients.add('gold');
  assert(ingredients.length == 3);

  // Remove an item from a set.
  ingredients.remove('gold');
  assert(ingredients.length == 2);

  // You can also create sets using
  // one of the constructors.
  var atomicNumbers = Set.from([79, 22, 54]);

  // Check whether an item is in the set.
  assert(ingredients.contains('titanium'));

  // Check whether all the items are in the set.
  assert(ingredients.containsAll(['titanium', 'xenon']));

  var nobleGases = Set.from(['xenon', 'argon']);
  var intersection = ingredients.intersection(nobleGases);
  assert(intersection.length == 1);
  assert(intersection.contains('xenon'));

//maps
//map 是一个无序的 key-value （键值对）集合
  // Maps often use strings as keys.
  var hawaiianBeaches = {
    'Oahu': ['Waikiki', 'Kailua', 'Waimanalo'],
    'Big Island': ['Wailea Bay', 'Pololu Beach'],
    'Kauai': ['Hanalei', 'Poipu']
  };

  // Maps can be built from a constructor.
  var searchTerms = Map();

  // Maps are parameterized types; you can specify what types the key and value should be.
  var nobleGases1 = {54: 'xenon'};

  // Retrieve a value with a key.
  assert(nobleGases1[54] == 'xenon');

  // Check whether a map contains a key.
  assert(nobleGases1.containsKey(54));

  // Remove a key and its value.
  nobleGases1.remove(54);
  assert(!nobleGases1.containsKey(54));

//公共集合方法
  //isEmpty
  //isNotEmpty
  //var teas = ['green', 'black', 'chamomile', 'earl grey'];
  //teas.forEach((tea) => print('I drink $tea'));
  //当在 map 对象上调用 `forEach() 方法时，函数必须带两个参数（key 和 value）
  /*
        hawaiianBeaches.forEach((k, v) {
        print('I want to visit $k and swim at $v');
        // I want to visit Oahu and swim at
        // [Waikiki, Kailua, Waimanalo], etc.
      });
    */
}

//Uri 类 提供对字符串的编解码操作
void uris() {
//编码和解码完整合法的URI
  var uri = 'https://example.org/api?foo=some message';

  var encoded = Uri.encodeFull(uri);
  assert(encoded == 'https://example.org/api?foo=some%20message');

  var decoded = Uri.decodeFull(encoded);
  assert(uri == decoded);
//解析 URI
  var uri_1 = Uri.parse('https://example.org:8080/foo/bar#frag');

  assert(uri_1.scheme == 'https');
  assert(uri_1.host == 'example.org');
  assert(uri_1.path == '/foo/bar');
  assert(uri_1.fragment == 'frag');
  assert(uri_1.origin == 'https://example.org:8080');
}

//DateTime 对象代表某个时刻，时区可以是 UTC 或者本地时区
void dates_and_times() {
  // Get the current date and time.
  var now = DateTime.now();
  print(now);

  // Create a new DateTime with the local time zone.
  var y2k = DateTime(2000); // January 1, 2000
  print(y2k);

  // Specify the month and day.
  y2k = DateTime(2000, 1, 2); // January 2, 2000
  print(y2k);

  // Specify the date as a UTC time.
  y2k = DateTime.utc(2000); // 1/1/2000, UTC
  print(y2k);

  // Specify a date and time in ms since the Unix epoch.
  y2k = DateTime.fromMillisecondsSinceEpoch(946684800000, isUtc: true);
  print(y2k);

  // Parse an ISO 8601 date.
  y2k = DateTime.parse('2000-01-01T00:00:00Z');
  print(y2k);

  // Add one year.
  var y2001 = y2k.add(const Duration(days: 366));
  assert(y2001.year == 2001);

  // Subtract 30 days.
  var december2000 = y2001.subtract(const Duration(days: 30));
  assert(december2000.year == 2000);
  assert(december2000.month == 12);

  // Calculate the difference between two dates.
  // Returns a Duration object.
  var duration = y2001.difference(y2k);
  assert(duration.inDays == 366); // y2k was a leap year.
}

//核心库包含各种工具类，可用于排序，映射值以及迭代
//比较对象
class Line implements Comparable<Line> {
  final int length;
  const Line(this.length);

  @override
  int compareTo(Line other) => length - other.length;
}

class Person {
  final String firstName, lastName;

  Person(this.firstName, this.lastName);

  // Override hashCode using the static hashing methods
  // provided by the `Object` class.
  @override
  int get hashCode => Object.hash(firstName, lastName);

  // You should generally implement operator `==` if you
  // override `hashCode`.
  @override
  bool operator ==(dynamic other) {
    return other is Person &&
        other.firstName == firstName &&
        other.lastName == lastName;
  }
}

//异常
//异常通常是一些可以预见和预知的情况,错误是无法预见或者预防的情况
//通常通过抛出一个应用特定的异常，来表示应用发生了错误
/*
class FooException implements Exception {
  final String? msg;

  const FooException([this.msg]);

  @override
  String toString() => msg ?? 'FooException';
}
*/

void main(List<String> args) {
  print_to_console();
  numbers();
  collections();
  uris();
  dates_and_times();

  var short = const Line(1);
  var long = const Line(100);
  assert(short.compareTo(long) < 0);

  var p1 = Person('Bob', 'Smith');
  var p2 = Person('Bob', 'Smith');
  var p3 = 'not a person';
  assert(p1.hashCode == p2.hashCode);
  assert(p1 == p2);
  assert(p1 != p3);
}
