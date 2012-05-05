all: inline-ruby

ARCH := x86_64
CC := rock

inline-ruby: inline-ruby.ooc
	${CC} inline-ruby.ooc -I/usr/include/ruby-1.9.1/ -I/usr/include/ruby-1.9.1/${ARCH}-linux/ -lruby -o=inline-ruby -g

test: inline-ruby
  ./inline-ruby

clean:
	rm -rf example inline-ruby

.PHONY: all clean test
