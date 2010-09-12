import structs/ArrayList
include ruby

extend SSizeT {
    toRNumber: extern(INT2NUM) func -> RubyValue
    toRFixnum: extern(INT2FIX) func -> RubyValue
}

extend Int {
    toRNumber: extern(INT2NUM) func -> RubyValue
    toRFixnum: extern(INT2FIX) func -> RubyValue
}

extend Long {
    toRNumber: extern(INT2NUM) func -> RubyValue
    toRFixnum: extern(INT2NUM) func -> RubyValue
}

extend Char {
    toRFixnum: extern(CHR2FIX) func -> RubyValue
}

extend CString {
    toRString: extern(rb_str_new2) func -> RubyValue
}

extend String {
    toRString: func -> RubyValue {
	this toCString() toRString()
    }
}

RubyId: cover from ID {
}

RubyValue: cover from VALUE {
    toRString: extern(rb_obj_as_string) func -> RubyValue
    rvalToCString: extern(RSTRING_PTR) func -> CString
    toCString: func -> CString {
	this toRString() rvalToCString()
    }

    toString: func -> String {
	this toCString() toString()
    }

    toBool: func -> Bool {
	(this != Ruby false && this != Ruby nil)
    }

    print: func {
	this toString() print()
    }

    println: func {
	this toString() println()
    }

    funcall: extern(rb_funcall2) func (id: RubyId, argc: Int, args: RubyValue*) -> RubyValue

    send: func ~rid (f: RubyId, args: ...) -> RubyValue {
	res := ArrayList<RubyValue> new()
	argc := 0
	args each (|arg|
	    res add(arg as RubyValue)
	    argc += 1
	)
	funcall(f, argc, res toArray())
    }

    send: func ~rvalue (f: RubyValue, args: ...) -> RubyValue {
	send(f toId(), args)
    }

    send: func ~oocstring (f: String, args: ...) -> RubyValue {
	send(Ruby intern(f), args)
    }

    getConstantFromId: extern(rb_const_get) func (id: RubyId) -> RubyValue
    getConstant: func (name: String) -> RubyValue {
	getConstantFromId(Ruby intern(name))
    }

    setConstantWithId: extern(rb_const_set) func (id: RubyId, value: RubyValue)
    setConstant: func (name: String, value: RubyValue) {
	setConstantWithId(Ruby intern(name), value)
    }

    respondsToWithId: extern(rb_respond_to) func (id: RubyId) -> Int
    respondsTo?: func (name: String) -> RubyValue {
	if(respondsToWithId(Ruby intern(name)) toString() != "0") { // Yes, yes, I know. So kill me.
	    return Ruby true
	} else {
	    return Ruby false
	}
    }

    toId: extern(SYM2ID) func -> RubyId

    inspect: extern(rb_inspect) func -> RubyValue

    def: extern(rb_define_method) func (name: CString, fn: Pointer, argc: Int)

    def: func ~noArgs (name: String, fn: Func (RubyValue) -> RubyValue) {
	def(name, (fn as Closure) thunk, 0)
    }

    def: func ~oneArg (name: String, fn: Func (RubyValue, RubyValue) -> RubyValue) {
	def(name, (fn as Closure) thunk, 1)
    }

    def: func ~twoArgs (name: String, fn: Func (RubyValue, RubyValue, RubyValue) -> RubyValue) {
	def(name, (fn as Closure) thunk, 2)
    }

    def: func ~threeArgs (name: String, fn: Func (RubyValue, RubyValue, RubyValue, RubyValue) -> RubyValue) {
	def(name, (fn as Closure) thunk, 3)
    }

    def: func ~fourArgs (name: String, fn: Func (RubyValue, RubyValue, RubyValue, RubyValue, RubyValue) -> RubyValue) {
	def(name, (fn as Closure) thunk, 4)
    }

    def: func ~fiveArgs (name: String, fn: Func (RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue) -> RubyValue) {
	def(name, (fn as Closure) thunk, 5)
    }

    def: func ~sixArgs (name: String, fn: Func (RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue) -> RubyValue) {
	def(name, (fn as Closure) thunk, 6)
    }

    def: func ~sevenArgs (name: String, fn: Func (RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue) -> RubyValue) {
	def(name, (fn as Closure) thunk, 7)
    }

    def: func ~eightArgs (name: String, fn: Func (RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue) -> RubyValue) {
	def(name, (fn as Closure) thunk, 8)
    }

    def: func ~nineArgs (name: String, fn: Func (RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue) -> RubyValue) {
	def(name, (fn as Closure) thunk, 9)
    }

    def: func ~tenArgs (name: String, fn: Func (RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue) -> RubyValue) {
	def(name, (fn as Closure) thunk, 10)
    }

    def: func ~elevenArgs (name: String, fn: Func (RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue) -> RubyValue) {
	def(name, (fn as Closure) thunk, 11)
    }

    def: func ~twelveArgs (name: String, fn: Func (RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue) -> RubyValue) {
	def(name, (fn as Closure) thunk, 12)
    }

    def: func ~thirteenArgs (name: String, fn: Func (RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue) -> RubyValue) {
	def(name, (fn as Closure) thunk, 13)
    }

    def: func ~fourteenArgs (name: String, fn: Func (RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue) -> RubyValue) {
	def(name, (fn as Closure) thunk, 14)
    }

    def: func ~fifteenArgs (name: String, fn: Func (RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue) -> RubyValue) {
	def(name, (fn as Closure) thunk, 15)
    }

    def: func ~sixteenArgs (name: String, fn: Func (RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue) -> RubyValue) {
	def(name, (fn as Closure) thunk, 16)
    }

    def: func ~seventeenArgs (name: String, fn: Func (RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue) -> RubyValue) {
	def(name, (fn as Closure) thunk, 17)
    }
}

RubyNode: cover from Pointer {
    run: extern(ruby_run_node) func -> Int
}

Ruby: class {
    // Some ruby types
    nil: extern(Qnil) static RubyValue
    true: extern(Qtrue) static RubyValue
    false: extern(Qfalse) static RubyValue

    rubyInit: extern(ruby_init) static func
    initLoadpath: extern(ruby_init_loadpath) static func
    init: static func {
	rubyInit()
	initLoadpath()
    }
    finalize: extern(ruby_finalize) static func
    script: extern(ruby_script) static func(CString)
    eval: extern(rb_eval_string) static func (CString) -> RubyValue

    load: extern(rb_load_file) static func (CString) -> RubyNode

    intern: extern(rb_intern2) static func ~withLength (CString, Long) -> RubyId
    intern: static func (name: String) -> RubyId {
	intern(name, name size)
    }

    getConstant: static func (name: String) -> RubyValue {
	eval("Kernel") getConstant(name)
    }

    setConstant: static func (name: String, value: RubyValue) {
	eval("Kernel") setConstant(name, value)
    }

    // Implement def() with variable # of args
    def: extern(rb_define_global_function) static func ~withArgc (name: CString, fn: Pointer, argc: Int)

    def: static func ~noArgs (name: String, fn: Func (RubyValue) -> RubyValue) {
	def(name, (fn as Closure) thunk, 0)
    }

    def: static func ~oneArg (name: String, fn: Func (RubyValue, RubyValue) -> RubyValue) {
	def(name, (fn as Closure) thunk, 1)
    }

    def: static func ~twoArgs (name: String, fn: Func (RubyValue, RubyValue, RubyValue) -> RubyValue) {
	def(name, (fn as Closure) thunk, 2)
    }

    def: static func ~threeArgs (name: String, fn: Func (RubyValue, RubyValue, RubyValue, RubyValue) -> RubyValue) {
	def(name, (fn as Closure) thunk, 3)
    }

    def: static func ~fourArgs (name: String, fn: Func (RubyValue, RubyValue, RubyValue, RubyValue, RubyValue) -> RubyValue) {
	def(name, (fn as Closure) thunk, 4)
    }

    def: static func ~fiveArgs (name: String, fn: Func (RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue) -> RubyValue) {
	def(name, (fn as Closure) thunk, 5)
    }

    def: static func ~sixArgs (name: String, fn: Func (RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue) -> RubyValue) {
	def(name, (fn as Closure) thunk, 6)
    }

    def: static func ~sevenArgs (name: String, fn: Func (RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue) -> RubyValue) {
	def(name, (fn as Closure) thunk, 7)
    }

    def: static func ~eightArgs (name: String, fn: Func (RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue) -> RubyValue) {
	def(name, (fn as Closure) thunk, 8)
    }

    def: static func ~nineArgs (name: String, fn: Func (RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue) -> RubyValue) {
	def(name, (fn as Closure) thunk, 9)
    }

    def: static func ~tenArgs (name: String, fn: Func (RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue) -> RubyValue) {
	def(name, (fn as Closure) thunk, 10)
    }

    def: static func ~elevenArgs (name: String, fn: Func (RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue) -> RubyValue) {
	def(name, (fn as Closure) thunk, 11)
    }

    def: static func ~twelveArgs (name: String, fn: Func (RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue) -> RubyValue) {
	def(name, (fn as Closure) thunk, 12)
    }

    def: static func ~thirteenArgs (name: String, fn: Func (RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue) -> RubyValue) {
	def(name, (fn as Closure) thunk, 13)
    }

    def: static func ~fourteenArgs (name: String, fn: Func (RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue) -> RubyValue) {
	def(name, (fn as Closure) thunk, 14)
    }

    def: static func ~fifteenArgs (name: String, fn: Func (RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue) -> RubyValue) {
	def(name, (fn as Closure) thunk, 15)
    }

    def: static func ~sixteenArgs (name: String, fn: Func (RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue) -> RubyValue) {
	def(name, (fn as Closure) thunk, 16)
    }

    def: static func ~seventeenArgs (name: String, fn: Func (RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue, RubyValue) -> RubyValue) {
	def(name, (fn as Closure) thunk, 17)
    }

    /// equivalent to $SAFE=x in ruby
    setSafe: extern(rb_set_safe_level) static func (Int) -> Int

    /// returns ruby's $SAFE level
    safe: extern(rb_safe_level) static func -> Int

    /** sets ruby's $SAFE to level then returns the current safe level
	returns true if $SAFE == level, false otherwise
    */
    safe: static func ~set (level: Int) -> Bool {
	setSafe(level)
	(safe() == level)
    }
}

/* Comparisons */

operator == (one, two: RubyValue) -> Bool {
    one send("==", two) toBool()
}

operator != (one, two: RubyValue) -> Bool {
    one send("!=", two) toBool()
}

/* Access and modification */

operator [] (item, index: RubyValue) -> RubyValue {
    item send("[]", index)
}

operator [] (item: RubyValue, index: SSizeT) -> RubyValue {
    item send("[]", index toRNumber())
}

/*operator [] (item: RubyValue, range: Range) -> RubyValue {
    item send("[]", range toRRange())
}*/

operator []= (item, index, value: RubyValue) -> RubyValue {
    item send("[]=", index, value)
}

operator []= (item, index: RubyValue, value: SSizeT) -> RubyValue {
    item send("[]=", index, value toRNumber())
}

operator []= (item, index: RubyValue, value: String) -> RubyValue {
    item send("[]=", index, value toRString())
}

operator []= (item, index: RubyValue, value: CString) -> RubyValue {
    item send("[]=", index, value toRString())
}

operator []= (item: RubyValue, index: SSizeT, value: RubyValue) -> RubyValue {
    item send("[]=", index toRNumber(), value)
}

operator []= (item: RubyValue, index: SSizeT, value: SSizeT) -> RubyValue {
    item send("[]=", index toRNumber(), value toRNumber())
}

operator []= (item: RubyValue, index: SSizeT, value: String) -> RubyValue {
    item send("[]=", index toRNumber(), value toRString())
}

operator []= (item: RubyValue, index: SSizeT, value: CString) -> RubyValue {
    item send("[]=", index toRNumber(), value toRString())
}

operator []= (item: RubyValue, index: String, value: RubyValue) -> RubyValue {
    item send("[]=", index toRString(), value)
}

operator []= (item: RubyValue, index: String, value: SSizeT) -> RubyValue {
    item send("[]=", index toRString(), value toRNumber())
}

operator []= (item: RubyValue, index: String, value: String) -> RubyValue {
    item send("[]=", index toRString(), value toRString())
}

operator []= (item: RubyValue, index: String, value: CString) -> RubyValue {
    item send("[]=", index toRString(), value toRString())
}

operator []= (item: RubyValue, index: CString, value: RubyValue) -> RubyValue {
    item send("[]=", index toRString(), value)
}

operator []= (item: RubyValue, index: CString, value: SSizeT) -> RubyValue {
    item send("[]=", index toRString(), value toRNumber())
}

operator []= (item: RubyValue, index: CString, value: String) -> RubyValue {
    item send("[]=", index toRString(), value toRString())
}

operator []= (item: RubyValue, index: CString, value: CString) -> RubyValue {
    item send("[]=", index toRString(), value toRString())
}

/* Concatenation, math, etc */

operator * (left, right: RubyValue) -> RubyValue {
    left send("*", right)
}

operator * (left: RubyValue, right: SSizeT) -> Bool {
    left send("*", right toRNumber()) toBool()
}

operator + (left, right: RubyValue) -> RubyValue {
    left send("+", right)
}

operator + (left: RubyValue, right: SSizeT) -> RubyValue {
    left send("+", right toRNumber())
}

operator + (left: RubyValue, right: String) -> RubyValue {
    left send("+", right toRString())
}

operator + (left: RubyValue, right: CString) -> RubyValue {
    left send("+", right toRString())
}

operator + (left: RubyValue, right: Char) -> RubyValue {
    left send("+", right toString() toRString())
}

Ruby init()
test := Ruby load("test.rb")
Ruby eval("puts 'hi'")
Ruby eval("5") println()
Ruby eval("[1,2,3]") inspect() println()

Ruby def("greet", |self, name| "Hello, %s!" format(name toCString()) toRString())
Ruby eval("greet('duck')") println()

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

2 toRNumber() send(Ruby eval(":+"), 2 toRNumber()) println() // I needed to test passing a RubyValue

(2 toRNumber() + 3) println()

rubyArray := Ruby eval("[1,2,3]")
rubyArray inspect() println()
rubyArray[0] = 2
rubyArray[1] = "Hai thar"
rubyArray inspect() println()

rubyHash := Ruby eval("{ 'a' => 'b', 'c' => 'd' }")
rubyHash["a"] = "hai"
rubyHash inspect() println()

//x := Ruby eval("[1,2,3]")[10] send("==", Ruby nil)
//(x != Ruby false)
//y := ((x != Ruby false) && (x != Ruby nil)) ? "true" : "false"

//(Ruby eval("[1,2,3]")[10] == Ruby nil) //toString() println()

Ruby finalize()
