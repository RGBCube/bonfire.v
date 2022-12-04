module bonfire

import time

// Time is a time.Time that can be formatted as a Discord timestamp.
pub type Time = time.Time

// TimeFormat is an enum of all possible Discord timestamp formats.
pub enum TimeFormat as u8 {
	short_time = u8(`t`) // 21:27
	long_time = u8(`T`) // 21:27:42
	short_date = u8(`d`) // 4/12/2022
	long_date = u8(`D`) // 4 December 2022
	short_date_time = u8(`f`) // 4 December 2022 21:27
	long_date_time = u8(`F`) // Sunday, 4 December 2022 21:27
	relative = u8(`R`) // 2 days ago, Now, etc.
}

// format returns a Discord representation of the time in the given format.
[inline]
pub fn (t Time) format(format TimeFormat) string {
	return '<t:${t.unix}:${rune(format)}>'
}

// Snowflake is a Discord snowflake ID. It holds the time the
// object was created, the ID of the worker that created it,
// the ID of the process that created it, and a sequence number.
pub type Snowflake = u64

// created_at returns the time the Snowflake was created at.
[inline]
pub fn (s Snowflake) created_at() Time {
	return time.unix(i64(((s >> 22) + 1420070400000) / 1000))
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
