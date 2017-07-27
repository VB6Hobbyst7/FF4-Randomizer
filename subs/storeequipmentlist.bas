sub StoreEquipmentList()

 dim link as MetaItem ptr
 
 for i as Integer = 1 to itemlist.Length()
  link = itemlist.PointerAt(i)
  ff4.items(i) = link->itemdata
 next

end sub
