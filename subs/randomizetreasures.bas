sub RandomizeTreasures(include_dummy as Boolean, balance as Boolean)

 dim t as Trigger ptr
 dim weapons(7) as Spinner
 dim armors(7) as Spinner
 dim common_tools as Spinner
 dim rare_tools as Spinner
 dim spot_heals as Spinner
 dim potions as Spinner
 dim link as MetaItem ptr
 dim tier as UByte
 dim roll as Integer

 if balance then
 
  for i as Integer = ff4.weapons_range.start + 1 to ff4.weapons_range.finish
   link = itemlist.PointerAt(i)
   if cbool(i <> excalipur_item) or include_dummy then
    weapons(link->level).AddSide(chr(i))
   end if
  next
  
  for i as Integer = ff4.armors_range.start + 1 to ff4.armors_range.finish
   link = itemlist.PointerAt(i)
   armors(link->level).AddSide(chr(i))
  next
  
  for i as Integer = bomb_fragment_item to silver_hourglass_item
   common_tools.AddSide(chr(i))
  next
  common_tools.RemoveSide(chr(stardust_item))
  common_tools.AddSide(chr(silk_web_item))
  common_tools.AddSide(chr(scape_doll_item))
  common_tools.AddSide(chr(kamikaze_item))
  common_tools.AddSide(chr(silence_bell_item))
  common_tools.AddSide(chr(bestiary_item))
  common_tools.AddSide(chr(emergency_exit_item))
  common_tools.AddSide(chr(dwarf_bread_item))
  common_tools.AddSide(chr(carrot_item))
  
  rare_tools.AddSide(chr(stardust_item))
  rare_tools.AddSide(chr(golden_hourglass_item))
  rare_tools.AddSide(chr(red_fang_item))
  rare_tools.AddSide(chr(white_fang_item))
  rare_tools.AddSide(chr(blue_fang_item))
  rare_tools.AddSide(chr(light_curtain_item))
  rare_tools.AddSide(chr(lunar_curtain_item))
  rare_tools.AddSide(chr(earth_drum_item))
  rare_tools.AddSide(chr(coeurl_whisker_item))
  rare_tools.AddSide(chr(grimoire_item))
  rare_tools.AddSide(chr(alert_item))
  rare_tools.AddSide(chr(golden_apple_item))
  rare_tools.AddSide(chr(silver_apple_item))
  rare_tools.AddSide(chr(soma_drop_item))
  rare_tools.AddSide(chr(magazine_item))
  rare_tools.AddSide(chr(imp_summon_item))
  rare_tools.AddSide(chr(bomb_summon_item))
  rare_tools.AddSide(chr(cockatrice_summon_item))
  rare_tools.AddSide(chr(mindflayer_summon_item))
  rare_tools.AddSide(chr(pass_item))
  rare_tools.AddSide(chr(whistle_item))

  spot_heals.AddSide(chr(alarm_clock_item))
  spot_heals.AddSide(chr(unicorn_horn_item))
  for i as Integer = gold_pin_item to cross_item
   spot_heals.AddSide(chr(i))
  next

  for i as Integer = 0 to total_maps
   for j as Integer = 1 to ff4.maps(i).triggers.Length()
    tier = MapTier(i)
    t = ff4.maps(i).triggers.PointerAt(j)
    if t->treasure then
     if cbool(RollDie(tier * 10) = 1) and not t->trapped then
      t->gil = true
      select case tier
       case 1: t->contents = Min(Min(RollDie(&h7F), RollDie(&h7F)), Min(RollDie(&h7F), RollDie(&h7F)))
       case 2: t->contents = Min(RollDie(&h7F), Min(RollDie(&h7F), RollDie(&h7F)))
       case 3: t->contents = Min(RollDie(&h7F), RollDie(&h7F))
       case 4: t->contents = RollDie(&h7F)
       case 5: t->contents = &h80 + Min(RollDie(&h7F), Min(RollDie(&h7F), RollDie(&h7F)))
       case 6: t->contents = &h80 + Min(RollDie(&h7F), RollDie(&h7F))
      end select
     else
      t->gil = false
      if t->trapped then
       if RollDie(3) = 1 then
        t->contents = asc(weapons(tier + 1).Spin())
       else
        t->contents = asc(armors(tier + 1).Spin())
       end if
      else
       roll = RollDie(10)
       if roll = 1 then
        t->contents = asc(weapons(tier).Spin())
       elseif roll = 2 or roll = 3 then
        t->contents = asc(armors(tier).Spin())
       elseif include_dummy and cbool(roll >= 4) and cbool(roll <= 6) then
        if RollDie(2 ^ (7 - tier)) = 1 then
         t->contents = asc(rare_tools.Spin())
        else
         t->contents = asc(common_tools.Spin())
        end if
       else
        if RollDie(40 - 5 * tier) = 1 then
         t->contents = elixir_item
        else
         select case RollDie(6)
          case 1 'Phoenix Down
           t->contents = life_item
          case 2 'Shelter
           if tier <= 3 then
            t->contents = tent_item 
           else
            t->contents = cabin_item
           end if
          case 3 'Status heal
           if cbool(RollDie(100) <= 10 + (tier - 1) * 40) or not include_dummy then
            t->contents = heal_item
           else
            t->contents = asc(spot_heals.Spin()) - 1
           end if
          case 4 'MP potion
           if RollDie(100) <= (tier - 1) * 20 then
            t->contents = ether2_item
           else
            t->contents = ether1_item
           end if
          case 5, 6 'HP potion
           select case RollDie(5) + (tier - 1) * 2
            case 1 to 5: t->contents = cure1_item
            case 6 to 10: t->contents = cure2_item
            case else: t->contents = cure3_item
           end select
         end select
        end if
       end if
      end if
     end if
    end if
   next
  next

 else 'so balance is false
 
  for i as Integer = 1 to 95
   weapons(1).AddSide(chr(i))
  next
  
  for i as Integer = 97 to 175
   armors(1).AddSide(chr(i))
  next
  
  potions.AddSide(chr(cure1_item))
  potions.AddSide(chr(cure2_item))
  potions.AddSide(chr(cure3_item))
  potions.AddSide(chr(ether1_item))
  potions.AddSide(chr(ether2_item))
  potions.AddSide(chr(elixir_item))
  potions.AddSide(chr(heal_item))
  potions.AddSide(chr(life_item))
  potions.AddSide(chr(tent_item))
  potions.AddSide(chr(cabin_item))
 
  for i as Integer = 0 to total_maps
   for j as Integer = 1 to ff4.maps(i).triggers.Length()
    t = ff4.maps(i).triggers.PointerAt(j)
    if t->treasure then
     if not t->trapped and cbool(RollDie(20) = 1) then
      t->gil = true
      t->contents = Min(Min(RollDie(&h7F), RollDie(&h7F)), Min(RollDie(&h7F), RollDie(&h7F)))
     else
      t->gil = false
      select case RollDie(10)
       case 1
        t->contents = asc(weapons(1).Spin())
       case 2, 3
        t->contents = asc(armors(1).Spin())
       case else
        t->contents = asc(potions.Spin())
      end select
     end if
    end if
   next
  next
  
 end if
 
end sub
