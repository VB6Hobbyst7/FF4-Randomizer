sub RandomizeCommands(actor_preserve as Boolean)

 dim white as Deck
 dim black as Deck
 dim actors as Spinner
 dim jobs as Deck
 dim current_job as UByte
 dim actors_of_job as List
 dim commands as Spinner
 dim current_actor as UByte
 dim current_command as UByte
 
 GiveMP() 
 
 ff4.ClearActorCommands()

 white.AddCard(chr(paladin_white_spellset))
 white.AddCard(chr(rydia_white_spellset))
 black.AddCard(chr(rydia_black_spellset))
 white.AddCard(chr(tellah_white_spellset))
 black.AddCard(chr(tellah_black_spellset))
 white.AddCard(chr(rosa_white_spellset))
 black.AddCard(chr(palom_black_spellset))
 white.AddCard(chr(porom_white_spellset))
 white.AddCard(chr(fusoya_white_spellset))
 black.AddCard(chr(fusoya_black_spellset))
 white.Shuffle()
 black.Shuffle()

 for i as Integer = 0 to usable_jobs
  if i <> ff4.jobchange_job then jobs.AddCard(chr(i))
 next
 jobs.Shuffle()
 
 ff4.ClearJobSpellSets()
 do until white.Size() = 0
  current_job = asc(jobs.Draw())
  ff4.AssignSpellSet(current_job, asc(white.Draw()), "white")
  actors_of_job = ff4.ActorsOfJob(current_job)
  for i as Integer = 1 to actors_of_job.Length()
   ff4.GiveActorCommand(asc(actors_of_job.ItemAt(i)), white_command)
  next
 loop
 
 jobs.Destroy()
 for i as Integer = 0 to usable_jobs
  if i <> ff4.jobchange_job and i <> ff4.JobChangeFrom() then
   actors_of_job = ff4.ActorsOfJob(i)
   if actors_of_job.Length() = 1 then jobs.AddCard(chr(i))
  end if
 next
 jobs.Shuffle()
 
 current_job = asc(jobs.Draw())
 ff4.AssignSpellSet(current_job, edge_spellset, "black")
 ff4.GiveActorCommand(asc(actors_of_job.ItemAt(1)), ninja_command)

 jobs.Destroy()
 for i as Integer = 0 to usable_jobs
  if i <> adult_caller_job and i <> current_job then jobs.AddCard(chr(i))
 next
 jobs.Shuffle()
 
 do until black.Size() = 0
  current_job = asc(jobs.Draw())
  ff4.AssignSpellSet(current_job, asc(black.Draw()), "black")
  actors_of_job = ff4.ActorsOfJob(current_job)
  for i as Integer = 1 to actors_of_job.Length()
   ff4.GiveActorCommand(asc(actors_of_job.ItemAt(i)), black_command)
  next
 loop
 
 jobs.Destroy()
 for i as Integer = 0 to usable_jobs
  if i <> adult_caller_job then jobs.AddCard(chr(i))
 next
 jobs.Shuffle()
 
 current_job = asc(jobs.Draw())
 ff4.AssignSpellset(current_job, rydia_summon_spellset, "summon")
 actors_of_job = ff4.ActorsOfJob(current_job)
 for i as Integer = 1 to actors_of_job.Length()
  ff4.GiveActorCommand(asc(actors_of_job.ItemAt(i)), summon_command)
 next
 
 ff4.jobs(ff4.jobchange_job).white = ff4.jobs(young_caller_job).white
 ff4.jobs(ff4.jobchange_job).black = ff4.jobs(young_caller_job).black
 ff4.jobs(ff4.jobchange_job).summon = ff4.jobs(young_caller_job).summon
 ff4.jobs(ff4.jobchange_job).menu_white = ff4.jobs(young_caller_job).menu_white
 ff4.jobs(ff4.jobchange_job).menu_black = ff4.jobs(young_caller_job).menu_black
 ff4.jobs(ff4.jobchange_job).menu_summon = ff4.jobs(young_caller_job).menu_summon

 for i as Integer = 0 to total_actors
  if ff4.actors(i).load_initial or not actor_preserve then actors.AddSide(chr(i))
 next
 
 for i as Integer = darkwave_command to peep_command
  commands.AddSide(chr(i))
 next
 commands.AddSide(chr(dart_command))
 commands.AddSide(chr(sneak_command))
 commands.AddSide(chr(regen_command))
 commands.RemoveSide(chr(twin_command))

 do until actors.Size() = 0
  current_actor = asc(actors.Spin())
  if ff4.CommandCount(current_actor) = 5 then
   actors.RemoveSide(chr(current_actor))
  else
   if RollDie(4) > 1 or ff4.CommandCount(current_actor) < 3 then
    current_command = asc(commands.Spin())
    if current_command = hide_command or current_command = cover_command then
     if ff4.UniqueActor(current_actor) or not actor_preserve then
      ff4.GiveActorCommand(current_actor, current_command)
      commands.RemoveSide(chr(current_command))
     end if
    else
     ff4.GiveActorCommand(current_actor, current_command)
    end if
   else
    actors.RemoveSide(chr(current_actor))
   end if
  end if
 loop 
 
 if actor_preserve then
  for i as Integer = 0 to usable_jobs
   actors_of_job = ff4.ActorsOfJob(i)
   current_actor = asc(actors_of_job.ItemAt(1))
   for j as Integer = 2 to actors_of_job.Length()
    for k as Integer = 1 to 5
     ff4.actors(asc(actors_of_job.ItemAt(j))).menu_command(k) = ff4.actors(current_actor).menu_command(k)
    next
   next
  next
  for i as Integer = 1 to 5
   ff4.actors(adult_rydia_actor).menu_command(i) = ff4.actors(child_rydia_actor).menu_command(i)
  next
 end if
 
 if ff4.CommandCount(palom_actor) < 5 and ff4.CommandCount(porom_actor) < 5 then
  if RollDie(4) > 1 then
   ff4.GiveActorCommand(palom_actor, twin_command)
   ff4.GiveActorCommand(porom_actor, twin_command)
  end if
 end if

end sub
