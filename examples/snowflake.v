module main

import os
import rgbcube.bonfire { Snowflake }

fn main() {
	snowflake := Snowflake(os.args[1] or {
		println('Usage: <id>')
		exit(1)
	}.i64())

	println('Snowflake: ${snowflake}')
	println('- Created at: ${snowflake.created_at()}')
	println('- Worker ID: ${snowflake.worker_id()}')
	println('- Process ID: ${snowflake.process_id()}')
	println('- Sequence number: ${snowflake.sequence_number()}')
}
