--         ▀▄   ▄▀       
--        ▄█▀███▀█▄      
--       █▀███████▀█     
--       ▀ ▀▄▄ ▄▄▀ ▀     
--     BY MUSTAFA IP
-- BY MUSTAFA IP (HackeD_o)
-- JUST UPDATE AND BUG FIXED BY MUSTAFA IP
-- DATE SAVED TO DATA/MODERATION.json
do

  local function export_channel_link_cb(extra, success, result)
    local msg = extra.msg
    local data = extra.data
    local receiver = get_receiver(msg)
    if success == 0 then
      return send_large_msg(receiver, 'Cannot generate invite link for this group.\nMake sure you are an admin or a sudoer.')
    end
    data[tostring(msg.to.id)]['link'] = result
    save_data(_config.moderation.data, data)
    return send_large_msg(receiver,'Newest generated invite link for '..msg.to.title..' is:\n'..result)
  end

  local function set_group_photo(msg, success, result)
    local data = load_data(_config.moderation.data)
    local receiver = get_receiver(msg)
    if success then
      local file = 'data/photos/channel_photo_'..msg.to.id..'.jpg'
      print('File downloaded to:', result)
      os.rename(result, file)
      print('File moved to:', file)
      channel_set_photo (receiver, file, ok_cb, false)
      data[tostring(msg.to.id)]['settings']['set_photo'] = file
      save_data(_config.moderation.data, data)
      data[tostring(msg.to.id)]['settings']['lock_photo'] = 'yes'
      save_data(_config.moderation.data, data)
      send_large_msg(receiver, 'Photo saved!', ok_cb, false)
    else
      print('Error downloading: '..msg.id)
      send_large_msg(receiver, 'Failed, please try again!', ok_cb, false)
    end
  end

  local function get_description(msg, data)
    local about = data[tostring(msg.to.id)]['description']
    if not about then
      return 'لا يوجد وصف متاح ℹ️'
	  end
    return string.gsub(msg.to.print_name, "_", " ")..':\n\n'..about
  end

  -- media handler. needed by group_photo_lock
  local function pre_process(msg)
    if not msg.text and msg.media then
      msg.text = '['..msg.media.type..']'
    end
    return msg
  end


  function run(msg, matches)
    if is_channel_msg(msg) then
      local data = load_data(_config.moderation.data)
      local receiver = get_receiver(msg)
      
      -- create a group :3 done supergroup
      if matches[1] == 'mkgroup' and matches[2] and is_admin(msg) then
        create_group_chat(msg.from.print_name, matches[2], ok_cb, false)
	      return 'Done! '..string.gsub(matches[2], '_', ' ')..' has been created.'
      -- add a group to be moderated
      elseif matches[1] == 'addgroup' and is_admin(msg) then
        if data[tostring(msg.to.id)] then
          return 'Group is already added.'
        end
        -- create data array in moderation.json
        data[tostring(msg.to.id)] = {
          moderators ={},
          settings = {
            set_name = string.gsub(msg.to.print_name, '_', ' '),
            lock_bots = 'no',
            lock_name = 'no',
            lock_photo = 'no',
            lock_member = 'no',
            anti_flood = 'no',
            welcome = 'no',
            sticker = 'ok'
            }
          }
        save_data(_config.moderation.data, data)
        return 'Group has been added.'
      -- remove group from moderation
      elseif matches[1] == 'remgroup' and is_admin(msg) then
        if not data[tostring(msg.to.id)] then
          return 'Group is not added.'
        end
        data[tostring(msg.to.id)] = nil
        save_data(_config.moderation.data, data)
        return 'Group has been removed'
      end

      if msg.media and is_channel_msg(msg) and is_admin(msg) then
        if msg.media.type == 'photo' and data[tostring(msg.to.id)] then
          if data[tostring(msg.to.id)]['settings']['set_photo'] == 'waiting' then
            load_photo(msg.id, set_group_photo, msg)
          end
        end
      end

--[[local function run(msg, matches,success)
local about = matches[2]
local chat = 'channel#id'..msg.to.id
         if msg.to.type == 'channel' and matches[1] == 'setabout' then
         local about = matches[2]
      --  data[tostring(msg.to.id)]['description'] = "Nothing"
	    --  save_data(_config.moderation.data, data)
         channel_set_about(chat, about, ok_cb, false)
         return 'Description has been set to\n\nSelect the chat again to see the changes'
     end
end --]]
      if data[tostring(msg.to.id)] then

        local settings = data[tostring(msg.to.id)]['settings']

        if matches[1] == 'setabout' and matches[2] and is_momod(msg) then
	        data[tostring(msg.to.id)]['description'] = matches[2]
	        save_data(_config.moderation.data, data)
	        return 'Set group description to:\n'..matches[2]
      elseif matches[1] == 'about' then
          return get_description(msg, data)
        elseif matches[1] == 'arules' and is_momod(msg) then
	        data[tostring(msg.to.id)]['rules'] = matches[2]
	        save_data(_config.moderation.data, data)
	        return 'قوانين المجموعة هيه 📝 :\n'..matches[2]
        elseif matches[1] == 'arules' then
          if not data[tostring(msg.to.id)]['rules'] then
            return '⚠ لا توجد قوانين '
	        end
          local rules = data[tostring(msg.to.id)]['rules']
          local rules = string.gsub(msg.to.print_name, '_', ' ')..' rules:\n\n'..rules
          return rules
        -- group link {get|set}
        elseif matches[1] == 'link' then
          if matches[2] == 'giv' then
            if data[tostring(msg.to.id)]['link'] then
              local about = get_description(msg, data)
              local link = data[tostring(msg.to.id)]['link']
              return about.."\n\n"..link
            else
              return 'قم بانشاء رابط اولاً من خلال /linkcre'
            end
          elseif matches[2] == 'cre' and is_momod(msg) then
            msgr = export_channel_link(receiver, export_channel_link_cb, {data=data, msg=msg})
          end
	      elseif matches[1] == 'group'or matches[1] == 'gp'then
          -- lock {bot|name|member|photo|sticker}
          if matches[2] == 'lock' then
            if matches[3] == 'bot' then
	            if settings.lock_bots == 'yes' then
                return 'Group is already locked from bots.'
	            else
                settings.lock_bots = 'yes'
                save_data(_config.moderation.data, data)
                return 'Group is locked from bots.'
	            end
            elseif matches[3] == 'name' and is_admin(msg) then
	            if settings.lock_name == 'yes' then
                return 'Group name is already locked'
	            else
                settings.lock_name = 'yes'
                save_data(_config.moderation.data, data)
                settings.set_name = string.gsub(msg.to.print_name, '_', ' ')
                save_data(_config.moderation.data, data)
	              return 'Group name has been locked'
	            end
            elseif matches[3] == 'member' and is_admin(msg) then
	            if settings.lock_member == 'yes' then
                return 'Group members are already locked'
	            else
                settings.lock_member = 'yes'
                save_data(_config.moderation.data, data)
	            end
	            return 'Group members has been locked'
            elseif matches[3] == 'photo' and is_admin(msg) then
	            if settings.lock_photo == 'yes' then
                return 'Group photo is already locked'
	            else
                settings.set_photo = 'waiting'
                save_data(_config.moderation.data, data)
	            end
              return 'Please send me the group photo now'
            end
          -- unlock {bot|name|member|photo|sticker}
		      elseif matches[2] == 'unlock' then
            if matches[3] == 'bot' and is_admin(msg) then
	            if settings.lock_bots == 'no' then
                return 'Bots are allowed to enter group.'
	            else
                settings.lock_bots = 'no'
                save_data(_config.moderation.data, data)
                return 'Group is open for bots.'
	            end
            elseif matches[3] == 'name' and is_admin(msg) then
	            if settings.lock_name == 'no' then
                return 'Group name is already unlocked'
	            else
                settings.lock_name = 'no'
                save_data(_config.moderation.data, data)
                return 'Group name has been unlocked'
	            end
            elseif matches[3] == 'member' and is_admin(msg) then
	            if settings.lock_member == 'no' then
                return 'Group members are not locked'
	            else
                settings.lock_member = 'no'
                save_data(_config.moderation.data, data)
                return 'Group members has been unlocked'
	            end
            elseif matches[3] == 'photo' and is_admin(msg) then
	            if settings.lock_photo == 'no' then
                return 'Group photo is not locked'
	            else
                settings.lock_photo = 'no'
                save_data(_config.moderation.data, data)
                return 'Group photo has been unlocked'
	            end
            end
          -- view group settings
          elseif matches[2] == 'settings' or matches[2] == 'set' and is_momod(msg) then
            if settings.lock_bots == 'yes' then
              lock_bots_state = '🔒'
            elseif settings.lock_bots == 'no' then
              lock_bots_state = '🔓'
            end
            if settings.lock_name == 'yes' then
              lock_name_state = '🔒'
            elseif settings.lock_name == 'no' then
              lock_name_state = '🔓'
            end
            if settings.lock_photo == 'yes' then
              lock_photo_state = '🔒'
            elseif settings.lock_photo == 'no' then
              lock_photo_state = '🔓'
            end
            if settings.lock_member == 'yes' then
              lock_member_state = '🔒'
            elseif settings.lock_member == 'no' then
              lock_member_state = '🔓'
            end
            if settings.anti_flood ~= 'no' then
              antiflood_state = '🔒'
            elseif settings.anti_flood == 'no' then
              antiflood_state = '🔓'
            end
            if settings.welcome ~= 'no' then
              greeting_state = '🔒'
            elseif settings.welcome == 'no' then
              greeting_state = '🔓'
            end
            if settings.sticker ~= 'ok' then
              sticker_state = '🔒'
            elseif settings.sticker == 'ok' then
              sticker_state = '🔓'
            end
            local text = 'Group settings:\n'
                  ..'\n'..lock_bots_state..' Lock group from bot : '..settings.lock_bots
                  ..'\n'..lock_name_state..' Lock group name : '..settings.lock_name
                  ..'\n'..lock_photo_state..' Lock group photo : '..settings.lock_photo
                  ..'\n'..lock_member_state..' Lock group member : '..settings.lock_member
                  ..'\n'..antiflood_state..' Flood protection : '..settings.anti_flood
                  ..'\n'..greeting_state..' Welcome message : '..settings.welcome
                  ..'\n'..sticker_state..' Sticker policy : '..settings.sticker
            return text
		      end
        elseif matches[1] == 'webp' then
          if matches[2] == 'w' then
            if settings.sticker ~= 'w' then
              settings.sticker = 'w'
              save_data(_config.moderation.data, data)
            end
            return '🚨 تم تفعيل خاصية : التحذير قبل الحذف.'
                  -- ..'Sender will be warned first, then removed for second violation.'
          elseif matches[2] == 'd' then
            if settings.sticker ~= 'd' then
              settings.sticker = 'd'
              save_data(_config.moderation.data, data)
            end
            return '🗑 تم تفعيل خاصية : الحذف مباشراً'
          elseif matches[2] == 'o' then
            if settings.sticker == 'o' then
              return '⏸ تم التعطيل '
            else
              settings.sticker = 'o'
              save_data(_config.moderation.data, data)
              return 'الحمماية ضد الملصقات : معطل ⏸'
            end
          end
        -- if group name is renamed
        elseif matches[1] == 'channel_rename' then
          if not msg.service then
            return 'Are you trying to troll me?'
          end
          if settings.lock_name == 'yes' then
            if settings.set_name ~= tostring(msg.to.print_name) then
              rename_channel(receiver, settings.set_name, ok_cb, false)
            end
          elseif settings.lock_name == 'no' then
            return nil
          end
		    -- set group name
		    elseif matches[1] == 'setname' and is_admin(msg) then
          settings.set_name = string.gsub(matches[2], '_', ' ')
          save_data(_config.moderation.data, data)
          rename_channel(receiver, settings.set_name, ok_cb, false)
		    -- set group photo
		    elseif matches[1] == 'setphoto' and is_momod(msg) then
          settings.set_photo = 'waiting'
          save_data(_config.moderation.data, data)
          return 'Please send me new group photo now'
        -- if a user is added to group
		    elseif matches[1] == 'channel_add_user' or matches[1] == 'chat_add_user' then --MustafaiP MOD
          if not msg.service then
            return 'Are you trying to troll me?'
          end
          local user = 'user#id'..msg.action.user.id
          if settings.lock_member == 'yes' then
            channel_kick_user(receiver, user, ok_cb, true)
          -- no APIs bot are allowed to enter chat group.
          elseif settings.lock_bots == 'yes' and msg.action.user.flags == 4352 then
            channel_kick_user(receiver, user, ok_cb, true)
          elseif settings.lock_bots == 'no' or settings.lock_member == 'no' then
            return nil
          end
           -- if sticker is sent
        elseif msg.media and msg.media.caption == 'sticker.webp' and not is_momod(msg) then
          local user_id = msg.from.id
          local channel_id = msg.to.id
          local sticker_hash = 'mer_sticker:'..channel_id..':'..user_id
          local is_sticker_offender = redis:get(sticker_hash)
          if settings.sticker == 'w' then
            if is_sticker_offender then
              delete_msg(msg.id, ok_cb, true)
              redis:del(sticker_hash)
              return 'تم تحذيرك لا ترسل الملصقات هنا!'
            elseif not is_sticker_offender then
              redis:set(sticker_hash, true)
              return ""
            end
          elseif settings.sticker == 'd' then
            delete_msg(msg.id, ok_cb, true)
            return " "
          elseif settings.sticker == 'o' then
            return nil
          end
		    -- if group photo is changed
		    elseif matches[1] == 'channel_change_photo' or matches[1] == 'chat_change_photo' and msg.from.id ~= 0 then --MustafaiP MOD
          if not msg.service then
            return 'Are you trying to troll me?'
          end
          if settings.lock_photo == 'yes' then
            channel_set_photo (receiver, settings.set_photo, ok_cb, false)
          elseif settings.lock_photo == 'no' then
            return nil
          end
        end
      end
    else
      print ''
    end
  end

  return {
    description = 'Plugin to manage group chat.',
    usage = {
      admin = {
        'mkgroup <group_name> : Make/create a new group.',
        'addgroup : Add group to moderation list.',
        'remgroup : Remove group from moderation list.'
      },
      moderator = {
        'group <lock|unlock> bot : {Dis}allow APIs bots.',
        'group <lock|unlock> member : Lock/unlock group member.',
        'group <lock|unlock> name : Lock/unlock group name.',
        'group <lock|unlock> photo : Lock/unlock group photo.',
        'group settings : Show group settings.',
        'link <set> : Generate/revoke invite link.',
        'setabout <description> : Set group description.',
        'setname <new_name> : Set group name.',
        'setphoto : Set group photo.',
        'setrules <rules> : Set group rules.',
        'webpw : Sticker restriction, sender will be warned for the first violation.',
        'webpd : Sticker restriction, sender will be kick.',
        'webpo : Disable sticker restriction.'
      },
      user = {
        'about : Read group description',
        'rules : Read group rules',
        'link <get> : Print invite link'
      },
    },
    patterns = {
      '^/(addgroup)$',
      '^/([Ww][Ee][Bb][Pp])(.*)$', --supergroup by removed!
      '^/(remgroup)$',
      '^/(gp)(set)$',
      '^/(link)(.*)$',
      '^/(mkgroup) (.*)$',
      '^/(setabout) (.*)$', 
      
'%[(video)%]',
'%[(audio)%]',
'%[(photo)%]',
'%[(document)%]',
'^!!tgservice (.+)$',
     },
     run = run,
     pre_process = pre_process
  }

end 
