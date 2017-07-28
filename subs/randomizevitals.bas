sub RandomizeVitals(high_mp as Boolean)

 dim stats(7) as Integer
 dim sum as Integer
 dim current_stat as Integer
 dim starting_base(5) as Integer
 dim levelup_bonus(5) as Integer
 dim hp_base(5) as Integer
 dim hp_levelup(5) as Integer
 dim mp_base(5) as Integer
 dim mp_levelup(5) as Integer
 
 starting_base(1) = 1
 starting_base(2) = 2
 starting_base(3) = 3
 starting_base(4) = 4
 starting_base(5) = 5
 
 levelup_bonus(1) = 1
 levelup_bonus(2) = 2
 levelup_bonus(3) = 4
 levelup_bonus(4) = 6
 levelup_bonus(5) = 8
 
 hp_base(1) = 20
 hp_base(2) = 30
 hp_base(3) = 40
 hp_base(4) = 50
 hp_base(5) = 60
 
 hp_levelup(1) = 5
 hp_levelup(2) = 8
 hp_levelup(3) = 10
 hp_levelup(4) = 12
 hp_levelup(5) = 15
 
 mp_base(1) = 10
 mp_base(2) = 12
 mp_base(3) = 15
 mp_base(4) = 20
 mp_base(5) = 30
 
 mp_levelup(1) = 3
 mp_levelup(2) = 4
 mp_levelup(3) = 5
 mp_levelup(4) = 6
 mp_levelup(5) = 8
 
 for character_index as Integer = 0 to total_characters
  sum = 0
  for i as Integer = 1 to 7
   stats(i) = RollDie(5)
   sum += stats(i)
  next
  do while sum > 21
   current_stat = RollDie(7)
   if stats(current_stat) > 1 then
    stats(current_stat) -= 1
    sum -= 1
   end if
  loop
  do while sum < 21
   current_stat = RollDie(7)
   if stats(current_stat) < 5 then
    stats(current_stat) += 1
    sum += 1
   end if
  loop
  for i as Integer = 1 to 5
   ff4.characters(character_index).stats(i - 1) = starting_base(stats(i)) + levelup_bonus(stats(i)) * ff4.characters(character_index).level \ 8 + RollDie(levelup_bonus(stats(i)) + 2) - (levelup_bonus(stats(i)) + 3) \ 2
   for j as Integer = ff4.characters(character_index).level to 69
    ff4.characters(character_index).levelups(j).stat_bonus.amount = 1
    ff4.characters(character_index).levelups(j).stat_bonus.stats(i - 1) = iif(RollDie(8) <= levelup_bonus(stats(i)), true, false)
   next
  next
  ff4.characters(character_index).max_hp = hp_base(stats(6))
  for i as Integer = 1 to 69
   if i < ff4.characters(character_index).level then
    ff4.characters(character_index).max_hp += hp_levelup(stats(6)) * (i \ 8 + 1)
   else
    ff4.characters(character_index).levelups(i).hp_bonus = hp_levelup(stats(6)) * (i \ 8 + 1)
   end if
  next
  if high_mp and cbool(stats(7) < 5) then stats(7) += 1
  ff4.characters(character_index).max_mp = mp_base(stats(7))
  for i as Integer = 1 to 69
   if i < ff4.characters(character_index).level then
    ff4.characters(character_index).max_mp += mp_levelup(stats(7))
   else
    ff4.characters(character_index).levelups(i).mp_bonus = mp_levelup(stats(7))
   end if
  next
 next
 
 'for i as Integer = 0 to total_characters
  'for j as Integer = ff4.characters(i).level to 69
   'print ff4.characters(i).levelups(j).stat_bonus.amount
  'next
 'next

end sub
