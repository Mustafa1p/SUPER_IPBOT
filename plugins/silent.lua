--[[    CODE BY
        ▄ ▀▄   ▄▀ ▄    ▄▄▄████▄▄▄   
        █▄█▀███▀█▄█   ███▀▀██▀▀███  
        ▀█████████▀   ▀▀▀██▀▀██▀▀▀   
         ▄▀     ▀▄    ▄▄▀▀ ▀▀ ▀▀▄▄   
         MUSTAFA IP &     MICO
        (@HackeD_o)  /  (@Malvoo)
 --]]

do
local function pre_process(msg)
if not is_admin(msg)  then
if msg then
    local hash = 'mustafaip:'..msg.to.id

    if redis:get(hash) and msg.text then
    delete_msg(msg.id, ok_cb, true)
 
    end
end
end
    return msg
    end


local function run(msg, matches)
    chat_id =  msg.to.id
    if is_momod(msg) and matches[1] == 'silent' then
    local hash = 'mustafaip:'..msg.to.id
    redis:set(hash, true)
    return "#Group has been set silent don't talk🔕"
    elseif is_momod(msg) and matches[1] == 'nsilent' then
    local hash = 'mustafaip:'..msg.to.id
    redis:del(hash)
    return '#Group has been unsilent 🔔'
    end
    end


return {
    patterns = {
        '^/(silent)$',
        '^/(nsilent)$'
    },
    run = run,
    pre_process = pre_process
}
end
