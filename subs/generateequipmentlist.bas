sub GenerateEquipmentList()

 dim link as MetaItem ptr
 
 for i as Integer = 1 to total_items
  
  link = callocate(SizeOf(MetaItem))
  link->itemdata = ff4.items(i)
  
  select case i
   'The first tier is from the beginning of the game to Mt. Hobs
   case rod_item, ice_rod_item, staff_item, shadow_sword_item, _
        darkness_sword_item, spear_item, dreamer_harp_item, charm_harp_item, _
        bow_item, crossbow_item, iron_arrows_item, white_arrows_item, _
        iron_shield_item, shadow_shield_item, iron_helm_item, _
        shadow_helm_item, darkness_helm_item, cap_item, leather_hat_item, _
        iron_armor_item, shadow_armor_item, darkness_armor_item, cloth_item, _
        leather_vest_item, prisoner_item, bard_robe_item, iron_gauntlet_item, _
        shadow_gauntlet_item, darkness_gauntlet_item, iron_ring_item, _
        ruby_ring_item
    link->level = 1
   'The second tier is from Fabul to the Sewer
   case fire_claw_item, ice_claw_item, thunder_claw_item, flame_rod_item, _
        cure_staff_item, black_sword_item, legend_sword_item, _
        ancient_sword_item, silver_knife_item, wooden_hammer_item, _
        avenger_item, black_shield_item, paladin_shield_item, _
        black_helm_item, paladin_helm_item, gaea_hat_item, headband_item, _
        black_armor_item, paladin_armor_item, gaea_gear_item, _
        black_gauntlet_item, paladin_gauntlet_item, silver_ring_item
    link->level = 2
   'The third tier is most of the rest of the overworld (Magnes, Zot, towns)
   case charm_claw_item, poison_claw_item, change_rod_item, _
        silver_staff_item, wind_spear_item, whip_item, hand_axe_item, _
        dancing_dagger_item, silver_sword_item, silver_hammer_item, _
        earth_hammer_item, great_bow_item, fire_arrows_item, ice_arrows_item, _
        lit_arrows_item, silver_shield_item, silver_helm_item, _
        wizard_hat_item, silver_armor_item, wizard_robe_item, karate_gi_item, _
        silver_gauntlet_item
    link->level = 3
   'The fourth tier is the Dwarf Castle and Babil 1
   case cat_claw_item, fire_sword_item, drain_sword_item, sleep_sword_item, _
        flame_spear_item, drain_spear_item, short_katana_item, _
        middle_katana_item, chain_whip_item, dwarf_axe_item, archer_bow_item, _
        darkness_arrows_item, poison_arrows_item, _
        fire_shield_item, tiara_item, bandanna_item, fire_armor_item, _
        black_belt_item, strength_ring_item, rune_ring_item
    link->level = 4
   'The fifth tier is Eblan Cave, Babil 2, and the rest of the underworld
   case charm_rod_item, power_staff_item, lunar_staff_item, light_sword_item, _
        icebrand_item, blizzard_spear_item, long_katana_item, _
        ninja_katana_item, blitz_whip_item, shuriken_item, boomerang_item, _
        poison_axe_item, elven_bow_item, _
        mute_arrows_item, charm_arrows_item, _
        ice_shield_item, diamond_shield_item, aegis_shield_item, _
        diamond_helm_item, ice_armor_item, diamond_armor_item, _
        black_robe_item, sorcerer_robe_item, diamond_gauntlet_item, _
        diamond_ring_item
    link->level = 5
   'The sixth tier is the Giant to the end of the game
   case excalibur_item, defense_item, medusa_sword_item, gungnir_item, _
        mute_knife_item, flame_whip_item, ogre_axe_item, ninja_star_item, _
        fullmoon_item, excalipur_item, rune_axe_item, avenger_item, _
        samurai_bow_item, samurai_arrows_item, medusa_arrows_item, _
        samurai_shield_item, dragoon_shield_item, samurai_helm_item, _
        dragoon_helm_item, ninja_hat_item, samurai_armor_item, _
        zeus_gauntlet_item, samurai_gauntlet_item, dragoon_gauntlet_item
    link->level = 6
   'The seventh tier is the stuff in trapped chests in the sixth segment
   case stardust_rod_item, lilith_rod_item, life_staff_item, _
        silence_staff_item, dragoon_spear_item, white_spear_item, _
        murasame_item, masamune_item, assassin_dagger_item, dragon_whip_item, _
        spoon_item, crystal_sword_item, artemis_bow_item, _
        artemis_arrows_item, crystal_shield_item, crystal_helm_item, _
        ribbon_item, glass_item, dragoon_armor_item, crystal_armor_item, _
        white_robe_item, power_vest_item, heroine_robe_item, _
        adamant_armor_item, ninja_gear_item, crystal_gauntlet_item, _
        crystal_ring_item, cursed_ring_item, protect_ring_item
    link->level = 7
   case else
    link->level = 0
  end select
  
  if ff4.weapons_range.InRange(i) then link->slot = weapon_slot
  if ff4.shield_range.InRange(i) then link->slot = shield_slot
  if ff4.head_range.InRange(i) then link->slot = head_slot
  if ff4.body_range.InRange(i) then link->slot = body_slot
  if ff4.arms_range.InRange(i) then link->slot = arms_slot
  
  select case i
   case fire_claw_item to cat_claw_item
    link->kind = "Claw"
   case rod_item to lilith_rod_item
    link->kind = "Rod"
   case staff_item to silence_staff_item
    link->kind = "Staff"
   case shadow_sword_item to black_sword_item, shadow_shield_item, _
        black_shield_item, shadow_helm_item to black_helm_item, _
        shadow_armor_item to black_armor_item, _
        shadow_gauntlet_item to black_gauntlet_item
    link->kind = "Dark"
   case legend_sword_item to excalibur_item, crystal_sword_item, _
        excalipur_item, paladin_shield_item, crystal_shield_item, _
        paladin_helm_item, crystal_helm_item, paladin_armor_item, _
        crystal_armor_item, paladin_gauntlet_item, crystal_gauntlet_item
    link->kind = "Holy"
   case fire_sword_item to medusa_sword_item, silver_sword_item, avenger_item
    link->kind = "Sword"
   case spear_item to gungnir_item
    link->kind = "Spear"
   case short_katana_item to masamune_item
    link->kind = "Katana"
   case assassin_dagger_item, mute_knife_item, silver_knife_item, dancing_dagger_item
    link->kind = "Knife"
   case whip_item to dragon_whip_item
    link->kind = "Whip"
   case hand_axe_item to ogre_axe_item, poison_axe_item, rune_axe_item
    link->kind = "Axe"
   case spoon_item, shuriken_item, ninja_star_item
    link->kind = "Star"
   case boomerang_item, fullmoon_item
    link->kind = "Boomerang"
   case dreamer_harp_item, charm_harp_item
    link->kind = "Harp"
   case silver_hammer_item to wooden_hammer_item
    link->kind = "Hammer"
   case bow_item to artemis_bow_item
    link->kind = "Bow"
   case iron_arrows_item to artemis_arrows_item
    link->kind = "Arrow"
   case iron_shield_item, silver_shield_item to dragoon_shield_item
    link->kind = "Shield"
   case iron_helm_item, silver_helm_item to dragoon_helm_item
    link->kind = "Helm"
   case cap_item to glass_item
    link->kind = "Hat"
   case iron_armor_item, silver_armor_item to dragoon_armor_item
    link->kind = "Mail"
   case cloth_item, leather_vest_item, power_vest_item, _
        prisoner_item to ninja_gear_item
    link->kind = "Vest"
   case gaea_gear_item to white_robe_item, heroine_robe_item
    link->kind = "Robe"
   case iron_gauntlet_item, silver_gauntlet_item to dragoon_gauntlet_item
    link->kind = "Gauntlet"
   case iron_ring_item to cursed_ring_item
    link->kind = "Ring"
  end select
  
  if link->itemdata.equip_code = 14 then link->female = true
  if link->itemdata.equip_code <= 1 then link->universal = true
  
  itemlist.Append(link)
  
 next

end sub
