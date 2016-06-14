-- create by mustafa ip (@HackeD_o)
--supergroup work ;)
-- suppress '*** lua: attempt to call a nil value' warning
local function callback(extra, success, result)
  vardump(success)
  vardump(result)
end

local function run(msg)
  if msg.service and msg.action.type == 'channel_add_user' then
    local data = load_data(_config.moderation.data)
    if not data[tostring(msg.to.id)] then
      print "This is not our group. Leaving..."
      channel_del_user('channel#id'..msg.to.id, 'user#id'..our_id, callback, false)
    end
  end
end

return {
  description = "Kicking ourself (bot) from unmanaged groups.",
  usage = "No switch available. Turn it on or off using !plugins command.",
  patterns = {
    "^!!tgservice (.+)$"
  },
  run = run
}
