sub RandomizeEquips(female_preserve as Boolean, ignore_kinds as Boolean)

 dim link as MetaItem ptr
 dim special_codes as Set
 dim female_code as UByte = 14
 dim weaponcharts as Spinner
 dim headcharts as Spinner
 dim bodycharts as Spinner
 dim armscharts as Spinner
 dim found as Boolean
 
 special_codes.AddItem(chr(31))
 
 'Set the equip codes
 if ignore_kinds then
  for i as Integer = 1 to ff4.armors_range.finish
   link = itemlist.PointerAt(i)
   link->itemdata.equip_code = RollDie(31) - 1
  next
 else
  StreamlineKinds()
  special_codes.AddItem(chr(0))
  special_codes.AddItem(chr(2))
  special_codes.AddItem(chr(3))
  female_code = 1
  'Set holy and dark codes separately from the rest
  'Unset all their flags
  for i as Integer = 0 to usable_jobs
   ff4.equipcharts(2).flags(i) = false
   ff4.equipcharts(3).flags(i) = false
  next
  'Set the flag for a random job
  ff4.equipcharts(2).flags(RollDie(usable_jobs + 1) - 1) = true
  ff4.equipcharts(3).flags(RollDie(usable_jobs + 1) - 1) = true
  'Set random other jobs
  for i as Integer = 0 to usable_jobs
   if RollDie(12) = 1 then ff4.equipcharts(2).flags(i) = true
   if RollDie(12) = 1 then ff4.equipcharts(3).flags(i) = true
  next
 end if
 if female_preserve then special_codes.AddItem(chr(female_code))

 'Unset all the flags for the normal codes
 for i as Integer = 0 to 30
  if not special_codes.Contains(chr(i)) then
   for j as Integer = 0 to total_jobs
    ff4.equipcharts(i).flags(j) = false
   next
  end if
 next

 'Create the spinners for each slot 
 for i as Integer = 1 to ff4.armors_range.finish
  link = itemlist.PointerAt(i)
  if not special_codes.Contains(chr(link->itemdata.equip_code)) then
   if ff4.weapons_range.InRange(i) then
    weaponcharts.AddSide(chr(link->itemdata.equip_code))
   elseif ff4.head_range.InRange(i) then
    headcharts.AddSide(chr(link->itemdata.equip_code))
   elseif ff4.body_range.InRange(i) then
    bodycharts.AddSide(chr(link->itemdata.equip_code))
   elseif ff4.arms_range.InRange(i) then
    armscharts.AddSide(chr(link->itemdata.equip_code))
   end if
  end if
 next
 
 'Assign each job at least one normal code for each slot
 for i as Integer = 0 to usable_jobs
  ff4.equipcharts(asc(weaponcharts.Spin())).flags(i) = true
  ff4.equipcharts(asc(headcharts.Spin())).flags(i) = true
  ff4.equipcharts(asc(bodycharts.Spin())).flags(i) = true
  ff4.equipcharts(asc(armscharts.Spin())).flags(i) = true
 next
 
 'Assign random other flags for each normal code
 for i as Integer = 0 to 30
  if not special_codes.Contains(chr(i)) then
   for j as Integer = 0 to usable_jobs
    if RollDie(8) = 1 then
     ff4.equipcharts(i).flags(j) = true
    end if
   next
  end if
 next
 
 'Make sure each normal code has at least one job that can use it
 for i as Integer = 0 to 30
  if not special_codes.Contains(chr(i)) then
   found = false
   for j as Integer = 0 to usable_jobs
    if ff4.equipcharts(i).flags(j) then
     found = true
     exit for
    end if
   next
   if not found then
    ff4.equipcharts(i).flags(RollDie(usable_jobs + 1) - 1) = true
   end if
  end if
 next

end sub
