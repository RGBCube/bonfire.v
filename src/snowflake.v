module bonfire

import time

const discord_epoch_ms = 1420070400000

// new_snowflake returns a snowflake ID from the given unix timestamp (in seconds).
fn new_snowflake(unix u64) Snowflake {
	return ((unix*1000 - discord_epoch_ms)) << 22
}

// Snowflake is a Discord snowflake ID. It holds the time the
// object was created, the ID of the worker that created it,
// the ID of the process that created it, and a sequence number.
pub type Snowflake = u64

// created_at returns the Time the Snowflake was created at.
[inline]
pub fn (s Snowflake) created_at() Time {
	created_ms := i64((s >> 22) + discord_epoch_ms)
	microseconds := (created_ms % 1000) * 1000
	return time.unix2(created_ms / 1000, microseconds)
}

// worker_id returns the ID of the worker that created the Snowflake.
[inline]
pub fn (s Snowflake) worker_id() u8 {
	return u8((s & 0x3E0000) >> 17)
}

// process_id returns the ID of the process that created the Snowflake.
[inline]
pub fn (s Snowflake) process_id() u8 {
	return u8((s & 0x1F000) >> 12)
}

// sequence_number returns the sequence number of the Snowflake (For every Snowflake that
// is generated in the process, the sequence number is incremented by 1).
[inline]
pub fn (s Snowflake) sequence_number() u16 {
	return u16(s & 0xFFF)
}
