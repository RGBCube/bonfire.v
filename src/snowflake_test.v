module bonfire

fn test_snowflake() {
	expected := [
		[512640455834337290, 1542293409, 0, 0, 10]!
		[254608322391572481, 1480773754, 1, 0, 1]!
		[170939974227591168, 1460825665, 0, 0, 0]!
		[107490111414882304, 1445698039, 0, 5, 0]!
		[616951104282034177, 1567163005, 2, 0, 1]!
		[582718866786877440, 1559001404, 0, 0, 0]!
		[150203841827045376, 1455881786, 0, 0, 0]!
		[111761808640978944, 1446716491, 0, 3, 0]!
		[705836698080247911, 1588354982, 1, 0, 103]!
		[735856983231561740, 1595512376, 1, 0, 12]!
	]!

	for e in expected {
		snowflake := Snowflake(e[0])

		assert snowflake.created_at().unix == e[1]
		assert snowflake.worker_id() == e[2]
		assert snowflake.process_id() == e[3]
		assert snowflake.sequence_number() == e[4]
	}
}
