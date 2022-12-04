module bonfire

fn test_time_format() {
	time := Snowflake(512640455834337290).created_at()
	assert time.format(.short_time) == '<t:1542293409:t>'
	assert time.format(.long_time) == '<t:1542293409:T>'
	assert time.format(.short_date) == '<t:1542293409:d>'
	assert time.format(.long_date) == '<t:1542293409:D>'
	assert time.format(.short_date_time) == '<t:1542293409:f>'
	assert time.format(.long_date_time) == '<t:1542293409:F>'
	assert time.format(.relative) == '<t:1542293409:R>'
}

fn test_snowflake() {
	snowflake_0 := Snowflake(512640455834337290)
	assert snowflake_0.created_at().unix == 1542293409
	assert snowflake_0.worker_id() == 0
	assert snowflake_0.process_id() == 0
	assert snowflake_0.sequence_number() == 10

	snowflake_1 := Snowflake(254608322391572481)
	assert snowflake_1.created_at().unix == 1480773754
	assert snowflake_1.worker_id() == 1
	assert snowflake_1.process_id() == 0
	assert snowflake_1.sequence_number() == 1

	snowflake_2 := Snowflake(170939974227591168)
	assert snowflake_2.created_at().unix == 1460825665
	assert snowflake_2.worker_id() == 0
	assert snowflake_2.process_id() == 0
	assert snowflake_2.sequence_number() == 0

	snowflake_3 := Snowflake(107490111414882304)
	assert snowflake_3.created_at().unix == 1445698039
	assert snowflake_3.worker_id() == 0
	assert snowflake_3.process_id() == 5
	assert snowflake_3.sequence_number() == 0

	snowflake_4 := Snowflake(616951104282034177)
	assert snowflake_4.created_at().unix == 1567163005
	assert snowflake_4.worker_id() == 2
	assert snowflake_4.process_id() == 0
	assert snowflake_4.sequence_number() == 1

	snowflake_5 := Snowflake(582718866786877440)
	assert snowflake_5.created_at().unix == 1559001404
	assert snowflake_5.worker_id() == 0
	assert snowflake_5.process_id() == 0
	assert snowflake_5.sequence_number() == 0

	snowflake_6 := Snowflake(150203841827045376)
	assert snowflake_6.created_at().unix == 1455881786
	assert snowflake_6.worker_id() == 0
	assert snowflake_6.process_id() == 0
	assert snowflake_6.sequence_number() == 0

	snowflake_7 := Snowflake(111761808640978944)
	assert snowflake_7.created_at().unix == 1446716491
	assert snowflake_7.worker_id() == 0
	assert snowflake_7.process_id() == 3
	assert snowflake_7.sequence_number() == 0

	snowflake_8 := Snowflake(705836698080247911)
	assert snowflake_8.created_at().unix == 1588354982
	assert snowflake_8.worker_id() == 1
	assert snowflake_8.process_id() == 0
	assert snowflake_8.sequence_number() == 103

	snowflake_9 := Snowflake(735856983231561740)
	assert snowflake_9.created_at().unix == 1595512376
	assert snowflake_9.worker_id() == 1
	assert snowflake_9.process_id() == 0
	assert snowflake_9.sequence_number() == 12

	snowflake_10 := Snowflake(785793169542479893)
	assert snowflake_10.created_at().unix == 1607418090
	assert snowflake_10.worker_id() == 1
	assert snowflake_10.process_id() == 0
	assert snowflake_10.sequence_number() == 21
}
