FLAGS
=====

b - Balance item distribution.
    If this flag is set, the randomizer will do its best to give items of
    appropriate power level for where they appear. This includes treasures,
    starting equipment, and shops.

c - Randomize the menu commands of actors.
    Spell sets will also be redistributed along with the regular commands.
    Characters that do not normally get any MP will start with (Level x 2) MP
    and will gain 4 MP per level. Certain commands are given special treatment:
    Twin could appear on both Palom and Porom or on no one. Cover and Hide will
    each only appear on at most one actor, and will not appear on a returning
    actor. Commands which require a certain type of item equipped in order to
    work will give the actor that equip skill if they don't already have it.
    
    a - Actors can have different commands when returning.
        By default, returning characters will have the same commands they had
        when they left. With this flag set, those actors' commands will be
        re-randomized. They will still keep the same spell sets they had when
        they left.

e - Randomize equip skills.
    This randomizes which character jobs can use which types of equipment. It
    will automatically change the starting equipment of actors to match their
    new equip skills. If the balance flag is not set, it will randomize from
    among all equippable items for each slot when determining starting
    eqiupment.

    k - Ignore kinds of equipment.
        Normally, the equipment is organized into groups and a character can
        equip (or can't equip) all items of a given group (swords, axes, rods,
        etc). With this flag set, each individual piece of equipment will be
        treated independently; just because you can equip one sword doesn't
        mean you can equip any other swords.
    
    f - Randomize female equipment.
        There are certain items such as Tiara and Heroine which can only be
        used by female characters. Normally, the randomization will leave these
        alone, but by setting this flag, you can overwrite that and have those
        items be treated like the others.
    
j - Randomize jobs.
    This basically just shuffles around the appearances of the playable
    characters; they will retain their spell sets, commands, etc., unless you
    also set the flags to randomize those as well.
    
n - Randomize character names.
    There is a built-in list of character names that it will shuffle up and
    deal out to all the playable characters plus Golbez and Anna. By default,
    male characters will only receive male or neutral names, and female
    characters will only receive female or neutral names. Gender is determined
    by your job, so if you randomize jobs, the genders will change accordingly.
        
    g - Ignore gender when randomizing names.
    
    x - Include extras (named characters other than the playable ones).
        
r - Rename everything.
    This changes all the "Dummy" and "D" in the text to more useful labels.
    
s - Randomize spell sets.
    This changes the order in which the spells in each spell set are learned.
    It doesn't change what spells the set contains. Spells learned by story
    events will not be altered.

t - Randomize treasures.
    The same chests that were trapped in the original will still be trapped;
    only the contents are changed. Normally, only items that were accessible
    originally can be found in the chests.
    
    u - Un-dummy items that were removed from the original FF2US.
    

