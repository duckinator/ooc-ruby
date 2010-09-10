include ruby

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

    p: func {
	this inspect() println()
    }
}

RubyNode: cover from Pointer {
    run: extern(ruby_run_node) func -> Int
}

Ruby: class {
    init: extern(ruby_init) static func
    finalize: extern(ruby_finalize) static func
    script: extern(ruby_script) static func(CString)
    eval: extern(rb_eval_string) static func (CString) -> RubyValue
    load: extern(rb_load_file) static func (CString) -> RubyNode

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
Ruby eval("[1,2,3]") p()
Ruby eval("def greet(name); \"Hello, #{name}!\"; end; greet('duck')") println()
Ruby safe() toString() println()
Ruby safe(3) toString() println()
Ruby safe(1) toString() println()
Ruby finalize()
