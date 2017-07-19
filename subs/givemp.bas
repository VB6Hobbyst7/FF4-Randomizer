sub GiveMP()

 for i as Integer = 0 to total_characters
  if ff4.characters(i).max_mp = 0 then
   ff4.characters(i).max_mp = 2 * ff4.characters(i).level
   for j as Integer = ff4.characters(i).level to 69
    ff4.characters(i).levelups(j).mp_bonus = 4
   next
  end if
 next

end sub
