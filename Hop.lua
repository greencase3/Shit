util.keep_running()require"natives-1627063482"

menu.toggle_loop(menu.my_root(),"Hop-Self",{},"",function()
  if not ENTITY.IS_ENTITY_IN_AIR(players.user_ped()) then
     memory.write_int(memory.script_global(4521801)+935,NETWORK.GET_NETWORK_TIME())
   
 local pos = ENTITY.GET_ENTITY_COORDS(players.user_ped())
  menu.trigger_commands("demigodmode on")
  FIRE.ADD_EXPLOSION(pos.x, pos.y, pos.z - 1.0, 13, 5.0, false, true, 0.3, true)
  
  else 
    menu.trigger_commands("demigodmode off")     
  end
end)

function playerActionsSetup(she)

 ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(she)
menu.toggle_loop(menu.player_root(she),"Hop",{},"",function()
  if not ENTITY.IS_ENTITY_IN_AIR(ped) then
    memory.write_int(memory.script_global(4521801)+935,NETWORK.GET_NETWORK_TIME())
 local pos = ENTITY.GET_ENTITY_COORDS(ped)
  menu.trigger_commands("autoheal " .. players.get_name(she).." on")
    FIRE.ADD_EXPLOSION(pos.x, pos.y, pos.z - 1.0, 13, 5.0, false, true, 0.3, true)
  else
    menu.trigger_commands("autoheal " .. players.get_name(she).." off")  
  end
end)

menu.toggle_loop(menu.player_root(she),"height[her]",{},"",function()
  local pos = ENTITY.GET_ENTITY_COORDS(ped)

   pos.z = math.floor(math.abs(pos.z * 3.28084 / 3) + 0.5)
 if pos2.z ~= pos.z then
  util.yield(500)
util.toast("Z/ "..pos.z)
  end
  pos2 = pos
end)

end players.on_join(playerActionsSetup)players.dispatch_on_join()


pos2 = ENTITY.GET_ENTITY_COORDS(players.user_ped())

menu.toggle_loop(menu.my_root(),"height",{},"",function()

  local pos = ENTITY.GET_ENTITY_COORDS(players.user_ped())

   pos.z = math.floor(math.abs(pos.z * 3.28084 / 3) + 0.5)
 if pos2.z ~= pos.z then
  util.yield(500)
util.toast("Z/ "..pos.z)
  end
  pos2 = pos
end)  
