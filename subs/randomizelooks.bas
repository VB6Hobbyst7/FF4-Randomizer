sub RandomizeLooks()

 dim walkable_range as Range
 dim original_sprites as List
 dim new_sprites as List
 dim sprites_deck as Deck
 
 walkable_range.start = mini_sprite
 walkable_range.finish = luca_sprite
 
 for i as Integer = walkable_range.start to walkable_range.finish
  original_sprites.Append(chr(i))
  sprites_deck.AddCard(chr(i))
 next
 sprites_deck.Shuffle()
 do while sprites_deck.Size() > 0
  new_sprites.Append(sprites_deck.Draw())
 loop

 for i as Integer = 0 to total_npcs
  if walkable_range.InRange(ff4.npcs(i).sprite) then
   ff4.npcs(i).sprite = asc(new_sprites.ItemAt(original_sprites.IndexOf(chr(ff4.npcs(i).sprite))))
  end if
 next
 

end sub
