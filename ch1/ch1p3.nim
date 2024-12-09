import std/os
import std/strutils

let fileContent = readFile(paramStr(1))

var sum = 0
for i in countup(0, fileContent.len-3, 3):
    case fileContent[i]:
        of 'A':
            sum += 0
        of 'B':
            sum += 1
        of 'C':
            sum += 3
        of 'D':
            sum += 5
        else:
            discard

    case fileContent[i+1]:
        of 'A':
            sum += 0
        of 'B':
            sum += 1
        of 'C':
            sum += 3
        of 'D':
            sum += 5
        else:
            discard

    case fileContent[i+2]:
        of 'A':
            sum += 0
        of 'B':
            sum += 1
        of 'C':
            sum += 3
        of 'D':
            sum += 5
        else:
            discard
    
    let s = fileContent[i..i+2]
    case s.count('x'):
        of 0:
            sum += 6
        of 1:
            sum += 2
        of 2:
            sum += 0
        else:
            discard
echo sum
    
