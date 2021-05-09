import nre
import sequtils
import strutils

type
  Word* = object
    word*: string
    replacedWords*: seq[string]

proc initWord*(word: string): Word =
  ## Initializes a new ``Word`` object.
  Word(word: word, replacedWords: @[])

proc searchValueContainsReplacedWords(word: Word, searchValue: Regex, replaceValue: string): bool =
  return word.replacedWords.any(proc (w: string): bool =
    let matches = w.findAll(searchValue, 0)
    if matches.len() > 0:
      let matchResult = matches[0]
      return w.replace(matchResult, replaceValue) == replaceValue
    else:
      return false
  )

proc replace*(word: var Word, searchValue: Regex, replaceValue: string, replaceReplacedWords: bool = false) =
  if not replaceReplacedWords and searchValueContainsReplacedWords(word, searchValue, replaceValue):
    return

  var replacingWord = word.word
  var collection = word.word.findAll(searchValue)
  if collection.len() > 0:
    replacingWord = word.word.replace(searchValue, replaceValue)
  
  var replacedWords: seq[string] = @[]
  if collection.len() > 1:
    replacedWords = collection.map(proc (w: string): string = w.replace(w, replaceValue))

  if replacingWord != word.word:
    for w in replacedWords:
      word.replacedWords.add(w)
    word.word = replacingWord

proc replaceWithProcSingle*(word: var Word, searchValue: Regex, op: proc (): string{.closure.}, replaceReplacedWords: bool = false) =
  let replaceValue = op()
  
  if not replaceReplacedWords and searchValueContainsReplacedWords(word, searchValue, replaceValue):
    return

  var replacingWord = word.word
  var collection = word.word.findAll(searchValue, 0)
  if collection.len() > 0:
    let match = collection[0]
    replacingWord = word.word.replace(match, replaceValue)

  var replacedWords: seq[string] = @[]
  if collection.len() > 1:
    replacedWords = collection.map(proc (w: string): string = w.replace(w, replaceValue))

  if replacingWord != word.word:
    for w in replacedWords:
      word.replacedWords.add(w)
    word.word = replacingWord

proc replaceWithProcMultiple*(word: var Word, searchValue: Regex, op: proc(x: string, y: string): string{.closure.}, replaceReplacedWords: bool = false) =
  if word.word.findAll(searchValue, 0).len() == 0:
    return

  let innerWord = word.word
  var captures = innerWord.find(searchValue).get
  var replaceValue = op(captures.captures[0], captures.captures[1])

  if not replaceReplacedWords and searchValueContainsReplacedWords(word, searchValue, replaceValue):
    return

  var collection = word.word.findAll(searchValue, 0)
  let replacingWord = word.word.replace(collection[0], replaceValue)
  var replacedWords: seq[string] = @[]
  if collection.len() > 1:
    replacedWords = collection.map(proc (w: string): string = w.replace(w, replaceValue))

  if replacingWord != word.word:
    for w in replacedWords:
      word.replacedWords.add(w)
    word.word = replacingWord

proc toString*(word: Word): string = word.word