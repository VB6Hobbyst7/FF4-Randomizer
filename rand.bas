#include once "../ff4rom/ff4rom.bas"
#include once "../common/deck.bas"
#include once "../common/set.bas"
#include once "../common/spinner.bas"
#include once "../common/functions/tokenize.bas"
#include once "../common/functions/pad.bas"

dim shared ff4 as FF4Rom

dim commandline as String
dim filename as String
dim flags as List
dim output_filename as String
dim filename_tokens as List
dim seed as Integer = -1

dim rename_everything as Boolean
dim randomize_names as Boolean
dim ignore_gender as Boolean
dim randomize_commands as Boolean
dim randomize_jobs as Boolean

commandline = "test.smc r n j c"
'commandline = command

'Parse command line
flags = Tokenize(commandline)
filename = lcase(flags.ItemAt(1))
flags = Tokenize(lcase(commandline))
filename_tokens = Tokenize(filename, ".")

'Configure settings based on command line flags
for i as Integer = 2 to flags.Length()
 if flags.ItemAt(i) = "c" then randomize_commands = true
 if flags.ItemAt(i) = "g" then ignore_gender = true
 if flags.ItemAt(i) = "j" then randomize_jobs = true
 if flags.ItemAt(i) = "n" then randomize_names = true
 if flags.ItemAt(i) = "r" then rename_everything = true
 output_filename += lcase(flags.ItemAt(i))
 if i < flags.Length() then output_filename += " "
next
output_filename += ").smc"

ff4.ReadFromFile(filename)

#include once "genderofjob.bas"
#include once "renameeverything.bas"
#include once "randomizenames.bas"
#include once "randomizejobs.bas"
#include once "randomizecommands.bas"

if seed = -1 then seed = timer
randomize seed

if rename_everything then RenameEverything()
if randomize_jobs then RandomizeJobs()
if randomize_names then RandomizeNames(ignore_gender)
if randomize_commands then RandomizeCommands()

output_filename = filename_tokens.ItemAt(1) + " (Seed " + str(seed) + " - Flags " + output_filename

ff4.WriteToFile(output_filename)
