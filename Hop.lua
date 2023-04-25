util.require_natives(1663599433)
local Hop_Type = 0 
menu.slider(menu.my_root(),"Hop Type",{"Hophophop"},"",0,84,13,1,function(value)
  Hop_Type=value
end)



  
menu.toggle_loop(menu.my_root(),"Hop-Self",{},"",function()
hophop({me_or_she = players.user_ped(), on = "demigodmode on", off = "demigodmode off"})
end)

function playerActionsSetup(she)
   hophop = function (hop)
    local me_or_she = hop.me_or_she
    local on = hop.on
    local off = hop.off 
    
    local pos = ENTITY.GET_ENTITY_COORDS(me_or_she)
       if not ENTITY.IS_ENTITY_IN_AIR(me_or_she) then
      menu.trigger_commands(on)
      FIRE.ADD_EXPLOSION(pos.x, pos.y, pos.z - 1.0, Hop_Type, 5.0, false, true, 0.3, true)
     else 
        menu.trigger_commands(off)     
      end
    end


menu.toggle_loop(menu.player_root(she),"Hop",{},"",function()
  ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(she)
hophop({me_or_she = ped ,on= "autoheal " .. players.get_name(she).." on",off="autoheal "..players.get_name(she).." off"})
end)


end players.on_join(playerActionsSetup)players.dispatch_on_join()
util.keep_running()
