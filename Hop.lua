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
  
  Hop_Type = 13 
  menu.slider(menu.my_root(),"Hop Type",{"Hophophop"},"",0,84,13,1,function(value)
    Hop_Type=value
  end)

menu.toggle_loop(menu.my_root(),"Hop-Self",{},"",function()
hophop({me_or_she = players.user_ped(), on = "demigodmode on", off = "demigodmode off"})
end)
han = 8 
menu.toggle_loop(menu.my_root(),"test",{},"",function()
  local pos = ENTITY.GET_ENTITY_COORDS(players.user_ped())

  local X = pos.x 
  local Y = pos.y 
  local points = 100

  for i = 1, points do
    util.yield()
    local angle = (i / points) * 2 * math.pi 
    local x = X + han * math.cos(angle)
    local y = Y + han * math.sin(angle)

    FIRE.ADD_EXPLOSION(x, y, pos.z, 70, 1.0, true, false, 0, false) 
  end
end)

menu.slider(menu.my_root(),"value2",{"rara"},"",0,50,8,1,function(value2)
 han=value2
end)
  
function playerActionsSetup(she)
menu.toggle_loop(menu.player_root(she),"Hop",{},"",function()
local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(she)
hophop({me_or_she = ped ,on= "autoheal " .. players.get_name(she).." on",off="autoheal "..players.get_name(she).." off"})
end)




end players.on_join(playerActionsSetup)players.dispatch_on_join()
util.keep_running()
