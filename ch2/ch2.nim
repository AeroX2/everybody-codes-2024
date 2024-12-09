import std/os
import std/strutils

let fileContent = readFile(paramStr(1))
let data = fileContent.split("\n\n")
let runics = data[0][6..^1].split(",")
let words = data[1]

echo runics
echo words

var sum = 0
for runic in runics:
    sum += words.count(runic)
echo sum
