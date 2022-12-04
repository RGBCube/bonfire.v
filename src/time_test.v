module bonfire

import time

fn test_time_format() {
	time := Time(time.unix(512640455834337290))
	assert time.format(.short_time) == '<t:1542293409:t>'
	assert time.format(.long_time) == '<t:1542293409:T>'
	assert time.format(.short_date) == '<t:1542293409:d>'
	assert time.format(.long_date) == '<t:1542293409:D>'
	assert time.format(.short_date_time) == '<t:1542293409:f>'
	assert time.format(.long_date_time) == '<t:1542293409:F>'
	assert time.format(.relative) == '<t:1542293409:R>'
}
