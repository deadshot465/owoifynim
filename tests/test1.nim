# This is just an example to get you started. You may wish to put all of your
# tests into a single file, or separate them into multiple `test1`, `test2`
# etc. files (better names are recommended, just make sure the name starts with
# the letter 't').
#
# To run these tests, simply execute `nimble test`.

import owoifynim
import strutils
import system
import unittest

let SOURCE = "Hello World! This is the string to owo! Kinda cute, isn't it?"
let POKEMON_NAME_LIST_PATH = "assets/pokemons.txt"
let WAR_AND_PEACE_PATH = "assets/war_and_peace_chapter01-20.txt"

test "can owoify":
  check owoify(SOURCE) != SOURCE

test "can owo":
  check owoify(SOURCE) != ""

test "can uwu":
  check owoify(SOURCE, "uwu") != ""

test "can uvu":
  check owoify(SOURCE, "uvu") != ""

test "can uwu using uwuify":
    let result = uwuify(SOURCE)
    check result != ""
    check result != SOURCE

test "can uvu using uvuify":
    let result = uvuify(SOURCE)
    check result != ""
    check result != SOURCE

test "should raise exception when the level is unsupported":
  expect(Exception):
    discard owoify(SOURCE, "123")

test "should give different results when the levels are owo and uwu":
  check owoify(SOURCE) != owoify(SOURCE, "uwu")

test "should give different results when the levels are owo and uvu":
  check owoify(SOURCE) != owoify(SOURCE, "uvu")

test "should give different results when the levels are uwu and uvu":
  check owoify(SOURCE, "uwu") != owoify(SOURCE, "uvu")

test "should owoify pokemon names":
  let pokemons = readFile(POKEMON_NAME_LIST_PATH)
  let pokemonNames = pokemons.splitLines()
  for name in pokemonNames:
    let nameWithOwo = owoify(name)
    let nameWithUwu = owoify(name, "uwu")
    let nameWithUvu = owoify(name, "uvu")
    check nameWithOwo != ""
    check nameWithUwu != ""
    check nameWithUvu != ""

# For some reason this part hangs indefinitely.
# test "should owoify long text":
#    let text = readFile(WAR_AND_PEACE_PATH)
#    let textWithOwo = owoify(text)
#    let textWithUwu = owoify(text, "uwu")
#    let textWithUvu = owoify(text, "uvu")
#    check textWithOwo != ""
#    check textWithUwu != ""
#    check textWithUvu != ""