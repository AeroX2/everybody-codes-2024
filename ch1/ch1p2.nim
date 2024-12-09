import std/os

let fileContent = readFile(paramStr(1))

var sum = 0
for i in countup(0, fileContent.len-2, 2):
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
    
    if (fileContent[i] != 'x' and fileContent[i+1] != 'x'):
        sum += 2
echo sum
    
