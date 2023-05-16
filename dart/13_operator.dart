void main(){

  //   赋值操作符
  // 1、AA ?? “999”表示：AA如果为空，则显示999
  // 2、AA ??= “999”表示：AA如果为空，则给值设置为999
  // 3、AA ~/999表示：AA对于999整除
  // 4、A?.a表示：A如果为空则不调用，如果不为空则调用a值
  // 5、A?.a??”999”表示：A如果为空则不调用，如果不为空则调用a值，然后a值为空则显示999


  // 优先级顺序
  // int x = 1;
  // int y = 2;
  // if(x == 1 && y == 2){
  //   print(x+y);
  // }

  // 算术操作符
  // print(5/2);
  // print(5~/2);
  // print(5 % 2);

  // 类型判定操作符
  // int a = 123;
  // String b = 'ducafecat';
  // String c = 'abc';
  // print(a as Object);
  // print(b is String);
  // print(c is! String);

  // 条件表达式
  // bool isFinish = true;
  // String txtVal = isFinish ? 'yes' : 'no';
  // print(txtVal);
  // bool isFinish;
  // isFinish = isFinish ?? false;
  // print(isFinish);

  // 级联操作符
  // StringBuffer sb = new StringBuffer();
  // sb
  // ..write('hello')
  // ..write('word')
  // ..write('\n')
  // ..writeln('doucafecat');
  // print(sb);

  // ?. 操作符
  // String a;
  // print(a?.length);

}