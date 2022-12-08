module rest

import net.http

const ratelimit_timeout = 30

[heap]
struct RestClient {
	token   string
}

[params]
struct RequestParams {
	method string
	url    string
	data   string
}

fn (r RestClient) request(p RequestParams) !http.Response {
	return http.fetch(http.FetchConfig{
		url: 'https://discord.com/api/v10' + p.url
		method: p.method
		header: http.new_header_from_map({
			http.CommonHeader.authorization: 'Bot ${r.token}'
			http.CommonHeader.content_type:  'application/json'
			http.CommonHeader.user_agent:    'DiscordBot (https://github.com/RGBCube/bonfire.v, 0.0.1) V/${@VHASH}'
		})
		data: p.data
	})!
}
