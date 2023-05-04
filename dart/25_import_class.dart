// phone.dart
abstract class Phone {
  factory Phone(String name) {
    switch (name) {
      case 'android':
        return new AndroidPhone();
        break;
      default:
        return new IOSPhone();
    }
  }
  void startup();
  void shutdown();
}

class AndroidPhone implements Phone {
  void startup() {
    print('Android Phone 开机');
  }
  void shutdown() {
    print('Android 关机');
  }
}

class IOSPhone implements Phone {
  void startup() {
    print('IOS Phone 开机');
  }
  void shutdown() {
    print('IOS 关机');
  }
}

// phone1.dart
// abstract class Phone {
//   factory Phone(String name) {
//     switch (name) {
//       case 'android':
//         return new AndroidPhone();
//         break;
//       default:
//         return new IOSPhone();
//     }
//   }
//   void startup();
//   void shutdown();
// }

// class AndroidPhone implements Phone {
//   void startup() {
//     print('Android 1 Phone 开机');
//   }
//   void shutdown() {
//     print('Android 1 关机');
//   }
// }

// class IOSPhone implements Phone {
//   void startup() {
//     print('IOS 1 Phone 开机');
//   }
//   void shutdown() {
//     print('IOS 1 关机');
//   }
// }

// import './phone.dart';
// import './phone1.dart' as pp;

// void main() {
//   var xm = Phone('android');
//   xm.startup();
//   xm.shutdown();

//   var xm1 = pp.Phone('android');
//   xm1.startup();
//   xm1.shutdown();
// }





// 延迟导入
//import './phone.dart' deferred as pp;

// void main() async {
//   var run = true;
//   if (run) {
//     await pp.loadLibrary();
//     var xm = pp.Phone('android');
//     xm.startup();
//     xm.shutdown();
//   }
// }



// 过滤导入
// import './phone.dart' hide AndroidPhone;
// import './phone.dart' show IOSPhone;

// void main() {
//   var xm = IOSPhone();
//   xm.startup();
//   xm.shutdown();
// }