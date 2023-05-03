void main() {
  var p = AndroidPhone();
  p.startup();
  p.shutdown();
}

class Phone {
  void startup() {
    print('开机');
  }

  void shutdown() {
    print('关机');
  }
}

class AndroidPhone extends Phone {}



// 继承抽象类的问题
// void main() {
//   var p = AndroidPhone();
//   p.startup();
//   p.shutdown();
// }

// abstract class Phone {
//   void startup();
//   void shutdown();
// }

// class AndroidPhone extends Phone {
//   void startup() {
//     print('开机');
//   }
//   void shutdown() {
//     print('关机');
//   }
// }


// 父类调用
// void main() {
//   var p = AndroidPhone();
//   p.startup();
// }

// class Phone {
//   void startup() {
//     print('开机');
//   }
//   void shutdown() {
//     print('关机');
//   }
// }

// class AndroidPhone extends Phone {
//   void startup() {
//     super.startup();
//     print('AndroidPhone 开机');
//   }
// }


// 调用父类构造
// void main() {
//   var p = AndroidPhone(12345678);
//   p.showNumber();
// }

// class Mobile {
//   int number;
//   int signal;
//   Mobile(this.number);
//   void showNumber() {
//     print('010-${number}');
//   }
// }

// class AndroidPhone extends Mobile {
//   AndroidPhone(int number) : super(number);
// }


// 重写超类函数
// void main() {
//   dynamic p = AndroidPhone(12345678);
//   p.showNumber111();
// }

// class Mobile {
//   int number;
//   int signal;
//   Mobile(this.number);
//   void showNumber() {
//     print('010-${number}');
//   }
// }

// class AndroidPhone extends Mobile {
//   AndroidPhone(int number) : super(number);

//   @override
//   void noSuchMethod(Invocation mirror) {
//     print('被重写 noSuchMethod');
//   }
// }






// 函数冲突
// void main() {
//   var xm = Xiaomi();
//   xm.startup();
//   xm.shutdown();
//   xm.sms();
// }

// class Phone {
//   void startup() {
//     print('开机');
//   }
//   void shutdown() {
//     print('关机');
//   }
// }

// class AndroidPhone extends Phone {
//   void startup() {
//     super.startup();
//     print('AndroidPhone 开机');
//   }
// }

// class AndroidSystem {
//   void call() {
//     print('android call');
//   }
// }

// class Weixin {
//   void sms() {
//     print('weixin sms');
//   }
// }

// class QQ {
//   void sms() {
//     print('qq sms');
//   }
// }

// class Xiaomi extends AndroidPhone with AndroidSystem, Weixin, QQ {
//   void startup() {
//     super.startup();
//     print('AndroidPhone 开机');
//   }
// }




// 多继承类
// void main() {
//   var xm = Xiaomi();
//   xm.startup();
//   xm.shutdown();
//   xm.call();
//   xm.sms();
// }

// class Phone {
//   void startup() {
//     print('开机');
//   }
//   void shutdown() {
//     print('关机');
//   }
// }

// class AndroidPhone extends Phone {
//   void startup() {
//     super.startup();
//     print('AndroidPhone 开机');
//   }
// }

// class AndroidSystem {
//   void call() {
//     print('android call');
//   }
// }

// class Weixin {
//   void sms() {
//     print('weixin sms');
//   }
// }

// class Xiaomi extends AndroidPhone with AndroidSystem, Weixin {
//   void startup() {
//     super.startup();
//     print('AndroidPhone 开机');
//   }
// }