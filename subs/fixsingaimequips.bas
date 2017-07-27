sub FixSingAimEquips()

 dim link as MetaItem ptr
 dim bow_equip_codes as Deck
 dim harp_equip_codes as Deck
 
 for i as Integer = 1 to itemlist.Length()
  link = itemlist.PointerAt(i)
  if link->kind = "Harp" then
   harp_equip_codes.AddCard(chr(link->itemdata.equip_code))
  elseif link->kind = "Bow" then
   bow_equip_codes.AddCard(chr(link->itemdata.equip_code))
  end if
 next
 harp_equip_codes.Shuffle()
 bow_equip_codes.Shuffle()

 for i as Integer = 0 to total_actors
  if ff4.ActorHasCommand(i, sing_command) then
   ff4.equipcharts(asc(harp_equip_codes.Draw())).flags(ff4.JobOfActor(i)) = true
  end if
  if ff4.ActorHasCommand(i, aim_command) then
   ff4.equipcharts(asc(bow_equip_codes.Draw())).flags(ff4.JobOfActor(i)) = true
  end if
 next

end sub
