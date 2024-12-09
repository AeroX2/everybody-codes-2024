import std/os
import std/strutils
import std/unicode
import std/sequtils
import std/sets

let fileContent = readFile(paramStr(1))
let data = fileContent.split("\n\n")
let runics = data[0][6..^1].split(",")
let lines = data[1].splitLines()

echo runics

proc findFirst(s: string, b: seq[string], start = 0): (int, string) = 
    var minInd = -1;
    var minM = "";
    for m in b:
        let ind = s.find(m, start)
        if (ind != -1 and (minInd == -1 or ind < minInd)):
            minInd = ind
            minM = m
    return (minInd, minM)

proc countRunics(s: string, runics: seq[string]): int =
    var sum = 0

    var (ind, m) = s.findFirst(runics)
    while ind != -1:
        # echo m
        sum += m.len

        var prevInd = ind
        var prevM = m
        (ind, m) = s.findFirst(runics, ind+1)

        # I still don't understand why this doesn't work, I give up...
        if (ind != -1 and ind <= (prevInd + prevM.len - 1)):
            # echo "overlap"
            # echo prevInd + prevM.len - 1
            # echo ind
            # echo prevM
            # echo m
            sum -= ((prevInd + prevM.len - 1) - ind) + 1
            # ind += ((prevInd + m.len) - ind+1)
    return sum

var allRunics: HashSet[string] = initHashSet[string]()
for rune in runics:
    allRunics.incl(rune)
    allRunics.incl(rune.reversed)
echo allRunics

var sum = 0
for words in lines:
    sum += countRunics(words, toSeq(allRunics))
    echo words
    echo sum
echo sum
