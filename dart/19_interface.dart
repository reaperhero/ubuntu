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

class Mobile {
  int signal = 0;
}

class AndroidPhone implements Phone, Mobile {
  int signal = 0;
  void startup() {
    print('AndroidPhone 开机');
  }

  void shutdown() {
    print('AndroidPhone 关机');
  }
}
