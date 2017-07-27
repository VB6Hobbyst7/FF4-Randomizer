#include once "../ff4rom/ff4rom.bas"
#include once "../common/deck.bas"
#include once "../common/set.bas"
#include once "../common/spinner.bas"
#include once "../common/functions/minmax.bas"
#include once "../common/functions/pad.bas"
#include once "../common/functions/tokenize.bas"

type MetaItem

 itemdata as Item
 level as UByte
 slot as UByte
 kind as String
 female as Boolean
 universal as Boolean

end type

const weapon_slot = 1
const shield_slot = 2
const head_slot = 3
const body_slot = 4
const arms_slot = 5

dim shared ff4 as FF4Rom
dim shared itemlist as List

dim commandline as String
dim filename as String
dim flags as List
dim output_filename as String
dim filename_tokens as List
dim seed as Integer = -1

dim actor_preserve as Boolean = true
dim balance as Boolean
dim female_preserve as Boolean = true
dim ignore_gender as Boolean
dim ignore_kinds as Boolean
dim include_dummy as Boolean
dim include_extras as Boolean
dim randomize_names as Boolean
dim rename_everything as Boolean
dim randomize_commands as Boolean
dim randomize_equips as Boolean
dim randomize_jobs as Boolean
dim randomize_shops as Boolean
dim randomize_spellsets as Boolean
dim randomize_starting_gear as Boolean
dim randomize_treasures as Boolean

'commandline = "test.smc i u r"
commandline = command

if commandline = "" then end

'Parse command line
flags = Tokenize(commandline)
filename = lcase(flags.ItemAt(1))
flags = Tokenize(lcase(commandline))
filename_tokens = Tokenize(filename, ".")

'Configure settings based on command line flags
for i as Integer = 2 to flags.Length()
 if val(flags.ItemAt(i)) > 0 then seed = val(flags.ItemAt(i))
 if flags.ItemAt(i) = "a" then actor_preserve = false
 if flags.ItemAt(i) = "b" then balance = true
 if flags.ItemAt(i) = "c" then randomize_commands = true
 if flags.ItemAt(i) = "e" then randomize_equips = true
 if flags.ItemAt(i) = "f" then female_preserve = false
 if flags.ItemAt(i) = "g" then ignore_gender = true
 if flags.ItemAt(i) = "i" then randomize_shops = true
 if flags.ItemAt(i) = "j" then randomize_jobs = true
 if flags.ItemAt(i) = "k" then ignore_kinds = true
 if flags.ItemAt(i) = "n" then randomize_names = true
 if flags.ItemAt(i) = "o" then randomize_spellsets = true
 if flags.ItemAt(i) = "r" then rename_everything = true
 if flags.ItemAt(i) = "s" then randomize_starting_gear = true
 if flags.ItemAt(i) = "t" then randomize_treasures = true
 if flags.ItemAt(i) = "u" then include_dummy = true
 if flags.ItemAt(i) = "x" then include_extras = true
 if val(flags.ItemAt(i)) = 0 then output_filename += lcase(flags.ItemAt(i))
 if i < flags.Length() then output_filename += " "
next
output_filename += ").smc"

ff4.ReadFromFile(filename)

#include once "subs/fixsingaimequips.bas"
#include once "subs/fixstartingequips.bas"
#include once "subs/fixstartingspells.bas"
#include once "subs/generateequipmentlist.bas"
#include once "subs/genderofjob.bas"
#include once "subs/givemp.bas"
#include once "subs/maptier.bas"
#include once "subs/renameeverything.bas"
#include once "subs/streamlinekinds.bas"
#include once "subs/randomizeequips.bas"
#include once "subs/randomizenames.bas"
#include once "subs/randomizejobs.bas"
#include once "subs/randomizecommands.bas"
#include once "subs/randomizeshops.bas"
#include once "subs/randomizespellsets.bas"
#include once "subs/randomizetreasures.bas"
#include once "subs/storeequipmentlist.bas"

if seed = -1 then seed = timer
randomize seed

GenerateEquipmentList()
if randomize_equips and not ignore_kinds then StreamlineKinds(female_preserve)
StoreEquipmentList()
if randomize_treasures then RandomizeTreasures(include_dummy, balance)
if randomize_shops then RandomizeShops(include_dummy, balance)
if randomize_jobs then RandomizeJobs()
if randomize_names then RandomizeNames(ignore_gender, include_extras)
if randomize_equips then RandomizeEquips(female_preserve, ignore_kinds)
if randomize_commands then RandomizeCommands(actor_preserve)
if randomize_spellsets then RandomizeSpellSets()
FixSingAimEquips()
if rename_everything then RenameEverything()
if randomize_equips or randomize_starting_gear then FixStartingEquips(balance)
FixStartingSpells()

output_filename = filename_tokens.ItemAt(1) + " (" + str(seed) + " " + output_filename

ff4.WriteToFile(output_filename)


