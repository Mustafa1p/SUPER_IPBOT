—         ▀▄   ▄▀       
—        ▄█▀███▀█▄      
—       █▀███████▀█     
—       ▀ ▀▄▄ ▄▄▀ ▀     
—       BY Mustafa ip
—THIS FILE Develoepr by Mustafa ip (@HackeD_o)

do
local function get_bot(extra, success, result)
  vardump(result)
    local name = extra.name
    local receiver = extra.receiver
    local text = "The bot added from\n "..name.." : \nTHE BOT IS :\n"
    local i = 1
    for k,user in ipairs(result) do
       local id = user.peer_id
       local botname = user.print_name
       local username = (user.username or 'None')
    if string.sub(username:lower(), -3) == "bot" then
            local username = "@"..user.username
            text = text ..i.." •"..username.."\n"
            i = i + 1
        end
    end
    send_large_msg(receiver, text)
end
local function run(msg, matches)
  if matches[1] == "gbots" and is_momod(msg) then
    local receiver = get_receiver(msg)
    local name = string.gsub(msg.to.print_name, '_', ' ')
    channel_get_users("channel#id"..msg.to.id, get_bot, {receiver=receiver, name=name})
  end
  if msg.to.type == "channel" then
    channel_get_users("channel#id"..msg.to.id, returnid, {receiver=receiver})
  else
    chat_info(receiver, returnidch, {receiver=receiver})
    end
  end
return {
patterns = {
"^[/#!]([Gg][Bb][Oo][Tt][Ss])$"
},
run = run
}

end
