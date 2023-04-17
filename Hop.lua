util.keep_running()require"natives-1627063482"
function playerActionsSetup(pid)
 
menu.toggle_loop(menu.player_root(pid),"Hop",{},"",function()
  if not ENTITY.IS_ENTITY_IN_AIR(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)) then
 local pos = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid))
  menu.trigger_commands("autoheal " .. players.get_name(pid).." on")
    FIRE.ADD_EXPLOSION(pos.x, pos.y, pos.z - 1.0, 13, 5.0, false, true, 0.3, true)
  else
    menu.trigger_commands("autoheal " .. players.get_name(pid).." off")  
  end
end)
end players.on_join(playerActionsSetup)players.dispatch_on_join()


menu.toggle_loop(menu.my_root(),"Hop-Self",{},"",function()
  if not ENTITY.IS_ENTITY_IN_AIR(players.user_ped()) then
 local pos = ENTITY.GET_ENTITY_COORDS(players.user_ped())
  menu.trigger_commands("demigodmode on")
  FIRE.ADD_EXPLOSION(pos.x, pos.y, pos.z - 1.0, 13, 5.0, false, true, 0.3, true)
  else 
    menu.trigger_commands("demigodmode off")     
  end
end)
