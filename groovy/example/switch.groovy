String a = '5.2.2'

if (a.compareToIgnoreCase('4.2.2') > 0 ) {
    println('1')
} else {
    println('2')
}

if (a >= '4.2.2') {
    println(4)
}




def boolean checkBundle(a) {
     if (a<100) { 
        return true
      } else { 
        return false
      } 
}



println(checkBundle(90))

def iamList = [1,2,3,4,5]  //定义一个List变量
iamList.each{  //调用它的each函数，只要传入一个Closure就可以了。
  println it
}