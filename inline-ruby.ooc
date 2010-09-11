include ruby

extend Int {
    toRNumber: extern(INT2NUM) static func (Int) -> RubyValue
    toRFixnum: extern(INT2FIX) static func (Int) -> RubyValue
}

extend Long {
    toRNumber: extern(INT2NUM) static func (Long) -> RubyValue
    toRFixnum: extern(INT2NUM) static func (Long) -> RubyValue
}

extend Char {
    toRFixnum: extern(CHR2FIX) static func (Char) -> RubyValue
}

extend String {
    toRString: extern(rb_str_new2) static func (CString) -> RubyValue
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

    print: func {
	this toString() print()
    }

    println: func {
	this toString() println()
    }

    inspect: extern(rb_inspect) func -> RubyValue

    def: extern(rb_define_method) static func (class: RubyValue, name: CString, fn: Func (RubyValue) -> RubyValue, argc: Int)
}

RubyNode: cover from Pointer {
    run: extern(ruby_run_node) func -> Int
}

Ruby: class {
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

Ruby init()
test := Ruby load("test.rb")
Ruby eval("puts 'hi'")
Ruby eval("5") println()
Ruby eval("[1,2,3]") inspect() println()
Ruby eval("def greet(name); \"Hello, #{name}!\"; end; greet('duck')") println()
Ruby safe() toString() println()
Ruby safe(3) toString() println()
Ruby safe(1) toString() println()

Ruby def("test", |self, str| str println())
Ruby eval("test 'hai'")

Ruby finalize()
