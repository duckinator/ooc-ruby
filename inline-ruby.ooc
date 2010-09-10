include ruby

RubyValue: cover from VALUE {
    toCString: extern(RSTRING_PTR) func -> CString
    toString: func -> String {
	this toCString() toString()
    }

    print: func {
	this toString() print()
    }

    println: func {
	this toString() println()
    }

    inspect: func {
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
}

Ruby init()
test := Ruby load("test.rb")
Ruby eval("puts 'hi'")
Ruby eval("'5'") println()
Ruby eval("def greet(name); \"Hello, #{name}!\"; end; greet('duck')") println()
Ruby finalize()