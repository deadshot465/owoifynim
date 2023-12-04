import nre
import sequtils
import strutils
import system
import "owoifynim/private/interleaveArrays"
import "owoifynim/private/presets"
import "owoifynim/private/word"

let WORD_REGEX = re"[^\s]+"
let SPACE_REGEX = re"\s+"

proc owoify*(source: string, level: string = "owo"): string =
  ## The main entry point of the owoify function.
  ## Pass in the source string and the desired owoify level.
  ## Currently, there are three levels available (from soft to hard): owo, uwu, uvu.
  ## Passing an unsupported owoness level will result in an exception.
  let wordMatches = source.findAll(WORD_REGEX, 0)
  let spaceMatches = source.findAll(SPACE_REGEX, 0)

  var words = wordMatches.map(proc (w: string): Word = initWord(w))
  var spaces = spaceMatches.map(proc (w: string): Word = initWord(w))

  let actualLevel = level.toLower()
  for op in SPECIFIC_WORD_MAPPING_LIST:
    words.apply(op)
  case actualLevel
  of "owo":
    for op in OWO_MAPPING_LIST:
      words.apply(op)
  of "uwu":
    for op in UWU_MAPPING_LIST:
      words.apply(op)
    for op in OWO_MAPPING_LIST:
      words.apply(op)
  of "uvu":
    for op in UVU_MAPPING_LIST:
      words.apply(op)
    for op in UWU_MAPPING_LIST:
      words.apply(op)
    for op in OWO_MAPPING_LIST:
      words.apply(op)
  else:
    raise newException(Exception, "The specified owoness level is not supported.")

  let res = interleaveArrays(words, spaces)
  return join(res.map(proc (w: Word): string = w.toString()), "")

proc uwuify*(source: string): string =
    return owoify(source, "uwu")

proc uvuify*(source: string): string =
    return owoify(source, "uvu")
