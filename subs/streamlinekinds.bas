sub StreamlineKinds(female_preserve as Boolean)

 dim link as MetaItem ptr

 'Change the equip codes of the items based on their kind 
 for i as Integer = 1 to itemlist.Length()
  link = itemlist.PointerAt(i)
  if link->female and female_preserve then
   link->itemdata.equip_code = 1
  elseif link->universal then
   link->itemdata.equip_code = 0
  else
   select case link->kind
    case "Dark":      link->itemdata.equip_code = 2
    case "Holy":      link->itemdata.equip_code = 3
    case "Claw":      link->itemdata.equip_code = 4
    case "Rod":       link->itemdata.equip_code = 5
    case "Staff":     link->itemdata.equip_code = 6
    case "Sword":     link->itemdata.equip_code = 7
    case "Spear":     link->itemdata.equip_code = 8
    case "Katana":    link->itemdata.equip_code = 9
    case "Knife":     link->itemdata.equip_code = 10
    case "Whip":      link->itemdata.equip_code = 11
    case "Axe":       link->itemdata.equip_code = 12
    case "Star":      link->itemdata.equip_code = 31
    case "Boomerang": link->itemdata.equip_code = 13
    case "Harp":      link->itemdata.equip_code = 14
    case "Hammer":    link->itemdata.equip_code = 15
    case "Bow":       link->itemdata.equip_code = 16
    case "Arrow":     link->itemdata.equip_code = 16
    case "Shield":    link->itemdata.equip_code = 17
    case "Helm":      link->itemdata.equip_code = 18
    case "Hat":       link->itemdata.equip_code = 19
    case "Mail":      link->itemdata.equip_code = 20
    case "Vest":      link->itemdata.equip_code = 21
    case "Robe":      link->itemdata.equip_code = 22
    case "Gauntlet":  link->itemdata.equip_code = 23
    case "Ring":      link->itemdata.equip_code = 24
   end select
  end if
 next
 
 'Update the equip charts to correspond to who should normally be able to equip
 ' what kinds of items
 
 for i as Integer = 0 to total_jobs
  ff4.equipcharts(0).flags(i) = true
  for j as Integer = 1 to total_equip_charts
   ff4.equipcharts(j).flags(i) = false
  next
 next
 
 ff4.equipcharts(1).flags(young_caller_job) = true
 ff4.equipcharts(1).flags(adult_caller_job) = true
 ff4.equipcharts(1).flags(archer_job) = true
 ff4.equipcharts(1).flags(white_wiz_job) = true
 
 ff4.equipcharts(2).flags(dark_knight_job) = true
 
 ff4.equipcharts(3).flags(paladin_job) = true
 
 ff4.equipcharts(4).flags(karate_job) = true
 ff4.equipcharts(4).flags(ninja_job) = true
 
 ff4.equipcharts(5).flags(young_caller_job) = true
 ff4.equipcharts(5).flags(adult_caller_job) = true
 ff4.equipcharts(5).flags(sage_job) = true
 ff4.equipcharts(5).flags(lunar_job) = true
 ff4.equipcharts(5).flags(black_wiz_job) = true
 
 ff4.equipcharts(6).flags(young_caller_job) = true
 ff4.equipcharts(6).flags(sage_job) = true
 ff4.equipcharts(6).flags(archer_job) = true
 ff4.equipcharts(6).flags(white_wiz_job) = true
 ff4.equipcharts(6).flags(paladin_job) = true
 ff4.equipcharts(6).flags(lunar_job) = true
 
 ff4.equipcharts(7).flags(dragoon_job) = true
 ff4.equipcharts(7).flags(paladin_job) = true
 
 ff4.equipcharts(8).flags(dragoon_job) = true
 
 ff4.equipcharts(9).flags(ninja_job) = true
 
 ff4.equipcharts(10).flags(dragoon_job) = true
 ff4.equipcharts(10).flags(young_caller_job) = true
 ff4.equipcharts(10).flags(bard_job) = true
 ff4.equipcharts(10).flags(black_wiz_job) = true
 ff4.equipcharts(10).flags(paladin_job) = true
 ff4.equipcharts(10).flags(adult_caller_job) = true
 ff4.equipcharts(10).flags(ninja_job) = true
 
 ff4.equipcharts(11).flags(young_caller_job) = true
 ff4.equipcharts(11).flags(adult_caller_job) = true
 
 ff4.equipcharts(12).flags(dragoon_job) = true
 ff4.equipcharts(12).flags(paladin_job) = true
 ff4.equipcharts(12).flags(chief_job) = true
 
 ff4.equipcharts(13).flags(ninja_job) = true
 
 ff4.equipcharts(14).flags(bard_job) = true
 
 ff4.equipcharts(15).flags(chief_job) = true
 
 ff4.equipcharts(16).flags(young_caller_job) = true
 ff4.equipcharts(16).flags(bard_job) = true
 ff4.equipcharts(16).flags(archer_job) = true
 ff4.equipcharts(16).flags(black_wiz_job) = true
 ff4.equipcharts(16).flags(white_wiz_job) = true
 ff4.equipcharts(16).flags(paladin_job) = true
 ff4.equipcharts(16).flags(chief_job) = true
 ff4.equipcharts(16).flags(adult_caller_job) = true
 ff4.equipcharts(16).flags(lunar_job) = true
 
 ff4.equipcharts(17).flags(dragoon_job) = true
 ff4.equipcharts(17).flags(paladin_job) = true
 ff4.equipcharts(17).flags(chief_job) = true
 
 ff4.equipcharts(18).flags(dragoon_job) = true
 ff4.equipcharts(18).flags(paladin_job) = true
 ff4.equipcharts(18).flags(chief_job) = true

 for i as Integer = 0 to usable_jobs 
  ff4.equipcharts(19).flags(i) = true
 next
 
 ff4.equipcharts(20).flags(dragoon_job) = true
 ff4.equipcharts(20).flags(paladin_job) = true
 ff4.equipcharts(20).flags(chief_job) = true
 
 for i as Integer = 0 to usable_jobs 
  ff4.equipcharts(21).flags(i) = true
 next
 
 ff4.equipcharts(22).flags(young_caller_job) = true
 ff4.equipcharts(22).flags(sage_job) = true
 ff4.equipcharts(22).flags(archer_job) = true
 ff4.equipcharts(22).flags(black_wiz_job) = true
 ff4.equipcharts(22).flags(white_wiz_job) = true
 ff4.equipcharts(22).flags(paladin_job) = true
 ff4.equipcharts(22).flags(adult_caller_job) = true
 ff4.equipcharts(22).flags(lunar_job) = true
 
 ff4.equipcharts(23).flags(dragoon_job) = true
 ff4.equipcharts(23).flags(paladin_job) = true
 ff4.equipcharts(23).flags(chief_job) = true
 ff4.equipcharts(23).flags(ninja_job) = true
 
 for i as Integer = 0 to usable_jobs 
  ff4.equipcharts(24).flags(i) = true
 next
 
end sub
