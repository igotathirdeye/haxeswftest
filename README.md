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
for the Flash version, run `haxelib run openfl build flash` (output will be in build/flash/bin), if you don't have Adobe Flash Player just use Ruffle
for the Web Assembly version, run `haxelib run openfl build html5 -emscripten` (output will be in build/html5/bin, run index.html)
