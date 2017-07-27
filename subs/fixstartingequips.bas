sub FixStartingEquips(balance as Boolean)

 dim tier as Integer
 dim weapon_deck(7) as Deck
 dim bow_deck(7) as Deck
 dim shield_deck(7) as Deck
 dim head_deck(7) as Deck
 dim body_deck(7) as Deck
 dim arms_deck(7) as Deck
 dim usable_items as List
 dim item_index as UByte
 dim link as MetaItem ptr
 dim itemtier as Integer
 
 for actor_index as Integer = 0 to total_actors
 
  if actor_index <> tellah3_actor then
  
   'Strip the actor
   ff4.Unequip(actor_index)
   
   'Figure out what tier the actor should be
   if balance then
    select case actor_index
     case dk_actor to rosa1_actor
      tier = 1
     case yang1_actor to porom_actor
      tier = 2
     case tellah2_actor to rosa2_actor
      tier = 3
     case adult_rydia_actor, edge_actor
      tier = 4
     case fusoya_actor
      tier = 5
     case kain3_actor
      tier = 6
    end select
   else
    tier = 1
   end if
   
   'Reset the decks
   for i as Integer = 1 to 7
    weapon_deck(i).Destroy()
    bow_deck(i).Destroy()
    shield_deck(i).Destroy()
    head_deck(i).Destroy()
    body_deck(i).Destroy()
    arms_deck(i).Destroy()
   next
   
   'Get the list of everything the actor can equip
   usable_items = ff4.ItemsUsableByActor(actor_index)
   
   'Sort it out into equip slots and tiers
   ' Keep a special deck for bows
   for i as Integer = 1 to usable_items.Length()
    item_index = asc(usable_items.ItemAt(i))
    if item_index <> no_weapon_item and item_index <> no_armor_item then
     link = itemlist.PointerAt(item_index)
     itemtier = iif(balance, link->level, 1)
     if ff4.bow_range.InRange(item_index) then
      bow_deck(itemtier).AddCard(chr(item_index))
     elseif ff4.weapons_range.InRange(item_index) then
      weapon_deck(itemtier).AddCard(chr(item_index))
     elseif ff4.shield_range.InRange(item_index) then
      shield_deck(itemtier).AddCard(chr(item_index))
     elseif ff4.head_range.InRange(item_index) then
      head_deck(itemtier).AddCard(chr(item_index))
     elseif ff4.body_range.InRange(item_index) then
      body_deck(itemtier).AddCard(chr(item_index))
     elseif ff4.arms_range.InRange(item_index) then
      arms_deck(itemtier).AddCard(chr(item_index))
     end if
    end if
   next
   
   'Shuffle the decks
   for i as Integer = 1 to 7
    weapon_deck(i).Shuffle()
    bow_deck(i).Shuffle()
    shield_deck(i).Shuffle()
    head_deck(i).Shuffle()
    body_deck(i).Shuffle()
    arms_deck(i).Shuffle()
   next
   
   'See if there are any weapons of the correct tier
   ' If not, see if there are any weapons of the tier below
   '  If not, see if there are any weapons of the tier above
   '   If not, tough luck; no weapon for you
   if weapon_deck(tier).Size() = 0 then
    if weapon_deck(tier - 1).Size() = 0 then
     if weapon_deck(tier + 1).Size() = 0 then
      itemtier = 0
     else
      itemtier = tier + 1
     end if
    else
     itemtier = tier - 1
    end if
   else
    itemtier = tier
   end if
       
   'Select a random weapon
   if itemtier > 0 then
    item_index = asc(weapon_deck(itemtier).Draw())
   else
    item_index = 0
   end if
   
   'If the weapon was an arrow
   ' See if there is a bow of the current tier
   '  If not, see if there is a bow in the tier below
   '   If not, see if there is a bow in the tier above
   '    If not, select a non-arrow weapon
   '     If there are none, tough luck; no weapon for you
   ' If a bow was successfully selected, give it to the actor along with the arrow
   'Give the actor the selected weapon
   if ff4.arrow_range.InRange(item_index) then
    if bow_deck(tier).Size() = 0 then
     if bow_deck(tier - 1).Size() = 0 then
      if bow_deck(tier + 1).Size() = 0 then
       if weapon_deck(itemtier).Size() = 0 then
        item_index = 0
       else
        do until cbool(weapon_deck(itemtier).Size() = 0) or not ff4.arrow_range.InRange(item_index)
         item_index = asc(weapon_deck(itemtier).Draw())
        loop
       end if
      else
       ff4.Equip(actor_index, item_index)
       ff4.Equip(actor_index, asc(bow_deck(tier + 1).Draw()))
      end if
     else
      ff4.Equip(actor_index, item_index)
      ff4.Equip(actor_index, asc(bow_deck(tier - 1).Draw()))
     end if
    else
     ff4.Equip(actor_index, item_index)
     ff4.Equip(actor_index, asc(bow_deck(tier).Draw()))
    end if
   else
    ff4.Equip(actor_index, item_index)
   end if
   
   'If the weapon wasn't an arrow and wasn't two-handed, give the actor an off-hand item
   ' If the actor is ambidextrous, give it a weapon (non-arrow)
   ' Otherwise, if the actor can use shields, give it a shield most of the time
   if not ff4.arrow_range.InRange(item_index) and not ff4.two_handed_range.InRange(item_index) then
    if ff4.ActorHandedness(actor_index) = "Both" then
     weapon_deck(itemtier).AddCard(chr(item_index))
     weapon_deck(itemtier).Shuffle()
     item_index = asc(weapon_deck(itemtier).Draw())
     do while ff4.arrow_range.InRange(item_index) and cbool(weapon_deck(itemtier).Size() > 0)
      item_index = asc(weapon_deck(itemtier).Draw())
     loop
     if ff4.arrow_range.InRange(item_index) then item_index = 0
     ff4.Equip(actor_index, item_index)
    elseif shield_deck(tier).Size() > 0 and RollDie(10) > 1 then
     ff4.Equip(actor_index, asc(shield_deck(tier).Draw()))
    end if
   end if
   
   'Give the actor a random head gear most of the time
   if head_deck(tier).Size() > 0 and RollDie(10) > 1 then
    ff4.Equip(actor_index, asc(head_deck(tier).Draw()))
   end if
   
   'See if there are any body items of the correct tier
   ' If not, see if there are any body items of the tier below
   '  If not, see if there are any body items of the tier above
   '   If not, tough luck; no body item for you
   if body_deck(tier).Size() = 0 then
    if body_deck(tier - 1).Size() = 0 then
     if body_deck(tier + 1).Size() = 0 then
      itemtier = 0
     else
      itemtier = tier + 1
     end if
    else
     itemtier = tier - 1
    end if
   else
    itemtier = tier
   end if
   
   'Give the actor a random body item
   if itemtier > 0 then
    ff4.Equip(actor_index, asc(body_deck(itemtier).Draw()))
   end if
   
   'Give the actor a random arms item most of the time
   if arms_deck(tier).Size() > 0 and RollDie(10) > 1 then
    ff4.Equip(actor_index, asc(arms_deck(tier).Draw()))
   end if
   
  end if
  
 next

end sub
