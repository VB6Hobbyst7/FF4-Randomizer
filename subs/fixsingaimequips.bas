sub FixSingAimEquips()

 dim link as MetaItem ptr
 dim bow_equip_code as UByte
 dim harp_equip_code as UByte
 
 for i as Integer = 1 to itemlist.Length()
  link = itemlist.PointerAt(i)
  if link->kind = "Harp" then
   harp_equip_code = link->itemdata.equip_code
  elseif link->kind = "Bow" then
   bow_equip_code = link->itemdata.equip_code
  end if
 next

 for i as Integer = 0 to total_actors
  for j as Integer = 1 to 5
   if ff4.actors(i).menu_command(j) = sing_command then
    ff4.equipcharts(harp_equip_code).flags(ff4.JobOfActor(i)) = true
   elseif ff4.actors(i).menu_command(j) = aim_command then
    ff4.equipcharts(bow_equip_code).flags(ff4.JobOfActor(i)) = true
   end if
  next
 next

end sub
