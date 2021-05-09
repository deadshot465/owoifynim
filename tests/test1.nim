# This is just an example to get you started. You may wish to put all of your
# tests into a single file, or separate them into multiple `test1`, `test2`
# etc. files (better names are recommended, just make sure the name starts with
# the letter 't').
#
# To run these tests, simply execute `nimble test`.

import owoifynim
import system
import unittest

let SOURCE = "Hello World! This is the string to owo! Kinda cute, isn't it?"

test "can owoify":
  check owoify(SOURCE) != SOURCE

test "can owo":
  check owoify(SOURCE) != ""

test "can uwu":
  check owoify(SOURCE, "uwu") != ""

test "can uvu":
  check owoify(SOURCE, "uvu") != ""

test "should raise exception when the level is unsupported":
  expect(Exception):
    discard owoify(SOURCE, "123")

test "should give different results when the levels are owo and uwu":
  check owoify(SOURCE) != owoify(SOURCE, "uwu")

test "should give different results when the levels are owo and uvu":
  check owoify(SOURCE) != owoify(SOURCE, "uvu")

test "should give different results when the levels are uwu and uvu":
  check owoify(SOURCE, "uwu") != owoify(SOURCE, "uvu")