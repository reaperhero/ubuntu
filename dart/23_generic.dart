main(List<String> args) {
  var p = Phone<String>('abc00000011111');
  print(p.mobileNumber);
}

class Phone<T> {
  final T mobileNumber;
  Phone(this.mobileNumber);
}


// main(List<String> args) {
//   var l = List<String>();
//   l.add('aaa');
//   l.add('bbb');
//   l.add('ccc');
//   print(l);

//   var m = Map<int, String>();
//   m[1] = 'aaaa';
//   m[2] = 'bbbb';
//   m[3] = 'cccc';
//   print(m);
// }


// 泛型函数
// main(List<String> args) {
//   var key = addCache('a00001', 'val.....');
//   print(key);
// }

// K addCache<K, V>(K key, V val) {
//   print('${key} ${val}');
//   return key;
// }


// 泛型限制
// main(List<String> args) {
//   var ad = AndroidPhone();
//   var p = Phone<AndroidPhone>(ad);
//   p.mobile.startup();
// }

// class Phone<T extends AndroidPhone > {
//   final T mobile;
//   Phone(this.mobile);
// }

// class AndroidPhone {
//   void startup() {
//     print('Android Phone 开机');
//   }
// }
