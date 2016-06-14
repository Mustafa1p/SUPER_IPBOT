--         ▀▄   ▄▀       
--        ▄█▀███▀█▄      
--       █▀███████▀█     
--       ▀ ▀▄▄ ▄▄▀ ▀     
--      BY MUSTAFA IP
--BY MUSTAFA IP (HackeD_o)
--JUST WRITED BY MUSTAFA IP
--SUPERGROUP ONLY
do
  
--local NUM_MSG_MAX = 4 ---FOR ANTI SPAM
--local TIME_CHECK = 4 ---FOR ANTI SPAM
-- Check Member
local function check_member_autorealm(cb_extra, success, result)
  local receiver = cb_extra.receiver
  local data = cb_extra.data
  local msg = cb_extra.msg
  for k,v in pairs(result.members) do
    local member_id = v.id
    if member_id ~= our_id then
      -- Group configuration
      data[tostring(msg.to.id)] = {
        group_type = 'Realm',
        settings = {
          set_name = string.gsub(msg.to.print_name, '_', ' '),
          lock_name = 'yes',
          lock_photo = 'no',
          lock_member = 'no',
          aimage = 'no',
          lockfile = 'no',
          public = 'no',
          lock_rtl = 'no',
          flood = 'yes',
		      lock_link = 'yes',
		      sticker = 'ok',
		      version = '3.5',
		      groupmodel = 'normal',
		      num = 'no',
		      lock_chat = 'no',
		      lock_username = 'no',
		      lock_arabic = 'no',
		      welcome = 'group'
        }
      }
      save_data(_config.moderation.data, data)
      local realms = 'realms'
      if not data[tostring(realms)] then
        data[tostring(realms)] = {}
        save_data(_config.moderation.data, data)
      end
      data[tostring(realms)][tostring(msg.to.id)] = msg.to.id
      save_data(_config.moderation.data, data)
      return send_large_msg(receiver, 'Welcome to your new realm !')
    end
  end
end
local function check_member_realm_add(cb_extra, success, result)
  local receiver = cb_extra.receiver
  local data = cb_extra.data
  local msg = cb_extra.msg
  for k,v in pairs(result.members) do
    local member_id = v.id
    if member_id ~= our_id then
      -- Group configuration
      data[tostring(msg.to.id)] = {
        group_type = 'Realm',
        settings = {
          set_name = string.gsub(msg.to.print_name, '_', ' '),
          lock_name = 'yes',
          lock_photo = 'no',
          lock_member = 'no',
          aimage = 'no',
          lockfile = 'no',
          public = 'no',
          lock_rtl = 'no',
          flood = 'yes',
		      lock_link = 'yes',
		      sticker = 'ok',
		      version = '3.5',
		      groupmodel = 'normal',
		      num = 'no',
		      lock_chat = 'no',
		      lock_username = 'no',
		      lock_arabic = 'no',
		      welcome = 'group'
        }
      }
      save_data(_config.moderation.data, data)
      local realms = 'realms'
      if not data[tostring(realms)] then
        data[tostring(realms)] = {}
        save_data(_config.moderation.data, data)
      end
      data[tostring(realms)][tostring(msg.to.id)] = msg.to.id
      save_data(_config.moderation.data, data)
      return send_large_msg(receiver, 'Realm has been added!')
    end
  end
end
function check_member_group(cb_extra, success, result)
  local receiver = cb_extra.receiver
  local data = cb_extra.data
  local msg = cb_extra.msg
  for k,v in pairs(result.members) do
    local member_id = v.id
    if member_id ~= our_id then
      -- Group configuration
      data[tostring(msg.to.id)] = {
        group_type = 'Group',
        moderators = {},
        set_owner = member_id ,
        settings = {
          set_name = string.gsub(msg.to.print_name, '_', ' '),
          lock_name = 'yes',
          lock_photo = 'no',
          lock_member = 'no',
          aimage = 'no',
          lockfile = 'no',
          public = 'no',
          lock_rtl = 'no',
          flood = 'yes',
		      lock_link = 'yes',
		      sticker = 'ok',
		      version = '3.5',
		      groupmodel = 'normal',
		      num = 'no',
		      lock_chat = 'no',
		      lock_username = 'no',
		      lock_arabic = 'no',
		      welcome = 'group'
        }
      }
      save_data(_config.moderation.data, data)
      local groups = 'groups'
      if not data[tostring(groups)] then
        data[tostring(groups)] = {}
        save_data(_config.moderation.data, data)
      end
      data[tostring(groups)][tostring(msg.to.id)] = msg.to.id
      save_data(_config.moderation.data, data)
      return send_large_msg(receiver, 'You have been promoted as the leader.')
    end
  end
end
local function check_member_modadd(cb_extra, success, result)
  local receiver = cb_extra.receiver
  local data = cb_extra.data
  local msg = cb_extra.msg
  for k,v in pairs(result.members) do
    local member_id = v.id
    if member_id ~= our_id then
      -- Group configuration
      data[tostring(msg.to.id)] = {
        group_type = 'Group',
        moderators = {},
        set_owner = member_id ,
        settings = {
          set_name = string.gsub(msg.to.print_name, '_', ' '),
          lock_name = 'yes',
          lock_photo = 'no',
          lock_member = 'no',
          lockfile = 'no',
          aimage = 'no',
          public = 'no',
          lock_rtl = 'no',
          flood = 'yes',
		      lock_link = 'yes',
		      sticker = 'ok',
		      version = '3.5',
		      groupmodel = 'normal',
		      num = 'no',
		      lock_chat = 'no',
		      lock_username = 'no',
		      lock_arabic = 'no',
		      welcome = 'group'
        }
      }
      save_data(_config.moderation.data, data)
      local groups = 'groups'
      if not data[tostring(groups)] then
        data[tostring(groups)] = {}
        save_data(_config.moderation.data, data)
      end
      data[tostring(groups)][tostring(msg.to.id)] = msg.to.id
      save_data(_config.moderation.data, data)
      return send_large_msg(receiver, 'bot has been add to group  ')
    end
  end
end
local function automodadd(msg)
  local data = load_data(_config.moderation.data)
  if msg.action.type == 'chat_created' then
    receiver = get_receiver(msg)
    chat_info(receiver, check_member_group,{receiver=receiver, data=data, msg = msg})
  end
  ---FOR SUPERGROUP
  if msg.action.type == 'channel_created' then
    receiver = get_receiver(msg)
    channel_info(receiver, check_member_group,{receiver=receiver, data=data, msg = msg})
  end
end
local function autorealmadd(msg)
  local data = load_data(_config.moderation.data)
  if msg.action.type == 'chat_created' then
    receiver = get_receiver(msg)
    chat_info(receiver, check_member_autorealm,{receiver=receiver, data=data, msg = msg})
  end
  --FOR SUPERGROUP 
  if msg.action.type == 'channel_created' then
    receiver = get_receiver(msg)
    channel_info(receiver, check_member_autorealm,{receiver=receiver, data=data, msg = msg})
  end
end
local function check_member_realmrem(cb_extra, success, result)
  local receiver = cb_extra.receiver
  local data = cb_extra.data
  local msg = cb_extra.msg
  for k,v in pairs(result.members) do
    local member_id = v.id
    if member_id ~= our_id then
      -- Realm configuration removal
      data[tostring(msg.to.id)] = nil
      save_data(_config.moderation.data, data)
      local realms = 'realms'
      if not data[tostring(realms)] then
        data[tostring(realms)] = nil
        save_data(_config.moderation.data, data)
      end
      data[tostring(realms)][tostring(msg.to.id)] = nil
      save_data(_config.moderation.data, data)
      return send_large_msg(receiver, 'Realm has been removed!')
    end
  end
end
local function check_member_modrem(cb_extra, success, result)
  local receiver = cb_extra.receiver
  local data = cb_extra.data
  local msg = cb_extra.msg
  for k,v in pairs(result.members) do
    local member_id = v.id
    if member_id ~= our_id then
      -- Group configuration removal
      data[tostring(msg.to.id)] = nil
      save_data(_config.moderation.data, data)
      local groups = 'groups'
      if not data[tostring(groups)] then
        data[tostring(groups)] = nil
        save_data(_config.moderation.data, data)
      end
      data[tostring(groups)][tostring(msg.to.id)] = nil
      save_data(_config.moderation.data, data)
      return send_large_msg(receiver, 'Group has been removed')
    end
  end
end
--End Check Member

--RTL 
local function lock_group_rtl(msg, data, target)
  if not is_momod(msg) then
    return
  end
  local group_rtl_lock = data[tostring(target)]['settings']['lock_rtl']
  if group_rtl_lock == 'yes' then
    return 'RTL is already locked'
  else
    data[tostring(target)]['settings']['lock_rtl'] = 'yes'
    save_data(_config.moderation.data, data)
    return 'RTL has been locked'
  end
end

local function unlock_group_rtl(msg, data, target)
  if not is_momod(msg) then
    return
  end
  local group_rtl_lock = data[tostring(target)]['settings']['lock_rtl']
  if group_rtl_lock == 'no' then
    return 'RTL is already unlocked'
  else
    data[tostring(target)]['settings']['lock_rtl'] = 'no'
    save_data(_config.moderation.data, data)
    return 'RTL has been unlocked'
  end
end

--- CONECTES
local function lock_group_contacts(msg, data, target)
  if not is_momod(msg) then
    return
  end
  local group_rtl_lock = data[tostring(target)]['settings']['lock_contacts']
  if group_contacts_lock == 'yes' then
    return 'call name  post is already locked'
  else
    data[tostring(target)]['settings']['lock_contacts'] = 'yes'
    save_data(_config.moderation.data, data)
    return 'call name  post has been locked'
  end
end

local function unlock_group_contacts(msg, data, target)
  if not is_momod(msg) then
    return
  end
  local group_contacts_lock = data[tostring(target)]['settings']['lock_contacts']
  if group_contacts_lock == 'no' then
    return 'call name  post is already unlocked'
  else
    data[tostring(target)]['settings']['lock_contacts'] = 'no'
    save_data(_config.moderation.data, data)
    return 'call name  post has been unlocked'
  end
end

local function show_group_settingsmod(msg, data, target)
 	if not is_momod(msg) then
    	return "For moderators only!"
  	end
  	local data = load_data(_config.moderation.data)
    if data[tostring(msg.to.id)] then
     	if data[tostring(msg.to.id)]['settings']['flood_msg_max'] then
        	NUM_MSG_MAX = tonumber(data[tostring(msg.to.id)]['settings']['flood_msg_max'])
        	print('custom'..NUM_MSG_MAX)
      	else 
        	NUM_MSG_MAX = 4
      	end
    end
    local bots_protection = "مفعل"
    if data[tostring(msg.to.id)]['settings']['lock_bots'] then
    	bots_protection = data[tostring(msg.to.id)]['settings']['lock_bots']
   	end
    local leave_ban = "غير مفعل"
    if data[tostring(msg.to.id)]['settings']['leave_ban'] then
    	leave_ban = data[tostring(msg.to.id)]['settings']['leave_ban']
   	end
    local lock_link = "مفعل"
    if data[tostring(msg.to.id)]['settings']['lock_link'] then
    	lock_link = data[tostring(msg.to.id)]['settings']['lock_link']
   	end
    local version = "3.5"
    if data[tostring(msg.to.id)]['settings']['version'] then
    	version = data[tostring(msg.to.id)]['settings']['version']
   	end
    local groupmodel = "normal"
    if data[tostring(msg.to.id)]['settings']['groupmodel'] then
    	groupmodel = data[tostring(msg.to.id)]['settings']['groupmodel']
   	end
    local sticker = "معطل"
    if data[tostring(msg.to.id)]['settings']['sticker'] then
    	sticker = data[tostring(msg.to.id)]['settings']['sticker']
   	end
    local tag = "غير مفعل"
    if data[tostring(msg.to.id)]['settings']['num'] then
    	tag = data[tostring(msg.to.id)]['settings']['num']
   	end
    local lock_chat = "غير مفعل"
    if data[tostring(msg.to.id)]['settings']['lock_chat'] then
    	lock_chat = data[tostring(msg.to.id)]['settings']['lock_chat']
   	end
    local lock_username = "غير مفعل"
    if data[tostring(msg.to.id)]['settings']['lock_username'] then
    	lock_username = data[tostring(msg.to.id)]['settings']['lock_username']
   	end
   	local lock_aimage = "غير مفعل"
    if data[tostring(msg.to.id)]['settings']['aimage'] then
    	lock_aimage = data[tostring(msg.to.id)]['settings']['aimage']
   	end
   	local lock_lockfile = "غير مفعل"
    if data[tostring(msg.to.id)]['settings']['lockfile'] then
    	lock_lockfile = data[tostring(msg.to.id)]['settings']['lockfile']
   	end
    local lock_arabic = "غير مفعل"
    if data[tostring(msg.to.id)]['settings']['lock_arabic'] then
    	lock_arabic = data[tostring(msg.to.id)]['settings']['lock_arabic']
   	end
    local welcome = "group"
    if data[tostring(msg.to.id)]['settings']['welcome'] then
    	welcome = data[tostring(msg.to.id)]['settings']['welcome']
   	end
  local settings = data[tostring(target)]['settings']
  local text = "عدادات الوسائط 🗃 :\nمنع الاعلانات :"..lock_link..'\nقفل محتوى المجموعة :'..lock_chat..'\nمنع اللغة العربية :'..lock_arabic..'\nحماية الملصقات :'..sticker..'\nقفل الاشاره :'..lock_username.."\n "
  return text

end

local function set_descriptionmod(msg, data, target, about)
  if not is_momod(msg) then
    return "للمدراء فقط"
  end
  local data_cat = 'description'
  data[tostring(target)][data_cat] = about
  save_data(_config.moderation.data, data)
  return 'Set group description to:\n'..about
end
local function get_description(msg, data)
  local data_cat = 'description'
  if not data[tostring(msg.to.id)][data_cat] then
    return 'No description available.'
  end
  local about = data[tostring(msg.to.id)][data_cat]
  local about = string.gsub(msg.to.print_name, "_", " ")..':\n\n'..about
  return 'About '..about
end
local function lock_group_arabic(msg, data, target)
  if not is_momod(msg) then
    return "للمدراء فقط"
  end
  local group_arabic_lock = data[tostring(target)]['settings']['lock_arabic']
  if group_arabic_lock == 'مفعل' then
    return '📖 تم منع اللغة العربية في المجموعه'
  else
    data[tostring(target)]['settings']['lock_arabic'] = 'مفعل'
    save_data(_config.moderation.data, data)
    return '📖 تم منع اللغة العربية في المجموعه'
  end
end

local function unlock_group_arabic(msg, data, target)
  if not is_momod(msg) then
    return "للمدراء فقط"
  end
  local group_arabic_lock = data[tostring(target)]['settings']['lock_arabic']
  if group_arabic_lock == 'غير مفعل' then
    return '📖 تم السماح للغة العربية في المجموعه'
  else
    data[tostring(target)]['settings']['lock_arabic'] = 'غير مفعل'
    save_data(_config.moderation.data, data)
    return '📖 تم السماح للغة العربية في المجموعه'
  end
end

local function lock_group_tag(msg, data, target)
  if not is_momod(msg) then
   return "للمدراء فقط"
  end
  local group_tag_lock = data[tostring(target)]['settings']['num']
  if group_tag_lock == 'مفعل' then
    return "منع الرسائل المحتويه على نصوص كثيره مفعله سابقاً"
  else
    data[tostring(target)]['settings']['num'] = 'مفعل'
    save_data(_config.moderation.data, data)
    return 'تم منع الرسائل التي تححتوي نصوص كثير'
  end
end

local function unlock_group_tag(msg, data, target)
  if not is_momod(msg) then
    return "للمدراء فقط"
  end
  local group_tag_lock = data[tostring(target)]['settings']['num']
  if group_tag_lock == 'غير مفعل' then
    return 'تم السماح بلرسائل المحتوية على نصوص كثيره'
  else
    data[tostring(target)]['settings']['num'] = 'غير مفعل'
    save_data(_config.moderation.data, data)
    return 'تم السماح بلرسائل المحتوية على نصوص كثيره'
  end
end

-------SUPERGROUP ANTI PHOTO
local function lock_group_aimage(msg, data, target)
  if not is_momod(msg) then
     return "للمدراء فقط"
  end
  local group_aimage_lock = data[tostring(target)]['settings']['num']
  if group_aimage_lock == 'yes' then
    return 'image post is already locked'
  else
    data[tostring(target)]['settings']['aimage'] = 'yes'
    save_data(_config.moderation.data, data)
    return 'image post has been locked'
  end
end

local function unlock_group_aimage(msg, data, target)
  if not is_momod(msg) then
    return "للمدراء فقط"
  end
  local group_aimage_lock = data[tostring(target)]['settings']['aimage']
  if group_aimage_lock == 'no' then
    return 'image post is already unlocked'
  else
    data[tostring(target)]['settings']['num'] = 'no'
    save_data(_config.moderation.data, data)
    return 'image post has been unlocked'
  end
end
--END ANTI PHOTO
local function lock_group_username(msg, data, target)
  if not is_momod(msg) then
    return "للمشرفين فقط!"
  end
  local group_username_lock = data[tostring(target)]['settings']['lock_username']
  if group_username_lock == 'مفعل' then
    return 'منع عمل اشاره مفعل'
  else
    data[tostring(target)]['settings']['lock_username'] = 'مفعل'
    save_data(_config.moderation.data, data)
    return 'منع عمل اشاره مفعل'
  end
end

local function unlock_group_username(msg, data, target)
  if not is_momod(msg) then
    return "للمشرفين فقط"
  end
  local group_username_lock = data[tostring(target)]['settings']['lock_username']
  if group_username_lock == 'غير مفعل' then
    return "تم السماح بعمل اشارة"
  else
    data[tostring(target)]['settings']['lock_username'] = 'غير مفعل'
    save_data(_config.moderation.data, data)
    return "تم السماح بعمل اشارة"
  end
end

local function lock_group_chat(msg, data, target)
  if not is_momod(msg) then
    return "للمدراء فقط"
  end
  local group_chat_lock = data[tostring(target)]['settings']['lock_chat']
  if group_chat_lock == 'مفعل' then
    return '👥 تم قفل جميع محتويات المجموعة'
  else
    data[tostring(target)]['settings']['lock_chat'] = 'مفعل'
    save_data(_config.moderation.data, data)
    return '👥 تم قفل جميع محتويات المجموعة'
  end
end

local function unlock_group_chat(msg, data, target)
  if not is_momod(msg) then
    return "للمدراء فقط"
  end
  local group_chat_lock = data[tostring(target)]['settings']['lock_chat']
  if group_chat_lock == 'غير مفعل' then
    return '👥 تم فتح جميع محتويات المجموعة'
  else
    data[tostring(target)]['settings']['lock_chat'] = 'غير مفعل'
    save_data(_config.moderation.data, data)
    return '👥 تم فتح جميع محتويات المجموعة'
  end
end

local function lock_group_link(msg, data, target)
  if not is_momod(msg) then
    return "للمدراء فقط"
  end
  local group_link_lock = data[tostring(target)]['settings']['lock_link']
  if group_link_lock == 'yes' then
    return "📵 منع الإعلانات مفعل"
  else
    data[tostring(target)]['settings']['lock_link'] = 'yes'
    save_data(_config.moderation.data, data)
    return "📵 منع الإعلانات مفعل"
  end
end

local function unlock_group_link(msg, data, target)
  if not is_momod(msg) then
    return "للمدراء فقط!"
  end
  local group_link_lock = data[tostring(target)]['settings']['lock_link']
  if group_link_lock == 'no' then
    return "💢 السماح بالإعلانات مفعل "
  else
    data[tostring(target)]['settings']['lock_link'] = 'no'
    save_data(_config.moderation.data, data)
    return " 💢 السماح بالإعلانات مفعل"
  end
end

local function lock_group_bots(msg, data, target)
  if not is_momod(msg) then
   return "للمدراء فقط"
  end
  local group_bots_lock = data[tostring(target)]['settings']['lock_bots']
  if group_bots_lock == 'yes' then
    return 'Bots protection is already enabled'
  else
    data[tostring(target)]['settings']['lock_bots'] = 'yes'
    save_data(_config.moderation.data, data)
    return 'Bots protection has been enabled'
  end
end

local function unlock_group_bots(msg, data, target)
  if not is_momod(msg) then
    return "للمدراء فقط"
  end
  local group_bots_lock = data[tostring(target)]['settings']['lock_bots']
  if group_bots_lock == 'no' then
    return 'Bots protection is already disabled'
  else
    data[tostring(target)]['settings']['lock_bots'] = 'no'
    save_data(_config.moderation.data, data)
    return 'Bots protection has been disabled'
  end
end

local function lock_group_namemod(msg, data, target)
  if not is_momod(msg) then
   return "للمدراء فقط"
  end
  local group_name_set = data[tostring(target)]['settings']['set_name']
  local group_name_lock = data[tostring(target)]['settings']['lock_name']
  if group_name_lock == 'yes' then
    return 'Group name is already locked'
  else
    data[tostring(target)]['settings']['lock_name'] = 'yes'
    save_data(_config.moderation.data, data)
    rename_channel('channel#id'..target, group_name_set, ok_cb, false)
    return 'Group name has been locked'
  end
end
local function unlock_group_namemod(msg, data, target)
  if not is_momod(msg) then
    return "للمدراء فقط"
  end
  local group_name_set = data[tostring(target)]['settings']['set_name']
  local group_name_lock = data[tostring(target)]['settings']['lock_name']
  if group_name_lock == 'no' then
    return 'Group name is already unlocked'
  else
    data[tostring(target)]['settings']['lock_name'] = 'no'
    save_data(_config.moderation.data, data)
    return 'Group name has been unlocked'
  end
end
local function lock_group_floodmod(msg, data, target)
  if not  is_momod(msg) then
    return "للمدراء فقط"
  end
  local group_flood_lock = data[tostring(target)]['settings']['flood']
  if group_flood_lock == 'yes' then
    return  "🔂 تم قفل التكرار في المجموعة "
  else
    data[tostring(target)]['settings']['flood'] = 'yes'
    save_data(_config.moderation.data, data)
    return " 🔂 تم قفل التكرار في المجموعة "
  end
end

local function unlock_group_floodmod(msg, data, target)
  if not is_momod(msg) then
    return "للمدراء فقط"
  end
  local group_flood_lock = data[tostring(target)]['settings']['flood']
  if group_flood_lock == 'no' then
    return " 🔂 تم لسماح بالتكرار داخل المجموعة "
  else
    data[tostring(target)]['settings']['flood'] = 'no'
    save_data(_config.moderation.data, data)
    return " 🔂 تم لسماح بالتكرار داخل المجموعة "
  end
end

local function lock_group_membermod(msg, data, target)
  if not is_momod(msg) then
    return "للمدراء فقط"
  end
  local group_member_lock = data[tostring(target)]['settings']['lock_member']
  if group_member_lock == 'yes' then
    return 'Group members are already locked'
  else
    data[tostring(target)]['settings']['lock_member'] = 'yes'
    save_data(_config.moderation.data, data)
  end
  return 'Group members has been locked'
end

local function unlock_group_membermod(msg, data, target)
  if not is_momod(msg) then
  return "للمدراء فقط"
  end
  local group_member_lock = data[tostring(target)]['settings']['lock_member']
  if group_member_lock == 'no' then
    return 'Group members are not locked'
  else
    data[tostring(target)]['settings']['lock_member'] = 'no'
    save_data(_config.moderation.data, data)
    return 'Group members has been unlocked'
  end
end


local function set_public_membermod(msg, data, target)
  if not is_momod(msg) then
    return "للمشرفين فقط "
  end
  local group_member_lock = data[tostring(target)]['settings']['public']
  if group_member_lock == 'yes' then
    return 'المجموعة الان : عامة⏺'
  else
    data[tostring(target)]['settings']['public'] = 'yes'
    save_data(_config.moderation.data, data)
  end
  return 'المجموعة الان : عامة⏺'
end

local function unset_public_membermod(msg, data, target)
  if not is_momod(msg) then
    return "للمشرفين فقط"
  end
  local group_member_lock = data[tostring(target)]['settings']['public']
  if group_member_lock == 'no' then
    return 'المجموعة الان : غير عامة ⏺ '
  else
    data[tostring(target)]['settings']['public'] = 'no'
    save_data(_config.moderation.data, data)
    return 'المجموعة الان : غير عامة ⏺ '
  end
end

local function lock_group_leave(msg, data, target)
  if not is_momod(msg) then
   return "للمدراء فقط"
  end
  local leave_ban = data[tostring(msg.to.id)]['settings']['leave_ban']
  if leave_ban == 'yes' then
    return 'Leaving users will be banned'
  else
    data[tostring(msg.to.id)]['settings']['leave_ban'] = 'yes'
    save_data(_config.moderation.data, data)
  end
  return 'Leaving users will be banned'
end

local function unlock_group_leave(msg, data, target)
  if not is_momod(msg) then
    return "للمدراء فقط"
  end
  local leave_ban = data[tostring(msg.to.id)]['settings']['leave_ban']
  if leave_ban == 'no' then
    return 'Leaving users will not be banned'
  else
    data[tostring(msg.to.id)]['settings']['leave_ban'] = 'no'
    save_data(_config.moderation.data, data)
    return 'Leaving users will not be banned'
  end
end

local function unlock_group_photomod(msg, data, target)
  if not is_momod(msg) then
    return "للمدراء فقط"
  end
  local group_photo_lock = data[tostring(target)]['settings']['lock_photo']
  if group_photo_lock == 'no' then
    return 'Group photo is not locked'
  else
    data[tostring(target)]['settings']['lock_photo'] = 'no'
    save_data(_config.moderation.data, data)
    return 'Group photo has been unlocked'
  end
end

local function set_rulesmod(msg, data, target)
  if not is_momod(msg) then
   return "للمدراء فقط"
  end
  local data_cat = 'rules'
  data[tostring(target)][data_cat] = rules
  save_data(_config.moderation.data, data)
  return "تم وضع قوانين  للمجموعة💡\nلاظهار القوانين اكتب /rules"
end
local function modadd(msg)
  -- superuser and admins only (because sudo are always has privilege)
  if not is_admin(msg) then
    return "You're not admin"
  end
  local data = load_data(_config.moderation.data)
  if is_group(msg) then
    return 'Group is already added.'
  end
    receiver = get_receiver(msg)
    chat_info(receiver, check_member_modadd,{receiver=receiver, data=data, msg = msg})
end
local function realmadd(msg)
  -- superuser and admins only (because sudo are always has privilege)
  if not is_admin(msg) then
    return "You're not admin"
  end
  local data = load_data(_config.moderation.data)
  if is_realm(msg) then
    return 'Realm is already added.'
  end
    receiver = get_receiver(msg)
    channel_info(receiver, check_member_realm_add,{receiver=receiver, data=data, msg = msg}) 
end
-- Global functions
function modrem(msg)
  -- superuser and admins only (because sudo are always has privilege)
  if not is_admin(msg) then
    return "You're not admin"
  end
  local data = load_data(_config.moderation.data)
  if not is_group(msg) then
    return 'Group is not added.'
  end
    receiver = get_receiver(msg)
    channel_info(receiver, check_member_modrem,{receiver=receiver, data=data, msg = msg})
end

function realmrem(msg)
  -- superuser and admins only (because sudo are always has privilege)
  if not is_admin(msg) then
    return "You're not admin"
  end
  local data = load_data(_config.moderation.data)
  if not is_realm(msg) then
    return 'Realm is not added.'
  end
    receiver = get_receiver(msg)
    channel_info(receiver, check_member_realmrem,{receiver=receiver, data=data, msg = msg})
end
local function get_rules(msg, data)
  local data_cat = 'rules'
  if not data[tostring(msg.to.id)][data_cat] then
    return "مرحبا\nلاتوجد قوانين متوفرة حالياً\n💡لوضع قوانين فقط اكتب/arules"
  end
  local rules = data[tostring(msg.to.id)][data_cat]
  local rules = '\n'..rules
  return rules
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
    send_large_msg(receiver, ' ', ok_cb, false)
  else
    print('Error downloading: '..msg.id)
    send_large_msg(receiver, 'Failed, please try again!', ok_cb, false)
  end
end

local function promote_by_reply(extra, success, result)
    local msg = result
    local full_name = (msg.from.first_name or '')..' '..(msg.from.last_name or '')
    if msg.from.username then
      member_username = '@'.. msg.from.username
    else
      member_username = full_name
    end
    local member_id = msg.from.id
    if msg.to.type == 'channel' then
      return promote(get_receiver(msg), member_username, member_id)
    end  
end

local function demote(receiver, member_username, member_id)
  local data = load_data(_config.moderation.data)
  local group = string.gsub(receiver, 'channel#id', '')
  if not data[group] then
    return send_large_msg(receiver, 'Group is not added.')
  end
  if not data[group]['moderators'][tostring(member_id)] then
    return send_large_msg(receiver, member_username..' is not a moderator.')
  end
  data[group]['moderators'][tostring(member_id)] = nil
  save_data(_config.moderation.data, data)
  return send_large_msg(receiver, member_username..' has been demoted.')
end

local function demote_by_reply(extra, success, result)
    local msg = result
    local full_name = (msg.from.first_name or '')..' '..(msg.from.last_name or '')
    if msg.from.username then
      member_username = '@'..msg.from.username
    else
      member_username = full_name
    end
    local member_id = msg.from.id
    if msg.to.type == 'channel' then
      return demote(get_receiver(msg), member_username, member_id)
    end  
end

local function setleader_by_reply(extra, success, result)
  local msg = result
  local receiver = get_receiver(msg)
  local data = load_data(_config.moderation.data)
  local name_log = msg.from.print_name:gsub("_", " ")
  data[tostring(msg.to.id)]['set_owner'] = tostring(msg.from.id)
      save_data(_config.moderation.data, data)
      savelog(msg.to.id, name_log.." ["..msg.from.id.."] setted ["..msg.from.id.."] as leader")
      local text = msg.from.print_name:gsub("_", " ").." is the leader now"
      return send_large_msg(receiver, text)
end

local function promote_demote_res(extra, success, result)
--vardump(result)
--vardump(extra)
--supergroup by Mutafa ip (@HackeD_o)
      local member_id = result.id
      local member_username = "@"..result.username
      local chat_id = extra.channel_id
      local mod_cmd = extra.mod_cmd
      local receiver = "channel#id"..channel_id
      if mod_cmd == 'promote' then
        return promote(receiver, member_username, member_id)
      elseif mod_cmd == 'demote' then
        return demote(receiver, member_username, member_id)
      end
end

local function modlist(msg)
  local data = load_data(_config.moderation.data)
  local groups = "groups"
  if not data[tostring(groups)][tostring(msg.to.id)] then
    return 'Group is not added.'
  end
  -- determine if table is empty
  if next(data[tostring(msg.to.id)]['moderators']) == nil then --fix way
    return 'No moderator in this group.'
  end
  local i = 1
  local message = '\nList of moderators for ' .. string.gsub(msg.to.print_name, '_', ' ') .. ':\n'
  for k,v in pairs(data[tostring(msg.to.id)]['moderators']) do
    message = message ..i..' - '..v..' [' ..k.. '] \n'
    i = i + 1
  end
  return message
end

local function callbackres(extra, success, result)
--vardump(result)
--supergroup by mustafa ip
  local user = result.id
  local name = string.gsub(result.print_name, "_", " ")
  local chat = 'channel#id'..extra.channelid
  send_large_msg(channel, user..'\n'..name)
  return user
end


local function cleanmember(cb_extra, success, result)
  local receiver = cb_extra.receiver
  local chat_id = "channel#id"..result.id
  local channelname = result.print_name
  for k,v in pairs(result.members) do
    kick_user(v.id, result.id)     
  end
end

local function killchat(cb_extra, success, result)
  local receiver = cb_extra.receiver
  local chat_id = "channel#id"..result.id
  local channelname = result.print_name
  for k,v in pairs(result.members) do
    kick_user_any(v.id, result.id)     
  end
end

--SuperGroup + Mustafa ip 
local function killrealm(cb_extra, success, result)
  local receiver = cb_extra.receiver
  local chat_id = "channel#id"..result.id
  local channelname = result.print_name
  for k,v in pairs(result.members) do
    kick_user_any(v.id, result.id)     
  end
end

local function killrealm(cb_extra, success, result)
  local receiver = cb_extra.receiver
  local chat_id = "chat#id"..result.id
  local channelname = result.print_name
  for k,v in pairs(result.members) do
    kick_user_any(v.id, result.id)     
  end
end

local function user_msgs(user_id, chat_id)
  local user_info
  local uhash = 'user:'..user_id
  local user = redis:hgetall(uhash)
  local um_hash = 'msgs:'..user_id..':'..chat_id
  user_info = tonumber(redis:get(um_hash) or 0)
  return user_info
end

local function kick_zero(cb_extra, success, result)
    local chat_id = cb_extra.chat_id
    local chat = "channel#id"..chat_id
    local ci_user
    local re_user
    for k,v in pairs(result.members) do
        local si = false
        ci_user = v.id
        local hash = 'chat:'..channel_id..':users'
        local users = redis:smembers(hash)
        for i = 1, #users do
            re_user = users[i]
            if tonumber(ci_user) == tonumber(re_user) then
                si = true
            end
        end
        if not si then
            if ci_user ~= our_id then
                if not is_momod2(ci_user, chat_id) then
                  channel_kick_user(channel, 'user#id'..ci_user, ok_cb, true)
                end
            end
        end
    end
end

local function kick_inactive(chat_id, num, receiver)
    local hash = 'chat:'..channel_id..':users'
    local users = redis:smembers(hash)
    -- Get user info
    for i = 1, #users do
        local user_id = users[i]
        local user_info = user_msgs(user_id, chat_id)
        local nmsg = user_info
        if tonumber(nmsg) < tonumber(num) then
            if not is_momod2(user_id, chat_id) then
              channel_kick_user('channel#id'..chat_id, 'user#id'..user_id, ok_cb, true)
            end
        end
    end
    return chat_info(receiver, kick_zero, {chat_id = chat_id})
end

local function run(msg, matches)
  local data = load_data(_config.moderation.data)
  local receiver = get_receiver(msg)
   local name_log = user_print_name(msg.from)
  local group = msg.to.id
  if msg.media then
    if msg.media.type == 'photo' and data[tostring(msg.to.id)]['settings']['set_photo'] == 'waiting' and is_channel_msg(msg) and is_momod(msg) then  -- MustafaIP MOD
      load_photo(msg.id, set_group_photo, msg)
    end
  end
  if matches[1] == 'set' and not matches[2] then
    if is_realm(msg) then
       return 'Error: Already a control.'
    end
    print("group "..msg.to.print_name.."("..msg.to.id..") added")
    return modadd(msg)
  end
   if matches[1] == 'set' and matches[2] == 'control' then
    if is_group(msg) then
       return 'Error: Already a group.'
    end
    print("group "..msg.to.print_name.."("..msg.to.id..") added as a control")
    return realmadd(msg)
  end
  if matches[1] == 'rem' and not matches[2] then
    print("group "..msg.to.print_name.."("..msg.to.id..") removed")
    return modrem(msg)
  end
  if matches[1] == 'rem' and matches[2] == 'realm' then
    print("group "..msg.to.print_name.."("..msg.to.id..") removed as a realm")
    return realmrem(msg)
  end
  if matches[1] == 'chat_created' or matches[1] == 'channel_created' and msg.from.id == 0 and group_type == "group" then
    return automodadd(msg)
  end
  if matches[1] == 'chat_created' or matches[1] == 'channel_created' and msg.from.id == 0 and group_type == "realm" then
    return autorealmadd(msg)
  end

  if msg.to.id and data[tostring(msg.to.id)] then
    local settings = data[tostring(msg.to.id)]['settings']
    if matches[1] == 'chat_add_user' or matches[1] == 'channel_add_user' then
      if not msg.service then
        return "Are you trying to troll me?"
      end
      local group_member_lock = settings.lock_member
      local user = 'user#id'..msg.action.user.id
      local chat = 'channel#id'..msg.to.id
      if group_member_lock == 'yes' and not is_owner2(msg.action.user.id, msg.to.id) then
        channel_kick_user(chat, user, ok_cb, true)
      elseif group_member_lock == 'yes' and tonumber(msg.from.id) == tonumber(our_id) then
        return nil
      elseif group_member_lock == 'no' then
        return nil
      end
    end
    if matches[1] == 'chat_del_user' or matches[1] == 'channel_kick_user' then
      if not msg.service then
         -- return "Are you trying to troll me?"
      end
      local user = 'user#id'..msg.action.user.id
      local chat = 'channel#id'..msg.to.id
      savelog(msg.to.id, name_log.." ["..msg.from.id.."] deleted user  "..user)
    end
    if matches[1] == 'chat_delete_photo' or matches[1] == 'channel_delete_photo' then
      if not msg.service then
        return "Are you trying to troll me?"
      end
      local group_photo_lock = settings.lock_photo
      if group_photo_lock == 'yes' then
        local picturehash = 'picture:changed:'..msg.to.id..':'..msg.from.id
        redis:incr(picturehash)
        ---
        local picturehash = 'picture:changed:'..msg.to.id..':'..msg.from.id
        local picprotectionredis = redis:get(picturehash) 
        if picprotectionredis then 
          if tonumber(picprotectionredis) == 4 and not is_owner(msg) then 
            kick_user(msg.from.id, msg.to.id)
          end
          if tonumber(picprotectionredis) ==  8 and not is_owner(msg) then 
            ban_user(msg.from.id, msg.to.id)
            local picturehash = 'picture:changed:'..msg.to.id..':'..msg.from.id
            redis:set(picturehash, 0)
          end
        end
        
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] tried to deleted picture but failed  ")
        channel_set_photo(receiver, settings.set_photo, ok_cb, false)
      elseif group_photo_lock == 'no' then
        return nil
      end
    end
    if matches[1] == 'chat_change_photo' or matches[1] == 'channel_change_photo' and msg.from.id ~= 0 then
      if not msg.service then
        return "Are you trying to troll me?"
      end
      local group_photo_lock = settings.lock_photo
      if group_photo_lock == 'yes' then
        local picturehash = 'picture:changed:'..msg.to.id..':'..msg.from.id
        redis:incr(picturehash)
        ---
        local picturehash = 'picture:changed:'..msg.to.id..':'..msg.from.id
        local picprotectionredis = redis:get(picturehash) 
        if picprotectionredis then 
          if tonumber(picprotectionredis) == 4 and not is_owner(msg) then 
            kick_user(msg.from.id, msg.to.id)
          end
          if tonumber(picprotectionredis) ==  8 and not is_owner(msg) then 
            ban_user(msg.from.id, msg.to.id)
          local picturehash = 'picture:changed:'..msg.to.id..':'..msg.from.id
          redis:set(picturehash, 0)
          end
        end
        
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] tried to change picture but failed  ")
        channel_set_photo(receiver, settings.set_photo, ok_cb, false)
      elseif group_photo_lock == 'no' then
        return nil
      end
    end
    if matches[1] == 'chat_rename' or matches[1] == 'channel_rename' then
      if not msg.service then
        return "Are you trying to troll me?"
      end
      local group_name_set = settings.set_name
      local group_name_lock = settings.lock_name
      local to_rename = 'channel#id'..msg.to.id
       local to_rename = 'chat#id'..msg.to.id
      if group_name_lock == 'yes' then
        if group_name_set ~= tostring(msg.to.print_name) then
          local namehash = 'name:changed:'..msg.to.id..':'..msg.from.id
          redis:incr(namehash)
          local namehash = 'name:changed:'..msg.to.id..':'..msg.from.id
          local nameprotectionredis = redis:get(namehash) 
          if nameprotectionredis then 
            if tonumber(nameprotectionredis) == 4 and not is_owner(msg) then 
              kick_user(msg.from.id, msg.to.id)
            end
            if tonumber(nameprotectionredis) ==  8 and not is_owner(msg) then 
              ban_user(msg.from.id, msg.to.id)
              local namehash = 'name:changed:'..msg.to.id..':'..msg.from.id
              redis:set(namehash, 0)
            end
          end
          
          savelog(msg.to.id, name_log.." ["..msg.from.id.."] tried to change name but failed  ")
          rename_channel(to_rename, group_name_set, ok_cb, false)
        end
      elseif group_name_lock == 'no' then
        return nil
      end
    end
    if matches[1] == 'setn' and is_momod(msg) then
      local new_name = string.gsub(matches[2], '_', ' ')
      data[tostring(msg.to.id)]['settings']['set_name'] = new_name
      save_data(_config.moderation.data, data)
      local group_name_set = data[tostring(msg.to.id)]['settings']['set_name']
      local to_rename = 'channel#id'..msg.to.id
      rename_channel(to_rename, group_name_set, ok_cb, false)
    
      savelog(msg.to.id, "Group { "..msg.to.print_name.." }  name changed to [ "..new_name.." ] by "..name_log.." ["..msg.from.id.."]")
    end
    if matches[1] == 'setp' and is_momod(msg) then
      data[tostring(msg.to.id)]['settings']['set_photo'] = 'waiting'
      save_data(_config.moderation.data, data)
      return 'ok. send photo now to set in group'
    end
    if matches[1] == 'promote' and not matches[2] then
      if not is_owner(msg) then
        return "Only the leader can prmote new moderators"
      end
      if type(msg.reply_id)~="nil" then
          msgr = get_message(msg.reply_id, promote_by_reply, false)
      end
    end
    if matches[1] == 'promote' and matches[2] then
      if not is_momod(msg) then
        return
      end
      if not is_owner(msg) then
        return "Only leader can promote"
      end
	local member = matches[2]
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] promoted @".. member)
	local cbres_extra = {
	channel_id = msg.to.id,
        mod_cmd = 'promote', 
	from_id = msg.from.id
	}
	local username = matches[2]
	local username = string.gsub(matches[2], '@', '')
	return res_user(username, promote_demote_res, cbres_extra)
    end
    if matches[1] == 'demote' and not matches[2] then
      if not is_owner(msg) then
        return "Only the leader can demote moderators"
      end
      if type(msg.reply_id)~="nil" then
          msgr = get_message(msg.reply_id, demote_by_reply, false)
      end
    end
    if matches[1] == 'demote' and matches[2] then
      if not is_momod(msg) then
        return
      end
      if not is_owner(msg) then
        return "Only leader can demote"
      end
      if string.gsub(matches[2], "@", "") == msg.from.username and not is_owner(msg) then
        return "You can't demote yourself"
      end
	local member = matches[2]
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] demoted @".. member)
	local cbres_extra = {
	channel_id = msg.to.id,
        mod_cmd = 'demote', 
	from_id = msg.from.id
	}
	local username = matches[2]
	local username = string.gsub(matches[2], '@', '')
	return res_user(username, promote_demote_res, cbres_extra)
    end
    if matches[1] == 'about' then
      savelog(msg.to.id, name_log.." ["..msg.from.id.."]About Group ")
      return get_description(msg, data)
    end
    if matches[1] == 'rules' then
      savelog(msg.to.id, name_log.." ["..msg.from.id.."] قوانين لمجموعة ⚠️")
      return get_rules(msg, data)
    end
      if matches[1] == 'arules' then
        rules = matches[2]
        local target = msg.to.id
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] تم وضع قوانين ⚠️ ["..matches[2].."]")
        return set_rulesmod(msg, data, target)
      end
      if matches[1] == 'sabout' then
        local data = load_data(_config.moderation.data)
        local target = msg.to.id
        local about = matches[2]
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] Done! set about supergroup ["..matches[2].."]")
        return channel_set_about(receiver, about_text, ok_cb, false)
      end

    if matches[1] == 'k' or  matches[1] == 'منع' then -- or matches[1] == 'Ù‚ÙÙ„' then  -- matches need + or
      local target = msg.to.id
      if matches[2] == 'nem' then -- matches[2] == "Ø§Ù„Ø§Ø³Ù…" then
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] locked name ")
        return lock_group_namemod(msg, data, target)
      end
      if matches[2] == 'mem' then --matches[2] == "Ø§Ù„Ø§Ø¹Ø¶Ø§Ø¡" then
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] locked member ")
        return lock_group_membermod(msg, data, target)
        end
      if matches[2] == 'spm' or matches[2] == 'التكرار' then --matches[2] == "Ø§Ù„ØªÙƒØ±Ø§Ø±" then
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] locked flood ")
        return lock_group_floodmod(msg, data, target)
      end
      if matches[2] == 'arb' or  matches[2] == 'العربية' then --matches[2] == "Ø§Ù„Ø¹Ø±Ø¨ÙŠسØ©" then
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] locked arabic ")
        return lock_group_arabic(msg, data, target)
      end
      if matches[2] == 'bots' then --matches[2] == "Ø§Ù„Ø¨ÙˆØªØ§Øª" then
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] locked bots ")
        return lock_group_bots(msg, data, target)
      end
      if matches[2]:lower() == 'rtl' then
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] locked RTL chars. in names")
				return lock_group_rtl(msg, data, target)
			end
			if matches[2] == 'nme' then
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] locked contact send")
				return lock_group_contacts(msg, data, target)
			end
      if matches[2] == 'ads' or matches[2] == 'الاعلانات'then  --matches[2] == "Ø§Ù„Ø±Ø§Ø¨Ø·" then
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] locked ads ")
        return lock_group_link(msg, data, target)
      end
      if matches[2] == 'msg' then --matches[2] == "Ø§Ù„Ø§Ø±Ù‚Ø§Ù… " then
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] locked msgs ")
        return lock_group_tag(msg, data, target)
      end
      if matches[2] == 'group' or matches[2] == 'الدردشة' then --matches[2] == "Ø§Ù„Ø´Ø§Øª" then
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] locked chat ")
        return lock_group_chat(msg, data, target)
      end
      if matches[2] == 'user' or matches[2] == "تاك" then
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] locked usernameðŸ”’ ")
        return lock_group_username(msg, data, target)
      end
    if matches[2] == 'leave' then --matches[2] == "Ø®Ø±ÙˆØ¬ then
      savelog(msg.to.id, name_log.." ["..msg.from.id.."] locked leaving ")
     return lock_group_leave(msg, data, target)
     end
   end
    if matches[1] == 'n' or matches[1] == 'السماح' then 
      local target = msg.to.id
      if matches[2] == 'nem' then
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] unlocked name ")
        return unlock_group_namemod(msg, data, target)
      end
      if matches[2] == 'mem' then
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] unlocked member ")
        return unlock_group_membermod(msg, data, target)
      end
      if matches[2] == 'spm' or matches[2] == 'التكرار' then
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] unlocked flood ")
        return unlock_group_floodmod(msg, data, target)
      end
      if matches[2] == 'arb' or  matches[2] == 'العربية' then
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] unlocked arabic ")
        return unlock_group_arabic(msg, data, target)
      end
      if matches[2] == 'bots' then
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] unlocked bots ")
        return unlock_group_bots(msg, data, target)
      end
      if matches[2]:lower() == 'rtl' then
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] locked rtl chars. in names")
				return unlock_group_rtl(msg, data, target)
			end
			if matches[2] == 'nme' then
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] unlocked contact send")
				return unlock_group_contacts(msg, data, target)
			end
      if matches[2] == 'ads' or matches[2] == 'الاعلانات' then
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] unlocked ads ")
        return unlock_group_link(msg, data, target)
      end
      if matches[2] == 'msg' then
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] unlocked msg ")
        return unlock_group_tag(msg, data, target)
      end
      if matches[2] == 'group' or matches[2] == 'الدردشة' then
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] unlocked chatðŸ”“ ")
        return unlock_group_chat(msg, data, target)
      end
      if matches[2] == 'user' or matches[2] == "تاك" then
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] unlocked username ")
        return unlock_group_username(msg, data, target)
      end
    if matches[2] == 'leave' then
       savelog(msg.to.id, name_log.." ["..msg.from.id.."] unlocked leaving ")
       return unlock_group_leave(msg, data, target)
     end
   end
    if matches[1] == 'setversion' then
	  if not is_sudo(msg) then
       return "For sudoers only"
      end
      if matches[2] == '1.0' then
        if version ~= '1.0' then
          data[tostring(msg.to.id)]['settings']['version'] = '1.0'
          save_data(_config.moderation.data, data)
        end
        return 'group version has been changed to 1.0'
      end
      if matches[2] == '2.0' then
        if version ~= '2.0' then
          data[tostring(msg.to.id)]['settings']['version'] = '2.0'
          save_data(_config.moderation.data, data)
        end
        return 'group version has been changed to 2.0'
      end
      if matches[2] == '3.5' then
        if version == '3.5' then
          return 'group version has been changed to 3.5'
        else
          data[tostring(msg.to.id)]['settings']['version'] = '3.5'
          save_data(_config.moderation.data, data)
          return 'group version has been changed to 3.5'
        end
      end
    end
    if matches[1] == 'setgroup' then
	  if not is_sudo(msg) then
       return "للمطور فقط!"
      end
      if matches[2] == 'realm' then
        if groupmodel ~= 'realm' then
          data[tostring(msg.to.id)]['settings']['groupmodel'] = 'realm'
          save_data(_config.moderation.data, data)
        end
        return 'Group model has been changed to realm'
      end
      if matches[2] == 'support' then
        if groupmodel ~= 'support' then
          data[tostring(msg.to.id)]['settings']['groupmodel'] = 'support'
          save_data(_config.moderation.data, data)
        end
        return 'تم تحويل المجموعة الى مجموعة دعم'
      end
      if matches[2] == 'feedback' then
        if groupmodel ~= 'feedback' then
          data[tostring(msg.to.id)]['settings']['groupmodel'] = 'feedback'
          save_data(_config.moderation.data, data)
        end
        return 'Group model has been changed to feedback'
      end
      if matches[2] == 'vip' then
        if groupmodel ~= 'vip' then
          data[tostring(msg.to.id)]['settings']['groupmodel'] = 'vip'
          save_data(_config.moderation.data, data)
        end
        return 'تم ترقية هذه المجموعة الى مجموعة مدفوعة'
      end
      if matches[2] == 'normal' then
        if groupmodel == 'normal' then
          return 'Group model has been changed to normal'
        else
          data[tostring(msg.to.id)]['settings']['groupmodel'] = 'normal'
          save_data(_config.moderation.data, data)
          return 'Group model has been changed to normal'
        end
      end
  end
  if matches[1] == 'group' and is_momod(msg) then
			local target = msg.to.id
			if matches[2] == 'o' then
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] حالة المجموعة : اصبحت عامة ✅")
				return set_public_membermod(msg, data, target)
			end
			if matches[2] == 'c' then
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] حالة المجموعة : اصبحت غير عامة ⏺")
				return unset_public_membermod(msg, data, target)
			end
	end
	
    if matches[1] == 'groupset'  then
      local target = msg.to.id
      savelog(msg.to.id, name_log.." ["..msg.from.id.."] requested group settings ")
      return show_group_settingsmod(msg, data, target)
    end	

    
     
--         ▀▄   ▄▀       
--        ▄█▀███▀█▄      
--       █▀███████▀█     
--       ▀ ▀▄▄ ▄▄▀ ▀     
--      BY MUSTAFA IP
--BY MUSTAFA IP (HackeD_o)
--JUST WRITED BY MUSTAFA IP
--SUPERGROUP ONLY

     if matches[1] == "snbot" and is_sudo(msg) then--join by group link
     	set_profile_name(matches[2],ok_cb,false)
     end
    if matches[1] == 'linkcre' and not is_realm(msg) then
      if not is_momod(msg) then
        return nil --"For admins group  only!"
      end
      local function callback (extra , success, result)
        local receiver = 'channel#'..msg.to.id
--        local receiver = 'chat#'..msg.to.id
        if success == 0 then
           return send_large_msg(receiver, 'هذة المجموهة غير مصنعة من قبلي.')
        end
        send_large_msg(receiver, "Created a new link")
        data[tostring(msg.to.id)]['settings']['set_link'] = result
        save_data(_config.moderation.data, data)
      end
      local receiver = 'channel#'..msg.to.id
--      local receiver = 'chat#'..msg.to.id
      savelog(msg.to.id, name_log.." ["..msg.from.id.."] revoked group link ")
      return export_channel_link(receiver, callback, true)
    end
    if matches[1] == 'linkgiv' then
      if not is_momod(msg) then
        return nil --"For moderators only!"
      end
      local group_link = data[tostring(msg.to.id)]['settings']['set_link']
      if not group_link then 
        return "create /linkcre first"
      end
       savelog(msg.to.id, name_log.." ["..msg.from.id.."] requested group link ["..group_link.."]")
      return "Group link:\n"..group_link
    end
      if matches[1] == 'link' and matches[2] == 'pv' then
      if not is_momod(msg) then
        return "انت لست من المشرفين"
      end
      local group_link = data[tostring(msg.to.id)]['settings']['set_link']
      if not group_link then 
        return "Create a link using /linkcre first :"
      end
       savelog(msg.to.id, name_log.." ["..msg.from.id.."] requested group link ["..group_link.."]")
      send_large_msg('user#id'..msg.from.id, "Group link:\n"..group_link..'')
   return '📥 تم ارسال رابط لمجموعة على خاص ☑️'    
    end
    if matches[1] == 'setleader' and matches[2] then
      if not is_owner(msg) then
        return "For leader only!"
      end
      data[tostring(msg.to.id)]['set_owner'] = matches[2]
      save_data(_config.moderation.data, data)
      savelog(msg.to.id, name_log.." ["..msg.from.id.."] set ["..matches[2].."] as leader")
      local text = matches[2].." added as leader"
      return text
    end
    if matches[1] == 'setleader' and not matches[2] then
      if not is_owner(msg) then
        return "only for the leader!"
      end
      if type(msg.reply_id)~="nil" then
          msgr = get_message(msg.reply_id, setleader_by_reply, false)
      end
    end
    if matches[1] == 'leader' then
      local group_leader = data[tostring(msg.to.id)]['set_owner']
      if not group_leader then 
        return "no leader,ask admins in support groups to set leader for your group"
      end
      savelog(msg.to.id, name_log.." ["..msg.from.id.."] used /leader")
      return "Group leader is ["..group_leader..']'
    end
    if matches[1] == 'setgpleader' then
      local receiver = "channel#id"..matches[2]
      if not is_admin(msg) then
        return "For admins only!"
      end
      data[tostring(matches[2])]['set_owner'] = matches[3]
      save_data(_config.moderation.data, data)
      local text = matches[3].." added as leader"
      send_large_msg(receiver, text)
      return
    end
    if matches[1] == 'setspm' then 
      if not is_momod(msg) then
        return "For admins group only!"
      end
      if tonumber(matches[2]) < 2 or tonumber(matches[2]) > 30 then
        return "number Spam just> [2-30]"
      end
      local flood_max = matches[2]
      data[tostring(msg.to.id)]['settings']['flood_msg_max'] = flood_max
      save_data(_config.moderation.data, data)
      savelog(msg.to.id, name_log.." ["..msg.from.id.."] set spam to ["..matches[2].."]")
      return 'You are set spam to> '..matches[2]
    end
    if matches[1] == 'c' then
      if not is_owner(msg) then
        return nil
      end
      if matches[2] == 'mem' then
        if not is_owner(msg) then
          return "Only admins  can clean members"
        end
        local receiver = get_receiver(msg)
        chat_info(receiver, cleanmember, {receiver=receiver})
      end
      if matches[2] == 'adm' then
        if next(data[tostring(msg.to.id)]['moderators']) == nil then --fix way
          return 'No admins group here :/.'
        end
        local message = '\nList of moderators for ' .. string.gsub(msg.to.print_name, '_', ' ') .. ':\n'
        for k,v in pairs(data[tostring(msg.to.id)]['moderators']) do
          data[tostring(msg.to.id)]['moderators'][tostring(k)] = nil
          save_data(_config.moderation.data, data)
        end
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] cleaned modlist")
      end
      if matches[2] == 'rules' and matches[2] == "" then 
        local data_cat = 'rules'
        data[tostring(msg.to.id)][data_cat] = nil
        save_data(_config.moderation.data, data)
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] cleaned rules")
      end
      if matches[2] == 'about' then 
        local data_cat = 'description'
        data[tostring(msg.to.id)][data_cat] = nil
        save_data(_config.moderation.data, data)
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] cleaned about")
      end     
    end
    if matches[1] == 'kill' and matches[2] == 'chat' then
      if not is_admin(msg) then
          return nil
      end
      if not is_realm(msg) then
          local receiver = get_receiver(msg)
          return modrem(msg),
          print("Closing Group..."),
          chat_info(receiver, killchat, {receiver=receiver})
      else
          return 'This is a realm'
      end
   end
    if matches[1] == 'kill' and matches[2] == 'realm' then
     if not is_admin(msg) then
         return nil
     end
     if not is_group(msg) then
        local receiver = get_receiver(msg)
        return realmrem(msg),
        print("Closing Realm..."),
        chat_info(receiver, killrealm, {receiver=receiver})
     else
        return 'This is a group'
     end
   end
    if matches[1] == 'res' and is_momod(msg) then 
      local cbres_extra = {
        chatid = msg.to.id
      }
      local username = matches[2]
      local username = username:gsub("@","")
      savelog(msg.to.id, name_log.." ["..msg.from.id.."] Used /res "..username)
      return res_user(username,  callbackres, cbres_extra)
    end
    if matches[1] == 'kanop' then
      --send_large_msg('chat#id'..msg.to.id, 'I\'m in matches[1]')
	    if not is_momod(msg) then
	      return 'Only a admins group can kick inactive users'
	    end
	    local num = 1
	    if matches[2] then
	        num = matches[2]
	    end
	    local chat_id = msg.to.id
	    local channel_id = msg.to.id
	    local receiver = get_receiver(msg)
      return kick_inactive(chat_id, channel_id, num, receiver)
    end
  end 
end
return {
  patterns = {
  --WITHOUT / OR ! OR # JUST WRITE COMMANDS >>  
  --WARN THIS COMMANDS ONLY FOR SuperGroup : Mustafa ip MOD
  "^/[Aa]bout)$",
  "^/([sS]about) (.*)$",
  "^/(rules)$",
  "^/(arules) (.*)$",
  "^/(setn) (.*)$",
  "^/(setp)$",
  "^/(c)(.*)$",
  "^/(kill) (chat)$",
  "^/(k)(.+)$",
  "^/(n)(.+)$",
  "^/(promote)$",
  "^/(promote) (.+)$",
--  "^/(snbot) (.*)$",
  "^([Ss]etgpleader) (%d+) (%d+)$",-- (group id) (leader id)
  "^/(setspm) (%d+)$",
  "^/(groupset)$",
  "^/(group)(.*)$",
  "^/(kanop)$",
  "^/(kanop) (%d+)$",
  "^/([Ll][Ii][Nn][Kk]) ([pP][Vv])$",
  "^[!/](link)(pv)$",
  "^[!/](linkcre)$",
  "^[!/](منع) (.+)$",
  "^[!/](السماح) (.+)$",
  "^/([Ss]etgroup) (.*)$",
  "%[(photo)%]",
  "^!!tgservice (.+)$",
  
  --"^(public) (.*)$",  "^/(kill) (realm)$",  "^/(getgroups)$",  "^/(promote) (.*)$",  "^/(promote)",  "^/(demote) (.*)$",  "^/(demote)",  "^/(set) ([^%s]+) (.*)$",  "^/(setleader) (%d+)$",  "^/(setleader)",   "^/(leader)$", "^/(setversion) (.*)$", --HAS BEEN REMOVED!  
 
  },
  run = run
}
end
--END MERBOT SUPER NEW!
--CODE Merbot-mod BY MUSTAFA IP (HackeD_o) JUST
--         ▀▄   ▄▀       
--        ▄█▀███▀█▄      
--       █▀███████▀█     
--       ▀ ▀▄▄ ▄▄▀ ▀     
--      BY MUSTAFA IP
--BY MUSTAFA IP (HackeD_o)
--JUST WRITED BY MUSTAFA IP
--SUPERGROUP ONLY
