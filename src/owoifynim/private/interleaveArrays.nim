import sequtils

proc interleaveArrays*[T](a: openArray[T], b: openArray[T]): seq[T] =
    ## Helper function to interleave and combine a sequence of strings and a sequence of spaces.
    ## Returns an interleaved array.
    var arr: seq[T] = @[]
    var observed = a.toSeq()
    var other = b.toSeq()
    var temp: seq[T] = @[]

    while observed.len() > 0:
        arr.add(observed[0])
        observed.delete(0)
        temp = observed
        observed = other
        other = temp

    if other.len() > 0:
        arr &= other

    return arr