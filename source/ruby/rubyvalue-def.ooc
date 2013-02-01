use ruby

extend RubyValue {
    def: extern(rb_define_method) func (name: CString, fn: Pointer, argc: Int)

/* Can has typed varargs? kthx
    def: func ~args (name: String, fn: Func(RubyValue, args: RubyValue...) -> RubyValue) {
        def(name, (fn as Closure) thunk, fn args length())
    }*/

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
