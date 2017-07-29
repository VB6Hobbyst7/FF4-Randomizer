function LongName(short_name as String) as String

 dim result as String
 
 select case short_name
  case "Lenora": result = "Leonora"
  case "Magisa": result = "Magissa"
  case "Madona": result = "Madonna"
  case "Katrin": result = "Katarin"
  case "Selphy": result = "Selphie"
  case "Qistis": result = "Quistis"
  case "Betrix": result = "Beatrix"
  case "Melia":  result = "Meliadul"
  case "Ceodor": result = "Ceodore"
  case "Zanget": result = "Zangetsu"
  case "Tsuki":  result = "Tsukinoa"
  case "Colman": result = "Coleman"
  case "Nerick": result = "Nerrick"
  case "Garlan": result = "Garland"
  case "Exdeth": result = "Exdeath"
  case "Gestal": result = "Gestahl"
  case "Vince":  result = "Vincent"
  case "Cait":   result = "Caitsith"
  case "Sefiro": result = "Sefiroth"
  case "Stiner": result = "Steiner"
  case "Amrant": result = "Amarant"
  case "Gaff":   result = "Gafgrion"
  case "Dracla": result = "Draclau"
  case "Darvon": result = "Daravon"
  case "Goltan": result = "Goltana"
  case "Wigraf": result = "Wiegraf"
  case "Bewulf": result = "Beowulf"
  case else:     result = short_name
 end select
 
 return result

end function


sub RandomizeNames(ignore_gender as Boolean, include_extras as Boolean)

 dim female_names as Deck
 dim male_names as Deck
 dim neutral_names as List
 dim all_names as Deck
 dim female_indexes as Set
 dim male_indexes as Set
 dim text as String
 dim gender as String
 dim temp_names as List
 dim current_name as String
 dim index as Integer
 dim new_message as String

 'Female names
 female_names.AddCard("Rydia")
 female_names.AddCard("Rosa")
 female_names.AddCard("Porom")
 female_names.AddCard("Anna")
 female_names.AddCard("Sheila")
 female_names.AddCard("Ursula")
 female_names.AddCard("Lenora")
 female_names.AddCard("Izayoi")
 female_names.AddCard("Harley")
 female_names.AddCard("Lucca")
 female_names.AddCard("Marle")
 female_names.AddCard("Ayla")
 female_names.AddCard("Nadia")
 female_names.AddCard("Leene")
 female_names.AddCard("Schala")
 female_names.AddCard("Sara")
 female_names.AddCard("Jane")
 female_names.AddCard("Matoya")
 female_names.AddCard("Arylon")
 female_names.AddCard("Daryll")
 female_names.AddCard("Maria")
 female_names.AddCard("Leila")
 female_names.AddCard("Refia")
 female_names.AddCard("Aria")
 female_names.AddCard("Lenna")
 female_names.AddCard("Faris")
 female_names.AddCard("Krile")
 female_names.AddCard("Stella")
 female_names.AddCard("Magisa")
 female_names.AddCard("Karnak")
 female_names.AddCard("Terra")
 female_names.AddCard("Celes")
 female_names.AddCard("Relm")
 female_names.AddCard("Madona")
 female_names.AddCard("Rachel")
 female_names.AddCard("Katrin")
 female_names.AddCard("Elayne")
 female_names.AddCard("Lola")
 female_names.AddCard("Tifa")
 female_names.AddCard("Aeris")
 female_names.AddCard("Yuffie")
 female_names.AddCard("Jenova")
 female_names.AddCard("Rinoa")
 female_names.AddCard("Selphy")
 female_names.AddCard("Qistis")
 female_names.AddCard("Edea")
 female_names.AddCard("Garnet")
 female_names.AddCard("Freya")
 female_names.AddCard("Eiko")
 female_names.AddCard("Betrix")
 female_names.AddCard("Brahne")
 female_names.AddCard("Yuna")
 female_names.AddCard("Lulu")
 female_names.AddCard("Rikku")
 female_names.AddCard("Paine")
 female_names.AddCard("Agrias")
 female_names.AddCard("Ovelia")
 female_names.AddCard("Reis")
 female_names.AddCard("Lavian")
 female_names.AddCard("Alicia")
 female_names.AddCard("Celia")
 female_names.AddCard("Lede")
 female_names.AddCard("Melia")
 female_names.AddCard("Rafa")
 female_names.AddCard("Alma")
 female_names.AddCard("Teta")
 female_names.AddCard("Ultima")
 
 male_names.AddCard("Cecil")
 male_names.AddCard("Kain")
 male_names.AddCard("Tellah")
 male_names.AddCard("Edward")
 male_names.AddCard("Yang")
 male_names.AddCard("Palom")
 male_names.AddCard("Cid")
 male_names.AddCard("Edge")
 male_names.AddCard("FuSoYa")
 male_names.AddCard("Golbez")
 male_names.AddCard("Ceodor")
 male_names.AddCard("Gekkou")
 male_names.AddCard("Zanget")
 male_names.AddCard("Tsuki")
 male_names.AddCard("Colman")
 male_names.AddCard("Crono")
 male_names.AddCard("Frog")
 male_names.AddCard("Robo")
 male_names.AddCard("Magus")
 male_names.AddCard("Glenn")
 male_names.AddCard("Kino")
 male_names.AddCard("Taban")
 male_names.AddCard("Ozzie")
 male_names.AddCard("Slash")
 male_names.AddCard("Flea")
 male_names.AddCard("Toma")
 male_names.AddCard("Smith")
 male_names.AddCard("Nerick")
 male_names.AddCard("Unne")
 male_names.AddCard("Lukhan")
 male_names.AddCard("Kope")
 male_names.AddCard("Garlan")
 male_names.AddCard("Bikke")
 male_names.AddCard("Astos")
 male_names.AddCard("Sarda")
 male_names.AddCard("Firion")
 male_names.AddCard("Guy")
 male_names.AddCard("Minwu")
 male_names.AddCard("Josef")
 male_names.AddCard("Gordon")
 male_names.AddCard("Ricard")
 male_names.AddCard("Leon")
 male_names.AddCard("Luneth")
 male_names.AddCard("Arc")
 male_names.AddCard("Ingus")
 male_names.AddCard("Desch")
 male_names.AddCard("Alus")
 male_names.AddCard("Butz")
 male_names.AddCard("Galuf")
 male_names.AddCard("Dorgan")
 male_names.AddCard("Kelger")
 male_names.AddCard("Xezat")
 male_names.AddCard("Tycoon")
 male_names.AddCard("Zok")
 male_names.AddCard("Forza")
 male_names.AddCard("Mid")
 male_names.AddCard("Exdeth")
 male_names.AddCard("Ghido")
 male_names.AddCard("Locke")
 male_names.AddCard("Edgar")
 male_names.AddCard("Sabin")
 male_names.AddCard("Cyan")
 male_names.AddCard("Shadow")
 male_names.AddCard("Gau")
 male_names.AddCard("Setzer")
 male_names.AddCard("Strago")
 male_names.AddCard("Mog")
 male_names.AddCard("Umaro")
 male_names.AddCard("Biggs")
 male_names.AddCard("Wedge")
 male_names.AddCard("Kefka")
 male_names.AddCard("Ultros")
 male_names.AddCard("Typhon")
 male_names.AddCard("Leo")
 male_names.AddCard("Banon")
 male_names.AddCard("Gestal")
 male_names.AddCard("Maduin")
 male_names.AddCard("Arvis")
 male_names.AddCard("Baram")
 male_names.AddCard("Draco")
 male_names.AddCard("Duane")
 male_names.AddCard("Duncan")
 male_names.AddCard("Owain")
 male_names.AddCard("Gungho")
 male_names.AddCard("Owzer")
 male_names.AddCard("Ralse")
 male_names.AddCard("Vargas")
 male_names.AddCard("Cloud")
 male_names.AddCard("Barret")
 male_names.AddCard("Vince")
 male_names.AddCard("Zack")
 male_names.AddCard("Red-13")
 male_names.AddCard("Cait")
 male_names.AddCard("Sefiro")
 male_names.AddCard("Rufus")
 male_names.AddCard("Hojo")
 male_names.AddCard("Squall")
 male_names.AddCard("Zell")
 male_names.AddCard("Irvine")
 male_names.AddCard("Seifer")
 male_names.AddCard("Laguna")
 male_names.AddCard("Zidane")
 male_names.AddCard("Vivi")
 male_names.AddCard("Stiner")
 male_names.AddCard("Amrant")
 male_names.AddCard("Kuja")
 male_names.AddCard("Tidus")
 male_names.AddCard("Auron")
 male_names.AddCard("Wakka")
 male_names.AddCard("Kimari")
 male_names.AddCard("Jecht")
 male_names.AddCard("Ramza")
 male_names.AddCard("Delita")
 male_names.AddCard("Algus")
 male_names.AddCard("Malak")
 male_names.AddCard("Olan")
 male_names.AddCard("Gaff")
 male_names.AddCard("Rad")
 male_names.AddCard("Vormav")
 male_names.AddCard("Islude")
 male_names.AddCard("Dracla")
 male_names.AddCard("Darvon")
 male_names.AddCard("Goltan")
 male_names.AddCard("Larg")
 male_names.AddCard("Zalbag")
 male_names.AddCard("Elmdor")
 male_names.AddCard("Orinas")
 male_names.AddCard("Gustav")
 male_names.AddCard("Wigraf")
 male_names.AddCard("Bewulf")
 male_names.AddCard("Rofel")
 male_names.AddCard("Ajora")
 
 neutral_names.Append("Syldra")
 neutral_names.Append("Gogo")
 neutral_names.Append("Kappa")
 neutral_names.Append("Kuku")
 neutral_names.Append("Kutan")
 neutral_names.Append("Kupan")
 neutral_names.Append("Kupek")
 neutral_names.Append("Kupop")
 neutral_names.Append("Kumama")
 neutral_names.Append("Kushu")
 neutral_names.Append("Kurin")
 neutral_names.Append("Kuru")
 neutral_names.Append("Kamog")
 neutral_names.Append("Quina")
 neutral_names.Append("Sin")

 for i as Integer = 1 to neutral_names.Length()
  if RollDie(2) = 1 then
   female_names.AddCard(neutral_names.ItemAt(i))
  else
   male_names.AddCard(neutral_names.ItemAt(i))
  end if
 next
 
 if ignore_gender then

  for i as Integer = 1 to female_names.Size()
   all_names.AddCard(female_names.Draw())
  next
  
  for i as Integer = 1 to male_names.Size()
   all_names.AddCard(male_names.Draw())
  next
  
  all_names.Shuffle()
  
  for i as Integer = 0 to total_names
   ff4.names(i) = ff4.ConvertText(all_names.Draw())
  next

 else

  female_names.Shuffle()
  male_names.Shuffle()

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
 
 ff4.ReplaceAll(ff4.ConvertText("Anna"), ff4.names(13), true)
 ff4.ReplaceAll(ff4.ConvertText("Golbez"), ff4.names(12), true)
 ff4.monsters(golbez_v_tellah_monster).name = ff4.names(12)
 ff4.monsters(golbez_monster).name = ff4.names(12)
 
 index = instr(ff4.bank1_messages(prologue_message).text, chr(name_code) + chr(0))
 ff4.bank1_messages(prologue_message).text = left(ff4.bank1_messages(prologue_message).text, index - 2) + mid(ff4.bank1_messages(prologue_message).text, index)
 index = instr(ff4.bank1_messages(prologue_message).text, ff4.ConvertText("And he and"))
 ff4.bank1_messages(prologue_message).text = left(ff4.bank1_messages(prologue_message).text, index - 2) + mid(ff4.bank1_messages(prologue_message).text, index)

 if include_extras then
 
  for i as Integer = 1 to female_names.Size()
   temp_names.Append(LongName(female_names.Draw()))
  next
  
  female_names.Destroy()
  for i as Integer = 1 to temp_names.Length()
   female_names.AddCard(temp_names.ItemAt(i))
  next
  
  temp_names.Destroy()
  for i as Integer = 1 to male_names.Size()
   temp_names.Append(LongName(male_names.Draw()))
  next
  
  male_names.Destroy()
  for i as Integer = 1 to temp_names.Length()
   male_names.AddCard(temp_names.ItemAt(i))
  next
  
  temp_names.Destroy()
  for i as Integer = 1 to all_names.Size()
   temp_names.Append(LongName(all_names.Draw()))
  next
  
  all_names.Destroy()
  for i as Integer = 1 to temp_names.Length()
   all_names.AddCard(temp_names.ItemAt(i))
  next
  
  female_names.AddCard("Valvalis")
  female_names.AddCard("Asura")
  female_names.AddCard("Sandy")
  female_names.AddCard("Cindy")
  female_names.AddCard("Mindy")
  female_names.AddCard("Luca")
  female_names.AddCard("Valmafra")
  
  male_names.AddCard("Milon")
  male_names.AddCard("Kainazzo")
  male_names.AddCard("Rubicant")
  male_names.AddCard("Baigan")
  male_names.AddCard("Zemus")
  male_names.AddCard("Leviatan")
  male_names.AddCard("Giott")
  male_names.AddCard("Lugae")
  male_names.AddCard("Balnab")
  male_names.AddCard("Bahamut")
  male_names.AddCard("KluYa")
  male_names.AddCard("Kory")
  male_names.AddCard("Odin")
  male_names.AddCard("Gilgmesh")
  male_names.AddCard("Mustadio")
  male_names.AddCard("Besrodio")
  male_names.AddCard("Dycedarg")
  male_names.AddCard("Kletian")
  male_names.AddCard("Funeral")
  male_names.AddCard("Balbanes")
  male_names.AddCard("Golagros")
  male_names.AddCard("Barinten")
  male_names.AddCard("Queklain")
  male_names.AddCard("Elidibus")
  male_names.AddCard("Velius")
  male_names.AddCard("Zalera")
  male_names.AddCard("Hashmal")
  male_names.AddCard("Adramelk")
  
  neutral_names.Append("Calbrena")
  neutral_names.Append("Zeromus")
  
  for i as Integer = 1 to neutral_names.Length()
   if RollDie(2) = 1 then
    female_names.AddCard(neutral_names.ItemAt(i))
   else
    male_names.AddCard(neutral_names.ItemAt(i))
   end if
  next
  
  if ignore_gender then
   for i as Integer = 1 to female_names.Size()
    all_names.AddCard(female_names.Draw())
   next
   for i as Integer = 1 to male_names.Size()
    all_names.AddCard(male_names.Draw())
   next
   all_names.Shuffle()
  else
   female_names.Shuffle()
   male_names.Shuffle()
  end if
  
  current_name = ff4.ConvertText(iif(ignore_gender, all_names.Draw(), female_names.Draw()))
  ff4.ReplaceAll(ff4.ConvertText("Valvalis"), current_name, true)
  ff4.monsters(valvalis_monster).name = current_name
  current_name = ff4.ConvertText(iif(ignore_gender, all_names.Draw(), female_names.Draw()))
  ff4.ReplaceAll(ff4.ConvertText("Asura"), current_name, true)
  ff4.monsters(asura_monster).name = current_name
  ff4.spells(asura_spell).name = summon_symbol + left(current_name, 5)
  current_name = ff4.ConvertText(iif(ignore_gender, all_names.Draw(), female_names.Draw()))
  ff4.ReplaceAll(ff4.ConvertText("Sandy"), current_name, true)
  ff4.monsters(sandy_monster).name = current_name
  current_name = ff4.ConvertText(iif(ignore_gender, all_names.Draw(), female_names.Draw()))
  ff4.ReplaceAll(ff4.ConvertText("Cindy"), current_name, true)
  ff4.monsters(cindy_monster).name = current_name
  current_name = ff4.ConvertText(iif(ignore_gender, all_names.Draw(), female_names.Draw()))
  ff4.ReplaceAll(ff4.ConvertText("Mindy"), current_name, true)
  ff4.monsters(mindy_monster).name = current_name
  current_name = ff4.ConvertText(iif(ignore_gender, all_names.Draw(), female_names.Draw()))
  ff4.ReplaceAll(ff4.ConvertText("Luca"), current_name, true)
  ff4.items(luca_key_item).name = key_symbol + current_name
  current_name = ff4.ConvertText(iif(ignore_gender, all_names.Draw(), male_names.Draw()))
  ff4.ReplaceAll(ff4.ConvertText("Milon"), current_name, true)
  ff4.monsters(milon_monster).name = current_name
  ff4.monsters(milon_z_monster).name = iif(len(current_name) > 7, left(current_name, 7), current_name + space_symbol) + ff4.ConvertText("Z")
  current_name = ff4.ConvertText(iif(ignore_gender, all_names.Draw(), male_names.Draw()))
  ff4.ReplaceAll(ff4.ConvertText("Kainazzo"), current_name, true)
  ff4.monsters(kainazzo_monster).name = current_name
  current_name = ff4.ConvertText(iif(ignore_gender, all_names.Draw(), male_names.Draw()))
  ff4.ReplaceAll(ff4.ConvertText("Rubicant"), current_name, true)
  ff4.monsters(rubicant_monster).name = current_name
  current_name = ff4.ConvertText(iif(ignore_gender, all_names.Draw(), male_names.Draw()))
  ff4.ReplaceAll(ff4.ConvertText("Baigan"), current_name, true)
  ff4.monsters(baigan_monster).name = current_name
  current_name = ff4.ConvertText(iif(ignore_gender, all_names.Draw(), male_names.Draw()))
  ff4.ReplaceAll(ff4.ConvertText("Zemus"), current_name, true)
  ff4.monsters(zemus_monster).name = current_name
  current_name = ff4.ConvertText(iif(ignore_gender, all_names.Draw(), male_names.Draw()))
  ff4.ReplaceAll(ff4.ConvertText("Leviatan"), current_name, true)
  ff4.monsters(leviatan_monster).name = current_name
  ff4.spells(levia_spell).name = summon_symbol + left(current_name, 5)
  current_name = ff4.ConvertText(iif(ignore_gender, all_names.Draw(), male_names.Draw()))
  ff4.ReplaceAll(ff4.ConvertText("Giott"), current_name, true)
  current_name = ff4.ConvertText(iif(ignore_gender, all_names.Draw(), male_names.Draw()))
  ff4.ReplaceAll(ff4.ConvertText("Lugae"), current_name, true)
  ff4.monsters(lugae_small_monster).name = current_name
  ff4.monsters(lugae_monster).name = current_name
  current_name = ff4.ConvertText(iif(ignore_gender, all_names.Draw(), male_names.Draw()))
  ff4.ReplaceAll(ff4.ConvertText("Balnab"), current_name, true)
  ff4.monsters(balnab_monster).name = current_name
  ff4.monsters(balnab_z_monster).name = iif(len(current_name) > 7, left(current_name, 7), current_name + space_symbol) + ff4.ConvertText("Z")
  current_name = ff4.ConvertText(iif(ignore_gender, all_names.Draw(), male_names.Draw()))
  ff4.ReplaceAll(ff4.ConvertText("Bahamut"), current_name, true)
  ff4.monsters(bahamut_monster).name = current_name
  ff4.spells(baham_spell).name = summon_symbol + left(current_name, 5)
  current_name = ff4.ConvertText(iif(ignore_gender, all_names.Draw(), male_names.Draw()))
  ff4.ReplaceAll(ff4.ConvertText("KluYa"), current_name, true)
  current_name = ff4.ConvertText(iif(ignore_gender, all_names.Draw(), male_names.Draw()))
  ff4.ReplaceAll(ff4.ConvertText("Kory"), current_name, true)
  current_name = ff4.ConvertText(iif(ignore_gender, all_names.Draw(), male_names.Draw()))
  ff4.ReplaceAll(ff4.ConvertText("Odin"), current_name, true)
  ff4.monsters(odin_monster).name = current_name
  ff4.spells(odin_spell).name = summon_symbol + left(current_name, 5)
  current_name = ff4.ConvertText(iif(ignore_gender, all_names.Draw(), male_names.Draw()))
  ff4.ReplaceAll(ff4.ConvertText("Chamberlain"), current_name, true)

  if not ignore_gender then
   for i as Integer = 1 to female_names.Size()
    all_names.AddCard(female_names.Draw())
   next
   for i as Integer = 1 to male_names.Size()
    all_names.AddCard(male_names.Draw())
   next
   all_names.Shuffle()
  end if

  current_name = ff4.ConvertText(all_names.Draw())
  ff4.ReplaceAll(ff4.ConvertText("Calbrena"), current_name, true)
  ff4.monsters(calbrena_monster).name = current_name
  current_name = ff4.ConvertText(all_names.Draw())
  ff4.ReplaceAll(ff4.ConvertText("Zeromus"), current_name, true)
  ff4.monsters(zeromus_shroud_monster).name = current_name
  ff4.monsters(zeromus_monster).name = current_name
  ff4.monsters(zeromus_cutscene_monster).name = current_name
  
  ff4.ReplaceAll(ff4.ConvertText("' "), ff4.ConvertText("'s "))
  ff4.ReplaceAll(ff4.ConvertText("s's"), ff4.ConvertText("s'"))
  
 end if
 
end sub
