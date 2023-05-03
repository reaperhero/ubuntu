void main() {
  bool b = isNoble(2);
  print(b);
}

bool isNoble(int atomicNumber) {
  return atomicNumber != null;
}

// 基础方式
// int add(int x) {
//   return x + 1;
// }

// 可选参数
// int add(int x, [int y, int z]) {
//   if (y == null) {
//     y = 1;
//   }
//   if (z == null) {
//     z = 1;
//   }
//   return x + y + z;
// }

// 可选参数 默认值
// int add(int x, [int y = 1, int z = 2]) {
//   return x + y;
// }

// 命名参数 默认值
// int add({int x = 1, int y = 1, int z = 1}) {
//   return x + y + z;
// }

// Funcation 返回函数对象
// Function makeAdd(int x) {
//   return (int y) => x + y;
// }



// 工厂函数
// void main() {
//   var xm = phoneFactory('ios');
//   xm.startup();
//   xm.shutdown();
// }

// class Phone {
//   void startup() {
//     print('开机');
//   }
//   void shutdown() {
//     print('关机');
//   }
// }

// Phone phoneFactory(String name) {
//   switch (name) {
//     case 'android':
//       return new AndroidPhone();
//       break;
//     default:
//       return new IOSPhone();
//   }
// }

// class AndroidPhone extends Phone {
//   void startup() {
//     super.startup();
//     print('Android Phone 开机');
//   }
// }

// class IOSPhone extends Phone {
//   void startup() {
//     super.startup();
//     print('IOS Phone 开机');
//   }
// }




// 工厂构造函数
// void main() {
//   var xm = Phone('android');
//   xm.startup();
//   xm.shutdown();
// }

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
//     print('Android Phone 开机');
//   }
//   void shutdown() {
//     print('Android 关机');
//   }
// }

// class IOSPhone implements Phone {
//   void startup() {
//     print('IOS Phone 开机');
//   }
//   void shutdown() {
//     print('IOS 关机');
//   }
// }
