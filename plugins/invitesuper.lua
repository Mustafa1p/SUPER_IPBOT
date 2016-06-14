-- create by mustafa ip
-- supergroup work ;) (@HackeD_o)
do

  -- Think it's kind of useless. Just to suppress '*** lua: attempt to call a nil value'
  local function callback(extra, success, result)
    if success == 1 and extra ~= false then
      return extra.text
    else
      return send_large_msg(chat, "Can't invite user to this group.")
    end
  end

  local function resolve_username(extra, success, result)
    if success == 1 then
      channel_add_user(extra.chat, 'user#id'..result.id, callback, false)
      return extra.text
    else
      return send_large_msg(extra.chat, "Can't invite user to this group.")
    end
  end

  local function action_by_reply(extra, success, result)
    if success == 1 then
       channel_add_user('channel#id'..result.to.id, 'user#id'..result.from.id, callback, false)
    else
      return send_large_msg('channel#id'..result.to.id, "Can't invite user to this group.")
    end
  end

  local function run(msg, matches)
    local receiver = get_receiver(msg)
    local text = "Add: "..matches[1].." to "..receiver
    if is_chat_msg(msg) then
      if msg.reply_id and msg.text == "invite" then
        msgr = get_message(msg.reply_id, action_by_reply, {msg=msg})
      end
      if string.match(matches[1], '^%d+$') then
        channel_add_user(receiver, 'user#id'..matches[1], callback, {channel=receiver, text=text})
      elseif string.match(matches[1], '^@.+$') then
        msgr = res_user(string.gsub(matches[1], '@', ''), resolve_username, {channel=receiver, text=text})
      else
        channel_add_user(receiver, string.gsub(matches[1], ' ', '_'), callback, {channel=receiver, text=text})
      end
    else
      return ""
    end
  end

  return {
    description = 'Invite other user to the chat group.',
    usage = {
      -- Need space in front of this, so bot won't consider it as a command
      ' invite [id|user_name|name]'
    },
    patterns = {
      "^invite$",
      "^invite (.*)$",
      "^invite (%d+)$"
    },
    run = run,
    moderated = true
  }

end
