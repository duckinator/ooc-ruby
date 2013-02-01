use ruby

Ruby init()
test := Ruby load("./test.rb")
//test run()
Ruby require("./test.rb")

Ruby eval("puts 'hi'")
Ruby eval("5") println()
Ruby eval("[1,2,3]") inspect() println()

Ruby def("greet", |self, name| "Hello, %s!" format(name toCString()) toRString())
Ruby eval("greet('duck')") println()
Ruby send("greet", "bob" toRString()) println()

Ruby safe() toString() println()
Ruby safe(3) toString() println()
Ruby safe(1) toString() println()

Ruby def("test", |self, str|
    str println()
    str
)
Ruby eval("test 'hai'")

Ruby getConstant("Fixnum") def("meep", |self|
    "ohai from Fixnum" println()
    Ruby nil
)

1 toRNumber() send("meep")

Ruby getConstant("Fixnum") inspect() println()
Ruby getConstant("Fixnum") setConstant("K", Ruby getConstant("Kernel"))
Ruby getConstant("Fixnum") getConstant("K") inspect() println()

1 toRNumber() respondsTo?("methods") println()
1 toRNumber() respondsTo?("not_a_method") println()

1 toRNumber() send("+", 2 toRNumber()) println()

2 toRNumber() send("+", 2 toRNumber()) println() // I needed to test passing a RubyValue

(2 toRNumber() + 3) println()

rubyArray := Ruby eval("[1,2,3]")
rubyArray inspect() println()
rubyArray[0] = 2
rubyArray[1] = "Hai thar"
rubyArray inspect() println()

rubyHash := Ruby eval("{ 'a' => 'b', 'c' => 'd' }")
rubyHash["a"] = "hai"
rubyHash["ab"] = "hai"
rubyHash inspect() println()

(Ruby eval("[1,2,3]")[10] == Ruby nil) toString() println()

Ruby finalize()
