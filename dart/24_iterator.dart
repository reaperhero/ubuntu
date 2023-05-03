// 同步生成器
// main(List<String> args) {
//   var it = naturalsTo(5).iterator;
//   while(it.moveNext()) {
//     print(it.current);
//   }
// }

// Iterable<int> naturalsTo(int n) sync* {
//   print('start');
//   int k = 0;
//   while (k < n) {
//     yield k++;
//   }
//   print('end');
// }

// 异步生成器
// import 'dart:async';

// main(List<String> args) {
//   // 流监听
//   // asynchronousNaturalsTo(5).listen((onData) {
//   //   print(onData);
//   // });

//   // 流监听 StreamSubscription 对象
//   StreamSubscription subscription = asynchronousNaturalsTo(5).listen(null);
//   subscription.onData((value) {
//     print(value);
//     // subscription.pause();
//   });
// }

// Stream<int> asynchronousNaturalsTo(int n) async* {
//   print('start');
//   int k = 0;
//   while (k < n) {
//     yield k++;
//   }
//   print('end');
// }

main(List<String> args) {
  var it = naturalsDownFrom(5).iterator;
  while (it.moveNext()) {
    print(it.current);
  }
}

Iterable<int> naturalsDownFrom(int n) sync* {
  if (n > 0) {
    yield n;
    yield* naturalsDownFrom(n - 1);
  }
}
