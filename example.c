#include <ruby.h>

int main(int argc, char *argv[])
{
	ruby_init();
	rb_eval_string("puts 'hello world'");
	ruby_finalize();
	return 0;
}
