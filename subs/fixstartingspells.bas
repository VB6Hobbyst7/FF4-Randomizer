sub FixSpells(index as UByte, level as UByte)

 dim last as Integer
 
 if index <= total_spell_sets then
 
  last = 0
  for i as Integer = 1 to ff4.spellsets(index).learning_levels.Length()
   if asc(ff4.spellsets(index).learning_levels.ItemAt(i)) <= level then
    last += 1
    ff4.spellsets(index).starting_spells.Append(ff4.spellsets(index).learning_spells.ItemAt(i))
   end if
  next
  
  do until last = 0
   ff4.spellsets(index).learning_spells.Remove(1)
   ff4.spellsets(index).learning_levels.Remove(1)
   last -= 1
  loop
  
 end if

end sub


sub FixStartingSpells()

 ff4.SortSpellSets()
 for i as Integer = 0 to total_characters
  FixSpells(ff4.jobs(ff4.characters(i).job_index).black, ff4.characters(i).level)
  FixSpells(ff4.jobs(ff4.characters(i).job_index).white, ff4.characters(i).level)
  FixSpells(ff4.jobs(ff4.characters(i).job_index).summon, ff4.characters(i).level)
 next

end sub
