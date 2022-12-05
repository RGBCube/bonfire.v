module bonfire

import time

fn test_time_format() {
	time := Time(time.unix(1670178420))
	assert time.format(.short_time) == '<t:1670178420:t>'
	assert time.format(.long_time) == '<t:1670178420:T>'
	assert time.format(.short_date) == '<t:1670178420:d>'
	assert time.format(.long_date) == '<t:1670178420:D>'
	assert time.format(.short_date_time) == '<t:1670178420:f>'
	assert time.format(.long_date_time) == '<t:1670178420:F>'
	assert time.format(.relative) == '<t:1670178420:R>'
}
