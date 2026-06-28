# haxe swf/wasm test
i found out haxe is a thing so let's do it why not

## prerequisites
haxe (lmao you're building it yourself)

the following should be installed using `haxelib install`:

hxcpp

lime

openfl

after that run `haxelib run openfl setup`

## compiling the project
for the "unsafe" Flash version, run `haxelib run openfl build flash` (output will be in build/flash/bin)
for the Web Assembly version, run `haxelib run openfl build html5 -emscripten` (output will be in build/html5/bin, run index.html)
