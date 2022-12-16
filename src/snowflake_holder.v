module bonfire

// SnowflakeHolder is a small util class that holds a single snowflake.
// Useful because all Discord objects have a field named ID.
[noinit]
pub struct SnowflakeHolder {
	id Snowflake
}

// created_at returns the time the snowflake was created.
fn (sh SnowflakeHolder) created_at() Time {
	return sh.id.created_at()
}
