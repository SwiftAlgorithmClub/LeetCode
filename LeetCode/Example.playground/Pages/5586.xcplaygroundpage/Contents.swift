
/*:
# 아스키 코드

입력으로 주어지는 문자열에서 연속으로 3개의 문자가 JOI 또는 IOI인 곳이 각각 몇 개 있는지 구하는 프로그램을 작성하시오.
 문자열을 알파벳 대문자로만 이루어져 있다. 예를 들어, 아래와 같이 "JOIOIOI"에는 JOI가 1개, IOI가 2개 있다.

[백준 5586](https://www.acmicpc.net/problem/5586)
*/

import Foundation

let str: String = readString(str: "JOIOIOIOI")

for s in str {
    if s == "J" {
        print("s")
    } else if s == "I" {
        print("i")
    }
}
