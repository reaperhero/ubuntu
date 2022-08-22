String a = '5.2.2'

if (a.compareToIgnoreCase('4.2.2') > 0 ) {
    println('1')
} else {
    println('2')
}

if (${a} >= '4.2.2') {
    println(4)
}