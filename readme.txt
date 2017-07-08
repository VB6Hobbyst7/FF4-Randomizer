FLAGS
=====

n - Randomize character names. The names come from the included file
    "names.dat". This is just a plain text file that you can feel free
    to edit to your heart's content. Simply put a list of female names
    under the heading "FEMALE NAMES", a list of male names under
    "MALE NAMES", and optionally, a list of neutral names under
    "NEUTRAL NAMES". If you do edit the list, make sure you have at
    least 4 female names and at least 10 male names, and that all of
    the names are at most 6 letters long. Names longer than 6 letters
    will be truncated to 6; the letters past the sixth will get
    dropped.
    
    g - Ignore gender when randomizing names. The names.dat file still has to
        conform to the above restrictions, even if you plan on using this flag.
        
c - Randomize the menu commands of actors. Certain commands are given special
    treatment: Twin could appear on both Palom and Porom if they both have room
    in their command lists after randomizing the other commands, but will not
    appear on anyone else. Cover and Hide will each only appear on at most one
    actor, and will not appear on a returning actor.
    
r - Rename everything. This changes all the "Dummy" and "D" in the text to
    more useful labels.
