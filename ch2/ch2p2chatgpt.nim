import std/os
import std/strutils
import std/unicode
import std/sequtils
import std/algorithm
import std/sets

let fileContent = readFile(paramStr(1))
let data = fileContent.split("\n\n")
let runics = data[0][6..^1].split(",")
let lines = data[1].splitLines()

proc findAllMatches(s: string, runics: seq[string]): seq[(int, int)] =
    ## Find all matches (start and end indices) for given runics in a string
    var matches: seq[(int, int)] = @[]
    for rune in runics:
        var start = 0
        while true:
            let idx = s.find(rune, start)
            if idx == -1: break
            matches.add((idx, idx + rune.len))
            start = idx + 1
    return matches

proc mergeOverlappingRanges(ranges: seq[(int, int)]): seq[(int, int)] =
    ## Merge overlapping and contiguous ranges
    if ranges.len == 0:
        return @[]
    var merged: seq[(int, int)] = @[]
    var current = ranges[0]
    for r in ranges[1..^1]:
        if r[0] <= current[1]:  # Overlapping or contiguous
            current[1] = max(current[1], r[1])
        else:
            merged.add(current)
            current = r
    merged.add(current)
    return merged

proc countRunicSymbols(s: string, runics: seq[string]): int =
    let matches = findAllMatches(s, runics)

    let sortedMatches = matches.sorted()
    for m in sortedMatches:
        echo s[m[0]..m[1]-1]

    let mergedRanges = mergeOverlappingRanges(sortedMatches)
    var totalSymbols = 0
    for r in mergedRanges:
        totalSymbols += r[1] - r[0]
    return totalSymbols

var allRunics: HashSet[string] = initHashSet[string]()
for rune in runics:
    allRunics.incl(rune)
    allRunics.incl(rune.reversed)

var totalSymbols = 0
for line in lines:
    totalSymbols += countRunicSymbols(line, toSeq(allRunics))
echo totalSymbols