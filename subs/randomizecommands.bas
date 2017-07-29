sub RandomizeCommands(actor_preserve as Boolean, high_mp as Boolean)

 dim white as Deck
 dim black as Deck
 dim actors as Spinner
 dim jobs as Deck
 dim current_job as UByte
 dim actors_of_job as List
 dim commands as Spinner
 dim current_actor as UByte
 dim current_command as UByte
 dim patch as String
 dim auto_hide as UByte = &hF0
 dim auto_cover as UByte = &hF0
 dim twin1 as UByte = &hF0
 dim twin2 as UByte = &hF0
 dim twinswith(total_actors) as Deck
 dim twin_actor as UByte
 
 'Create decks of who can be twins with who
 twinswith(dk_actor).AddCard(chr(kain1_actor))
 twinswith(dk_actor).AddCard(chr(child_rydia_actor))
 twinswith(dk_actor).AddCard(chr(tellah1_actor))
 twinswith(dk_actor).AddCard(chr(edward_actor))
 twinswith(dk_actor).AddCard(chr(rosa1_actor))
 twinswith(dk_actor).AddCard(chr(yang1_actor))
 twinswith(dk_actor).AddCard(chr(palom_actor))
 twinswith(dk_actor).AddCard(chr(porom_actor))
 twinswith(dk_actor).AddCard(chr(tellah2_actor))
 
 twinswith(kain1_actor).AddCard(chr(dk_actor))

 twinswith(child_rydia_actor).AddCard(chr(dk_actor))
 twinswith(child_rydia_actor).AddCard(chr(tellah1_actor))
 twinswith(child_rydia_actor).AddCard(chr(edward_actor))
 twinswith(child_rydia_actor).AddCard(chr(rosa1_actor))
 twinswith(child_rydia_actor).AddCard(chr(yang1_actor))

 twinswith(tellah1_actor).AddCard(chr(dk_actor))
 twinswith(tellah1_actor).AddCard(chr(child_rydia_actor))

 twinswith(edward_actor).AddCard(chr(dk_actor))
 twinswith(edward_actor).AddCard(chr(child_rydia_actor))
 twinswith(edward_actor).AddCard(chr(rosa1_actor))
 twinswith(edward_actor).AddCard(chr(yang1_actor))

 twinswith(rosa1_actor).AddCard(chr(dk_actor))
 twinswith(rosa1_actor).AddCard(chr(child_rydia_actor))
 twinswith(rosa1_actor).AddCard(chr(edward_actor))
 twinswith(rosa1_actor).AddCard(chr(yang1_actor))
 
 twinswith(yang1_actor).AddCard(chr(dk_actor))
 twinswith(yang1_actor).AddCard(chr(child_rydia_actor))
 twinswith(yang1_actor).AddCard(chr(edward_actor))
 twinswith(yang1_actor).AddCard(chr(rosa1_actor))
 
 twinswith(palom_actor).AddCard(chr(dk_actor))
 twinswith(palom_actor).AddCard(chr(porom_actor))
 twinswith(palom_actor).AddCard(chr(tellah2_actor))
 twinswith(palom_actor).AddCard(chr(paladin_actor))
 twinswith(palom_actor).AddCard(chr(tellah3_actor))
 twinswith(palom_actor).AddCard(chr(yang2_actor))

 twinswith(porom_actor).AddCard(chr(dk_actor))
 twinswith(porom_actor).AddCard(chr(palom_actor))
 twinswith(porom_actor).AddCard(chr(tellah2_actor))
 twinswith(porom_actor).AddCard(chr(paladin_actor))
 twinswith(porom_actor).AddCard(chr(tellah3_actor))
 twinswith(porom_actor).AddCard(chr(yang2_actor))

 twinswith(tellah2_actor).AddCard(chr(dk_actor))
 twinswith(tellah2_actor).AddCard(chr(palom_actor))
 twinswith(tellah2_actor).AddCard(chr(porom_actor))
 
 twinswith(paladin_actor).AddCard(chr(palom_actor))
 twinswith(paladin_actor).AddCard(chr(porom_actor))
 twinswith(paladin_actor).AddCard(chr(tellah3_actor))
 twinswith(paladin_actor).AddCard(chr(yang2_actor))
 twinswith(paladin_actor).AddCard(chr(cid_actor))
 twinswith(paladin_actor).AddCard(chr(kain2_actor))
 twinswith(paladin_actor).AddCard(chr(rosa2_actor))
 twinswith(paladin_actor).AddCard(chr(adult_rydia_actor))
 twinswith(paladin_actor).AddCard(chr(edge_actor))
 twinswith(paladin_actor).AddCard(chr(fusoya_actor))
 twinswith(paladin_actor).AddCard(chr(kain3_actor))

 twinswith(tellah3_actor).AddCard(chr(palom_actor))
 twinswith(tellah3_actor).AddCard(chr(porom_actor))
 twinswith(tellah3_actor).AddCard(chr(paladin_actor))
 twinswith(tellah3_actor).AddCard(chr(yang2_actor))
 twinswith(tellah3_actor).AddCard(chr(cid_actor))

 twinswith(yang2_actor).AddCard(chr(palom_actor))
 twinswith(yang2_actor).AddCard(chr(porom_actor))
 twinswith(yang2_actor).AddCard(chr(paladin_actor))
 twinswith(yang2_actor).AddCard(chr(tellah3_actor))
 twinswith(yang2_actor).AddCard(chr(cid_actor))
 twinswith(yang2_actor).AddCard(chr(kain2_actor))
 twinswith(yang2_actor).AddCard(chr(rosa2_actor))
 twinswith(yang2_actor).AddCard(chr(adult_rydia_actor))
 
 twinswith(cid_actor).AddCard(chr(paladin_actor))
 twinswith(cid_actor).AddCard(chr(tellah3_actor))
 twinswith(cid_actor).AddCard(chr(yang2_actor))

 twinswith(kain2_actor).AddCard(chr(paladin_actor))
 twinswith(kain2_actor).AddCard(chr(yang2_actor))
 twinswith(kain2_actor).AddCard(chr(rosa2_actor))
 twinswith(kain2_actor).AddCard(chr(adult_rydia_actor))
 twinswith(kain2_actor).AddCard(chr(edge_actor))

 twinswith(rosa2_actor).AddCard(chr(paladin_actor))
 twinswith(rosa2_actor).AddCard(chr(yang2_actor))
 twinswith(rosa2_actor).AddCard(chr(adult_rydia_actor))
 twinswith(rosa2_actor).AddCard(chr(edge_actor))
 twinswith(rosa2_actor).AddCard(chr(kain3_actor))
 
 twinswith(adult_rydia_actor).AddCard(chr(paladin_actor))
 twinswith(adult_rydia_actor).AddCard(chr(yang2_actor))
 twinswith(adult_rydia_actor).AddCard(chr(kain2_actor))
 twinswith(adult_rydia_actor).AddCard(chr(rosa2_actor))
 twinswith(adult_rydia_actor).AddCard(chr(edge_actor))
 twinswith(adult_rydia_actor).AddCard(chr(kain3_actor))

 twinswith(edge_actor).AddCard(chr(paladin_actor))
 twinswith(edge_actor).AddCard(chr(kain2_actor))
 twinswith(edge_actor).AddCard(chr(rosa2_actor))
 twinswith(edge_actor).AddCard(chr(adult_rydia_actor))
 twinswith(edge_actor).AddCard(chr(kain3_actor))
 
 twinswith(kain3_actor).AddCard(chr(paladin_actor))
 twinswith(kain3_actor).AddCard(chr(rosa2_actor))
 twinswith(kain3_actor).AddCard(chr(adult_rydia_actor))
 twinswith(kain3_actor).AddCard(chr(edge_actor))
 
 for i as Integer = 0 to total_actors
  twinswith(i).Shuffle()
 next

 'Give non-wizards some MP in case they end up with spell sets
 GiveMP(high_mp) 
 
 'Clear out everyone's command list
 ff4.ClearActorCommands()

 'Create the main white and black spell set decks
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

 'Give out white sets
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
 
 'Give someone Ninja
 ' Only a unique actor can have it due to the name changing thing
 jobs.Destroy()
 for i as Integer = 0 to usable_jobs
  if i <> ff4.jobchange_job and i <> ff4.JobChangeFrom() then
   actors_of_job = ff4.ActorsOfJob(i)
   if actors_of_job.Length() = 1 then jobs.AddCard(chr(i))
  end if
 next
 jobs.Shuffle()
 
 current_job = asc(jobs.Draw())
 actors_of_job = ff4.ActorsOfJob(current_job)
 ff4.AssignSpellSet(current_job, edge_spellset, "black")
 ff4.GiveActorCommand(asc(actors_of_job.ItemAt(1)), ninja_command)

 'Give out black sets
 jobs.Destroy()
 for i as Integer = 0 to usable_jobs
  if i <> ff4.jobchange_job and i <> current_job then jobs.AddCard(chr(i))
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
 
 'Give someone Call/summon
 jobs.Destroy()
 for i as Integer = 0 to usable_jobs
  if i <> ff4.jobchange_job then jobs.AddCard(chr(i))
 next
 jobs.Shuffle()
 
 current_job = asc(jobs.Draw())
 ff4.AssignSpellset(current_job, rydia_summon_spellset, "summon")
 actors_of_job = ff4.ActorsOfJob(current_job)
 for i as Integer = 1 to actors_of_job.Length()
  ff4.GiveActorCommand(asc(actors_of_job.ItemAt(i)), summon_command)
 next
 
 'Give the job-change job the same spell sets as the job it changed from
 ff4.jobs(ff4.jobchange_job).white = ff4.jobs(young_caller_job).white
 ff4.jobs(ff4.jobchange_job).black = ff4.jobs(young_caller_job).black
 ff4.jobs(ff4.jobchange_job).summon = ff4.jobs(young_caller_job).summon
 ff4.jobs(ff4.jobchange_job).menu_white = ff4.jobs(young_caller_job).menu_white
 ff4.jobs(ff4.jobchange_job).menu_black = ff4.jobs(young_caller_job).menu_black
 ff4.jobs(ff4.jobchange_job).menu_summon = ff4.jobs(young_caller_job).menu_summon

 'Construct the set initial actors
 for i as Integer = 0 to total_actors
  if ff4.actors(i).load_initial or not actor_preserve then actors.AddSide(chr(i))
 next
 
 'Construct the set of commands
 for i as Integer = darkwave_command to peep_command
  commands.AddSide(chr(i))
 next
 commands.AddSide(chr(dart_command))
 commands.AddSide(chr(sneak_command))
 commands.AddSide(chr(regen_command))
 if not actor_preserve then commands.RemoveSide(chr(twin_command))

 'Give out commands
 do until actors.Size() = 0
  current_actor = asc(actors.Spin())
  if ff4.CommandCount(current_actor) = 5 then
   actors.RemoveSide(chr(current_actor))
  else
   if RollDie(4) > 1 or ff4.CommandCount(current_actor) < 3 then
    current_command = asc(commands.Spin())
    if current_command = hide_command then
     ff4.GiveActorCommand(current_actor, current_command)
     commands.RemoveSide(chr(current_command))
     auto_hide = iif(actor_preserve, ff4.JobOfActor(current_actor), current_actor)
    elseif current_command = cover_command then
     if not ff4.ActorHasCommand(current_actor, twin_command) then
      ff4.GiveActorCommand(current_actor, current_command)
      commands.RemoveSide(chr(current_command))
      auto_cover = iif(actor_preserve, ff4.JobOfActor(current_actor), current_actor)
     end if
    elseif current_command = twin_command then
     if not ff4.ActorHasCommand(current_actor, cover_command) and actor_preserve then
      do while twinswith(current_actor).Size() > 0
       twin_actor = asc(twinswith(current_actor).Draw())
       if twin_actor <> adult_rydia_actor then twin_actor = ff4.characters(ff4.actors(twin_actor).level_link).character_id
       if not ff4.ActorHasCommand(twin_actor, cover_command) then
        ff4.GiveActorCommand(twin_actor, twin_command)
        if ff4.ActorHasCommand(twin_actor, twin_command) then
         ff4.GiveActorCommand(current_actor, twin_command)
         twin1 = ff4.JobOfActor(current_actor)
         twin2 = ff4.JobOfActor(twin_actor)
         'print "Twins are "; ff4.DisplayText(ff4.jobs(twin1).name); " and "; ff4.DisplayText(ff4.jobs(twin2).name)
         'print " Actor "; current_actor; " and Actor "; twin_actor
         commands.RemoveSide(chr(twin_command))
         exit do
        end if
       end if
      loop
     end if
    elseif current_command = boast_command then
     if ff4.ActorHasCommand(current_actor, black_command) or ff4.ActorHasCommand(current_actor, call_command) or ff4.ActorHasCommand(current_actor, ninja_command) then
      ff4.GiveActorCommand(current_actor, current_command)
     end if
    else
     ff4.GiveActorCommand(current_actor, current_command)
    end if
   else
    actors.RemoveSide(chr(current_actor))
   end if
  end if
 loop 
 
 'Give the characters of the same job the same commands (if preserving actors)
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
 
 ''Give out Twin
 'if ff4.CommandCount(palom_actor) < 5 and ff4.CommandCount(porom_actor) < 5 then
  'if RollDie(4) > 1 then
   'ff4.GiveActorCommand(palom_actor, twin_command)
   'ff4.GiveActorCommand(porom_actor, twin_command)
  'end if
 'end if
 
 'Patch Hide so that it looks for job rather than actor
 if actor_preserve then
  patch = chr(&hBD) + chr(&h01) + chr(&h20) + chr(&h29) + chr(&h0F) + chr(&hC9) + chr(auto_hide)
  ff4.ApplyPatch(&h1A602, patch)
  ff4.ApplyPatch(&h1AD51, patch)
 end if
 ff4.menu_commands(hide_command).parameters(1) = auto_hide
 
 'Patch Cover and Twin to look for jobs
 ' Changed from original patch according to comments in Discord as follows:
 '  Ok, in the added code patch, find the byte sequence: 
 '  A5 A9 8D 5E 35 80 0C
 '  And replace it with
 '  48 A5 A9 8D 5E 35 68
 '  (Changes the added code so that instead of aborting out after finding the Cover job, it proceeds to the Twin job checks) 
 if actor_preserve then
  patch =  chr(&hA9) + chr(&hFF) + chr(&h8D) + chr(&h3A) + chr(&h35)
  patch += chr(&hB1) + chr(&h80) + chr(&h29) + chr(&h1F) + chr(&hF0)
  patch += chr(&h0F) + chr(&hC8) + chr(&hB1) + chr(&h80) + chr(&h88)
  patch += chr(&h20) + chr(&hE3) + chr(&hFE) + chr(&hF0) + chr(&h06)
  ff4.ApplyPatch(&h197A8, patch)
  patch = chr(&hD0) + chr(&hD6)
  ff4.ApplyPatch(&h197D5, patch)
  patch = chr(&h4C) + chr(&h0C) + chr(&hFF) + chr(&hEA)
  ff4.ApplyPatch(&h1A539, patch)
  patch = chr(&hF0) + chr(&h1B)
  ff4.ApplyPatch(&h18F67, patch)
  patch =  chr(&h29) + chr(&h0F) + chr(&hC9) + chr(&h0F) + chr(&hD0)
  patch += chr(&h0A) + chr(&h5A) + chr(&hA0) + chr(&h03) + chr(&h04)
  patch += chr(&h8C) + chr(&h39) + chr(&h35) + chr(&h7A) + chr(&h80)
  patch += chr(&h17) + chr(&hC9) + chr(auto_cover) + chr(&hD0) + chr(&h07)
  patch += chr(&h48) + chr(&hA5) + chr(&hA9) + chr(&h8D) + chr(&h5E)
  patch += chr(&h35) + chr(&h68) + chr(&hC9) + chr(twin1) + chr(&hF0)
  patch += chr(&h04) + chr(&hC9) + chr(twin2) + chr(&hD0) + chr(&h04)
  patch += chr(&hA9) + chr(&h01) + chr(&h80) + chr(&h01) + chr(&h7B)
  patch += chr(&h60) + chr(&hAD) + chr(&h3A) + chr(&h35) + chr(&hC9)
  patch += chr(&hFF) + chr(&hD0) + chr(&h03) + chr(&h4C) + chr(&h78)
  patch += chr(&hA3) + chr(&hDA) + chr(&hAE) + chr(&h36) + chr(&h35)
  patch += chr(&h4C) + chr(&h3D) + chr(&hA3)
  ff4.ApplyPatch(&h200E3, patch)
 end if 

end sub

