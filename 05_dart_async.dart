//dart:async - 异步编程
//(https://dart.cn/guides/libraries/library-tour#dartasync---asynchronous-programming)

//异步编程通常使用回调方法来实现
//Dart 提供了Future 和 Stream 对象
//Future 类似与 JavaScript 中的 Promise ，代表在将来某个时刻会返回一个结果
//Stream 类可以用来获取一系列的值，比如，一系列事件

import 'dart:async';

Future<void> printOrderMessage() async {
  print('Awaiting user order...');
  var order = await fetchUserOrder();
  print('Your order is: $order');
}

Future<String> fetchUserOrder() {
  // Imagine that this function is more complex and slow.
  return Future.delayed(const Duration(seconds: 4), () => 'Large Latte');
}

// You can ignore this function - it's here to visualize delay time in this example.
void countSeconds(int s) {
  for (var i = 1; i <= s; i++) {
    Future.delayed(Duration(seconds: i), () => print(i));
  }
}

Future<int> sumStream(Stream<int> stream) async {
  var sum = 0;
  try {
    await for (final value in stream) {
      sum += value;
    }
  } catch (e) {
    return -1;
  }
  return sum;
}

Stream<int> countStream(int to) async* {
  for (int i = 1; i <= to; i++) {
    if (i == 4) {
      throw Exception('Intentional exception');
    } else {
      yield i;
    }
  }
}

void main() async {
  countSeconds(4);
  await printOrderMessage();

  var stream = countStream(10);
  var sum = await sumStream(stream);
  print(sum); // -1
}