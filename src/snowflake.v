module bonfire

import time

const discord_epoch_milliseconds = u64(1420070400000)

// Snowflake is a Discord snowflake ID. It holds the time the
// object was created, the ID of the worker that created it,
// the ID of the process that created it, and a sequence number.
pub type Snowflake = u64

// created_at returns the Time the Snowflake was created at.
pub fn (s Snowflake) created_at() Time {
	seconds, milliseconds := separate_seconds_and_milliseconds(u64(s >> 22) +
		.discord_epoch_milliseconds)
	return time.unix2(seconds, milliseconds * 1000)
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

// new_snowflake returns a snowflake ID from the given unix timestamp (in seconds).
[inline]
fn new_snowflake(unix u64) Snowflake {
	return ((unix * 1000) - .discord_epoch_milliseconds) << 22
}

[inline]
fn separate_seconds_and_milliseconds(milliseconds u64) (i64, int) {
	return i64(milliseconds / 1000), int(milliseconds % 1000)
}
