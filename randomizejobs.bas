sub RandomizeJobs()

 dim jobs as Deck
 dim temp as UByte
 dim old_spellset_assignments(total_characters + 1) as Job
 
 'Record the spell set assignments.
 ' Changing jobs will change spell set assignments, but here we only want to
 ' change the sprite and keep the spell set assignments the same. Thus, we must
 ' record what characters had what spell sets before so they can be
 ' redistributed correctly after the jobs have been shuffled.
 for i as Integer = 0 to total_characters
  old_spellset_assignments(i) = ff4.jobs(ff4.characters(i).job_index)
 next
 old_spellset_assignments(total_characters + 1) = ff4.jobs(ff4.jobchange_job)
 
 for i as Integer = 0 to usable_jobs
  jobs.AddCard(chr(i))
 next
 jobs.Shuffle()
 
 'Shuffle the jobs and assign them to characters, preserving the old spell set
 ' assignments.
 for i as Integer = 0 to total_characters
  temp = asc(jobs.Draw())
  ff4.jobs(temp).white = old_spellset_assignments(i).white
  ff4.jobs(temp).black = old_spellset_assignments(i).black
  ff4.jobs(temp).summon = old_spellset_assignments(i).summon
  ff4.characters(i).job_index = temp
 next
 temp = asc(jobs.Draw())
 ff4.jobchange_job = temp
 ff4.jobs(temp).white = old_spellset_assignments(total_characters + 1).white
 ff4.jobs(temp).black = old_spellset_assignments(total_characters + 1).black
 ff4.jobs(temp).summon = old_spellset_assignments(total_characters + 1).summon
 
 'Make sure the menu spell set assignments match the in-battle ones.
 for i as Integer = 0 to usable_jobs
  ff4.jobs(i).menu_white = ff4.jobs(i).white
  ff4.jobs(i).menu_black = ff4.jobs(i).black
  ff4.jobs(i).menu_summon = ff4.jobs(i).summon
 next
 
 'Make the NPC sprites match the new job sprites.
 for i as Integer = 0 to total_npcs
  select case ff4.npcs(i).sprite
   case dark_knight_sprite: ff4.npcs(i).sprite = ff4.characters(dk_character).job_index
   case kain_sprite:        ff4.npcs(i).sprite = ff4.characters(kain_character).job_index
   case child_rydia_sprite: ff4.npcs(i).sprite = ff4.characters(rydia_character).job_index
   case tellah_sprite:      ff4.npcs(i).sprite = ff4.characters(tellah_character).job_index
   case edward_sprite:      ff4.npcs(i).sprite = ff4.characters(edward_character).job_index
   case rosa_sprite:        ff4.npcs(i).sprite = ff4.characters(rosa_character).job_index
   case yang_sprite:        ff4.npcs(i).sprite = ff4.characters(yang_character).job_index
   case palom_sprite:       ff4.npcs(i).sprite = ff4.characters(palom_character).job_index
   case porom_sprite:       ff4.npcs(i).sprite = ff4.characters(porom_character).job_index
   case paladin_sprite:     ff4.npcs(i).sprite = ff4.characters(paladin_character).job_index
   case cid_sprite:         ff4.npcs(i).sprite = ff4.characters(cid_character).job_index
   case adult_rydia_sprite: ff4.npcs(i).sprite = ff4.jobchange_job
   case edge_sprite:        ff4.npcs(i).sprite = ff4.characters(edge_character).job_index
   case fusoya_sprite:      ff4.npcs(i).sprite = ff4.characters(fusoya_character).job_index
  end select
 next
 
end sub
