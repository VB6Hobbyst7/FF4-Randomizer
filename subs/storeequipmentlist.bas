sub StoreEquipmentList()

 dim link as MetaItem ptr
 
 for i as Integer = 1 to itemlist.Length()
  link = itemlist.PointerAt(i)
  ff4.items(i) = link->itemdata
  'if ff4.armors_range.InRange(i) then print ff4.items(i).equip_code
 next

end sub
