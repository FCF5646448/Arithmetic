import UIKit

/*
 1、字符串翻转，
 给出一个字符串，要求按照单词顺序进行翻转：
 eg: "the sky is blue" 转成 "blue is sky the"
 */

func reverse<T>(_ chars:[T], _ start:Int, _ end:Int)->[T] {
    var tempstart = start, tempend = end
    var tempChars:[T] = chars
    //整个单词翻转
    while tempstart < tempend {
        (tempChars[tempstart], tempChars[tempend]) = (tempChars[tempend], tempChars[tempstart])
        print(tempChars)
        tempstart += 1
        tempend -= 1
    }
    
    let result = tempChars[start...end]
    return [T](result)
}

let str = "the sky is blue"
let sChars = Array(str)
//先将整个字符串
let result = reverse(sChars, 0, sChars.count-1)
//print(String(result))

print("\n")
//然后逐个旋转单词
let sChars2 = Array(String(result))
var start = 0
var resultStr = ""
for i in 0..<sChars2.count {
    if i == sChars2.count - 1 || sChars2[i+1] == " " {
        let word = reverse(sChars2, start, i)
        resultStr.append(String(word))
        resultStr.append(" ")
        start = i + 2
    }
}
print(resultStr)




