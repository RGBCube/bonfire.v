module main

import os
import rgbcube.bonfire { Snowflake, TimeFormat }

[noreturn]
fn print_help_and_exit1() {
	println('Usage: <format> <id>')
	println('Format can be either short_time, long_time, short_date, long_date, short_date_time, long_date_time or relative')
	exit(1)
}

fn main() {
	time := Snowflake(os.args[2] or { print_help_and_exit1() }.i64()).created_at()

	format_str := os.args[1]

	format := match format_str {
		'short_time' { TimeFormat.short_time }
		'long_time' { TimeFormat.long_time }
		'short_date' { TimeFormat.short_date }
		'long_date' { TimeFormat.long_date }
		'short_date_time' { TimeFormat.short_date_time }
		'long_date_time' { TimeFormat.long_date_time }
		'relative' { TimeFormat.relative }
		else { print_help_and_exit1() }
	}

	println(time.format(format))
}
