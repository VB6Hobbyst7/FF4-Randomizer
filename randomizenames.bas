sub RandomizeNames(ignore_gender as Boolean)

 dim female_names as Deck
 dim male_names as Deck
 dim all_names as Deck
 dim female_indexes as Set
 dim male_indexes as Set
 dim text as String
 dim gender as String
 
 open "names.dat" for input as #1
  do until eof(1)
   line input #1, text
   select case text
    case "--FEMALE NAMES"
     gender = "f"
    case "--MALE NAMES"
     gender = "m"
    case "--NEUTRAL NAMES"
     gender = "n"
    case else
     all_names.AddCard(text)
     if gender = "f" then
      female_names.AddCard(text)
     elseif gender = "m" then
      male_names.AddCard(text)
     else
      if RollDie(2) = 1 then 
       female_names.AddCard(text)
      else
       male_names.AddCard(text)
      end if
     end if
   end select
  loop
 close #1

 all_names.Shuffle()
 female_names.Shuffle()
 male_names.Shuffle()

 if ignore_gender then

  for i as Integer = 0 to total_names
   ff4.names(i) = ff4.ConvertText(all_names.Draw())
  next

 else

  for i as Integer = dk_character to porom_character
   if GenderOfJob(ff4.characters(i).job_index) = "female" then
    ff4.names(i) = ff4.ConvertText(female_names.Draw())
   else
    ff4.names(i) = ff4.ConvertText(male_names.Draw())
   end if
  next

  for i as Integer = cid_character to fusoya_character
   if GenderOfJob(ff4.characters(i).job_index) = "female" then
    ff4.names(i - 1) = ff4.ConvertText(female_names.Draw())
   else
    ff4.names(i - 1) = ff4.ConvertText(male_names.Draw())
   end if
  next

  ff4.names(12) = ff4.ConvertText(male_names.Draw())
  ff4.names(13) = ff4.ConvertText(female_names.Draw())

 end if
 
end sub
