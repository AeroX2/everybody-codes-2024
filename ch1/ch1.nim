import std/os

let fileContent = readFile(paramStr(1))

var sum = 0
for c in fileContent:
    case c:
        of 'B':
            sum += 1
        of 'C':
            sum += 3
        else:
            discard
echo sum
    
