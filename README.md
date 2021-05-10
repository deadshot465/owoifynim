# owoifynim
Turning your worst nightmare into a Nim package.

This is a Nim port of [mohan-cao's owoify-js](https://github.com/mohan-cao/owoify-js), which will help you turn any string into nonsensical babyspeak similar to LeafySweet's infamous Chrome extension.

Just like my other Owoify ports, three levels of owoness are available:

1. **owo (default)**: The most vanilla one.
2. **uwu**: The moderate one.
3. **uvu**: Litewawwy unweadabwal.

Please refer to the original [owoify-js repository](https://github.com/mohan-cao/owoify-js) for more information.

## Reason for development
Because it doesn't seem that Nim has any owoify package, and since I have already ported it to several languages, I might as well just keep porting it.

## Install instructions
Executing this in the command line:
```bash
nimble install owoifynim
```
Or add this to your nimble file:
```nim
# Dependencies

requires "owoifynim >= 1.0.0"
```

## Usage
```nim
import owoifynim

echo owoify("This is the string to owo! Kinda cute, isn't it?")
echo owoify("This is the string to owo! Kinda cute, isn't it?", "uvu")

# Example output
# This is teh stwing two owo! Kinda cute, isn't it?
# fwis is teh stwing two owo(/ =ω=)/ Kinda cute(/ =ω=)/ isn't it?
```

## Disclaimer
As usual, I'm writing this package for both practicing and bots' needs. Performance is **NOT** guaranteed.

That being said, all regular expressions are declared beforehand rather than being declared inside a function. That should be able to avoid the performance cost of building regular expressions every time the method is called.

## See also
- [owoify-js](https://github.com/mohan-cao/owoify-js) - The original owoify-js repository.
- [Owoify.Net](https://www.nuget.org/packages/Owoify.Net) - The C# port of Owoify written by me.
- [Owoify++](https://github.com/deadshot465/OwoifyCpp) - The C++ header-only port of Owoify written by me.
- [owoify_rs](https://crates.io/crates/owoify_rs) - The Rust port of Owoify written by me.
- [owoify-py](https://pypi.org/project/owoify-py/) - The Python port of Owoify written by me.
- [owoify_dart](https://pub.dev/packages/owoify_dart) - The Dart port of Owoify written by me.
- [owoify_rb](https://rubygems.org/gems/owoify_rb) - The Ruby port of Owoify written by me.
- [owoify-go](https://pkg.go.dev/github.com/deadshot465/owoify-go) - The Go port of Owoify written by me.
- [owoify_cr](https://github.com/deadshot465/owoify_cr) - The Crystal port of Owoify written by me.