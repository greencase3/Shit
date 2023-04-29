util.require_natives(1663599433)
util.toast("hello "..players.get_name(players.user()))

local hophop = function (hop)
  local me_or_she = hop.me_or_she
  local on = hop.on
  local off = hop.off 
  
  local pos = ENTITY.GET_ENTITY_COORDS(me_or_she)
     if not ENTITY.IS_ENTITY_IN_AIR(me_or_she) then
    menu.trigger_commands(on)
    FIRE.ADD_EXPLOSION(pos.x, pos.y, pos.z - 1.0,Hop_Type,5.0, false, true, 0.3, true)
   else 
      menu.trigger_commands(off)     
    end
  end
  
  Hop_Type = 0 
  menu.slider(menu.my_root(),"Hop Type",{"Hophophop"},"",0,84,13,1,function(value)
    Hop_Type=value
  end)

menu.toggle_loop(menu.my_root(),"Hop-Self",{},"",function()
hophop({me_or_she = players.user_ped(), on = "demigodmode on", off = "demigodmode off"})
end)

local ips=menu.list(menu.my_root(),"IP History")
menu.action(ips,"search ",{"swww "},"",function(click_type)
  menu.show_command_box_click_based(click_type,"swww ")end)
local function playerActionsSetup(she)
  
menu.toggle_loop(menu.player_root(she),"Hop",{},"",function()
local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(she)
hophop({me_or_she = ped ,on= "autoheal " .. players.get_name(she).." on",off="autoheal "..players.get_name(she).." off"})
end)

--copy ips
local ip = players.get_connect_ip(she)
local name = players.get_name(she)
local vpn=players.is_using_vpn(she)
local get_ips= string.format("%i.%i.%i.%i", ip >> 24 & 255, ip >> 16 & 255, ip >> 8 & 255, ip & 255)

local error255=""

if get_ips == "255.255.255.255" then

error255="Error"
else 
error255 = ""
end
name = menu.action(ips, name.."[VPN="..vpn.."]"..error255,{name}, get_ips,function()

  util.copy_to_clipboard(get_ips)
end)


end players.on_join(playerActionsSetup)players.dispatch_on_join()
util.keep_running()
