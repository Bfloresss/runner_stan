local json = require "json"

local M = {}

local BASE_URL = "http://localhost:7070"

local function request(method, path, data, callback)
	local url = BASE_URL .. path
	local headers = { ["Content-Type"] = "application/json" }
	local body = data and json.encode(data) or nil
	http.request(url, method, function(self, id, response)
		local ok = response.status >= 200 and response.status < 300
		local decoded = nil
		if response.response and #response.response > 0 then
			local success, payload = pcall(json.decode, response.response)
			if success then
				decoded = payload
			end
		end
		if callback then
			callback(ok, decoded)
		end
	end, headers, body)
end

function M.post_run(score, coins, callback)
	request("POST", "/api/runs", { score = score, coins = coins }, callback)
end

function M.fetch_runs(callback)
	request("GET", "/api/runs", nil, callback)
end

return M

