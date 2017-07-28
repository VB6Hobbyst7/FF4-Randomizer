sub GiveMP(high_mp as Boolean)

 dim starting_amount as Integer
 dim starting_factor as Integer
 dim level_bonus as Integer
 
 starting_amount = 0
 starting_factor = 2
 level_bonus = iif(high_mp, 8, 4)

 for i as Integer = 0 to total_characters
  if ff4.characters(i).max_mp = 0 then
   if high_mp then starting_factor = RollDie(4) + 4
   ff4.characters(i).max_mp = starting_amount + starting_factor * ff4.characters(i).level
   for j as Integer = ff4.characters(i).level to 69
    ff4.characters(i).levelups(j).mp_bonus = level_bonus
   next
  end if
 next

end sub
