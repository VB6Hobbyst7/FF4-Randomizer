sub RandomizeShops(include_dummy as Boolean, balance as Boolean)

 dim weapons_deck(7) as Deck
 dim armors_deck(7) as Deck
 dim supplies_deck(3) as Deck
 dim link as MetaItem ptr
 dim tier as Integer
 dim total_wares as Integer
 dim weapons_part as Integer

 for i as Integer = 0 to 30
  ff4.EmptyShop(i)
 next
 
 for i as Integer = 1 to ff4.weapons_range.finish
  link = itemlist.PointerAt(i)
  tier = link->level
  weapons_deck(tier).AddCard(chr(i))
  weapons_deck(0).AddCard(chr(i))
 next
 
 for i as Integer = ff4.armors_range.start + 1 to ff4.armors_range.finish
  link = itemlist.PointerAt(i)
  tier = link->level
  armors_deck(tier).AddCard(chr(i))
  armors_deck(0).AddCard(chr(i))
 next

 supplies_deck(1).AddCard(chr(cure1_item))
 supplies_deck(1).AddCard(chr(ether1_item))
 supplies_deck(1).AddCard(chr(tent_item))
 supplies_deck(1).AddCard(chr(life_item))
 supplies_deck(1).AddCard(chr(carrot_item))
 if include_dummy then
  for i as Integer = gold_pin_item to cross_item
   supplies_deck(1).AddCard(chr(i))
  next
 else
  supplies_deck(1).AddCard(chr(heal_item))
 end if
 
 supplies_deck(2).AddCard(chr(cure2_item))
 supplies_deck(2).AddCard(chr(heal_item))
 supplies_deck(2).AddCard(chr(cabin_item))
 supplies_deck(2).AddCard(chr(cure1_item))
 supplies_deck(2).AddCard(chr(ether1_item))
 supplies_deck(2).AddCard(chr(tent_item))
 supplies_deck(2).AddCard(chr(life_item))
 supplies_deck(2).AddCard(chr(carrot_item))
 
 supplies_deck(3).AddCard(chr(cure3_item))
 supplies_deck(3).AddCard(chr(ether2_item))
 supplies_deck(3).AddCard(chr(elixir_item))
 supplies_deck(3).AddCard(chr(cabin_item))
 supplies_deck(3).AddCard(chr(life_item))
 supplies_deck(3).AddCard(chr(heal_item))
 supplies_deck(3).AddCard(chr(whistle_item))
 supplies_deck(3).AddCard(chr(cure2_item))
 
 for i as Integer = cure1_item to heal_item
  if include_dummy or cbool(i < gold_pin_item) or cbool(i > cross_item) then
   supplies_deck(0).AddCard(chr(i))
  end if
 next
 supplies_deck(0).AddCard(chr(tent_item))
 supplies_deck(0).AddCard(chr(cabin_item))
 supplies_deck(0).AddCard(chr(whistle_item))
 
 for i as Integer = 0 to 7
  weapons_deck(i).Shuffle()
  armors_deck(i).Shuffle()
  if i <= 3 then
   supplies_deck(i).Shuffle()
  end if
 next
 
 for shop_index as Integer = 0 to 30
  if balance then
   select case shop_index
    case 0, 10, 19
     tier = 1
    case 1, 2, 3, 11, 20, 21, 24, 25, 30
     tier = 2
    case 4, 5, 12, 13, 14, 22, 23, 26, 27, 18
     tier = 3
    case 6, 7, 15, 16
     tier = 4
    case 8, 17, 28, 29
     tier = 5
    case 9
     tier = 6
   end select
  else
   tier = 0
  end if
  select case shop_index
   case 0, 2 to 9, 22, 26, 28
    total_wares = RollDice(4, 2)
    for i as Integer = 1 to total_wares
     ff4.AddStock(shop_index, asc(weapons_deck(tier).Draw()))
    next
    for i as Integer = 1 to total_wares
     weapons_deck(tier).AddCard(chr(ff4.shops(shop_index).wares(i)))
    next
    weapons_deck(tier).Shuffle()
   case 10 to 17, 23, 27, 29
    total_wares = RollDice(4, 2)
    for i as Integer = 1 to total_wares
     ff4.AddStock(shop_index, asc(armors_deck(tier).Draw()))
    next
    for i as Integer = 1 to total_wares
     armors_deck(tier).AddCard(chr(ff4.shops(shop_index).wares(i)))
    next
    armors_deck(tier).Shuffle()
   case 1
    total_wares = RollDie(4)
    for i as Integer = 1 to total_wares
     ff4.AddStock(shop_index, asc(weapons_deck(tier).Draw()))
    next
    for i as Integer = 1 to total_wares
     weapons_deck(tier).AddCard(chr(ff4.shops(shop_index).wares(i)))
    next
    weapons_deck(tier).Shuffle()
    weapons_part = total_wares
    total_wares = RollDie(4)
    for i as Integer = 1 to total_wares
     ff4.AddStock(shop_index, asc(armors_deck(tier).Draw()))
    next
    for i as Integer = weapons_part + 1 to weapons_part + total_wares
     armors_deck(tier).AddCard(chr(ff4.shops(shop_index).wares(i)))
    next
    armors_deck(tier).Shuffle()
   case else
    total_wares = Max(Max(RollDie(8), RollDie(8)), RollDie(8))
    for i as Integer = 1 to total_wares
     ff4.AddStock(shop_index, asc(supplies_deck(tier).Draw()))
     if supplies_deck(tier).Size() = 0 then
      total_wares = i
      exit for
     end if
    next
    for i as Integer = 1 to total_wares
     supplies_deck(tier).AddCard(chr(ff4.shops(shop_index).wares(i)))
    next
    supplies_deck(tier).Shuffle()
  end select    
 next

end sub
