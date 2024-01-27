meta = {
	name = "Force dark level",
	version = "0.1",
	description = "challenge mode for offline/online",
	author = "fienestar",
	online_safe = true,
}

local get_state = function()
	return state
end

need_alert = false
if get_local_state then
	get_state = get_local_state
else
	need_alert = true
end

set_callback(function()
	if need_alert then
		need_alert = false
		-- changing state.level_flags or force_dark_level not works after 1-1 online
		print("to force dark level online, you need to use playlunky nightly")
	end
end, ON.ONLINE_LOADING)

set_callback(function() 
    get_state().level_flags = set_flag(get_state().level_flags, 18)
end, ON.POST_ROOM_GENERATION)
