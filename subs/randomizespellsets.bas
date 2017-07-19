sub RandomizeSpellSets()

 dim spells as Deck
 
 for i as Integer = 0 to total_spell_sets
  if ff4.spellsets(i).learning_spells.Length() > 0 then
   for j as Integer = 1 to ff4.spellsets(i).starting_spells.Length()
    spells.AddCard(ff4.spellsets(i).starting_spells.ItemAt(j))
   next
   for j as Integer = 1 to ff4.spellsets(i).learning_spells.Length()
    spells.AddCard(ff4.spellsets(i).learning_spells.ItemAt(j))
   next
   ff4.spellsets(i).starting_spells.Destroy()
   ff4.spellsets(i).learning_spells.Destroy()
   ff4.spellsets(i).learning_levels.Destroy()
   do until spells.Size() = 0
    ff4.spellsets(i).learning_spells.Append(spells.Draw())
    ff4.spellsets(i).learning_levels.Append(chr(Min(RollDie(69), RollDie(69))))
   loop
  end if
 next

end sub
