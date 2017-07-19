sub FixStartingEquips()

 dim tier as Integer
 dim link as MetaItem ptr
 dim weapons as Deck
 dim shields as Deck
 dim heads as Deck
 dim bodys as Deck
 dim arms as Deck
 dim temp as UByte
 
 for i as Integer = 0 to total_actors
 
  select case i
   case dk_actor to rosa1_actor
    tier = 1
   case yang1_actor to porom_actor
    tier = 2
   case tellah2_actor to rosa2_actor
    tier = 3
   case adult_rydia_actor, edge_actor
    tier = 4
   case fusoya_actor
    tier = 5
   case kain3_actor
    tier = 6
  end select
  
  weapons.Destroy()
  shields.Destroy()
  heads.Destroy()
  bodys.Destroy()
  arms.Destroy()
  for j as Integer = 1 to itemlist.Length()
   link = itemlist.PointerAt(j)
   if link->level = tier then
    if ff4.CanEquip(i, j) then
     if ff4.weapons_range.InRange(j) then weapons.AddCard(chr(j))
     if ff4.shield_range.InRange(j) then shields.AddCard(chr(j))
     if ff4.head_range.InRange(j) then heads.AddCard(chr(j))
     if ff4.body_range.InRange(j) then bodys.AddCard(chr(j))
     if ff4.arms_range.InRange(j) then arms.AddCard(chr(j))
    end if
   end if
  next
  if weapons.Size() > 0 then
   weapons.Shuffle()
  else
   for j as Integer = 1 to itemlist.Length()
    if ff4.CanEquip(i, j) then
     if ff4.weapons_range.InRange(j) then weapons.AddCard(chr(j))
    end if
   next
  end if
  if shields.Size() > 0 then
   shields.Shuffle()
  else
   for j as Integer = 1 to itemlist.Length()
    if ff4.CanEquip(i, j) then
     if ff4.shield_range.InRange(j) then shields.AddCard(chr(j))
    end if
   next
  end if
  if heads.Size() > 0 then
   heads.Shuffle()
  else
   for j as Integer = 1 to itemlist.Length()
    if ff4.CanEquip(i, j) then
     if ff4.head_range.InRange(j) then heads.AddCard(chr(j))
    end if
   next
  end if
  if bodys.Size() then
   bodys.Shuffle()
  else
   for j as Integer = 1 to itemlist.Length()
    if ff4.CanEquip(i, j) then
     if ff4.body_range.InRange(j) then bodys.AddCard(chr(j))
    end if
   next
  end if
  if arms.Size() then
   arms.Shuffle()
  else
   for j as Integer = 1 to itemlist.Length()
    if ff4.CanEquip(i, j) then
     if ff4.arms_range.InRange(j) then arms.AddCard(chr(j))
    end if
   next
  end if  
  
  ff4.Unequip(i)
  
  if weapons.Size() > 0 then
   temp = asc(weapons.Draw())
   ff4.Equip(i, temp)
   if ff4.arrow_range.InRange(temp) then
    do until ff4.bow_range.InRange(temp)
     temp = asc(weapons.Draw())
    loop
    ff4.Equip(i, temp)
   elseif ff4.bow_range.InRange(temp) then
    do until ff4.arrow_range.InRange(temp)
     temp = asc(weapons.Draw())
    loop
    ff4.Equip(i, temp)
   end if
  end if
  
  if not ff4.arrow_range.InRange(temp) and not ff4.bow_range.InRange(temp) and not ff4.two_handed_range.InRange(temp) then
   if ff4.characters(ff4.actors(i).level_link).right_handed and ff4.characters(ff4.actors(i).level_link).left_handed then
    weapons.AddCard(chr(temp))
    weapons.Shuffle()
    ff4.Equip(i, asc(weapons.Draw()))
   else
    if RollDie(4) > 1 and shields.Size() > 0 then
     ff4.Equip(i, asc(shields.Draw()))
    end if
   end if
  end if
  
  if heads.Size() > 0 and RollDie(4) > 1 then
   ff4.Equip(i, asc(heads.Draw()))
  end if
  
  if bodys.Size() > 0 then
   ff4.Equip(i, asc(bodys.Draw()))
  end if
  
  if arms.Size() > 0 and RollDie(6) > 1 then
   ff4.Equip(i, asc(arms.Draw()))
  end if

 next

end sub
