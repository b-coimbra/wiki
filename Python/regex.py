'''
IDENTIFIERS

\d any number
\D anything but a number
\s space
\S anything but a space
\w any character
\W anything but a character
\b the whitespace around words
. = any character expect for a new line
\. a period

MODIFIERS

{1, 3} we're expecting 1-3 ex: \d{1, 3}
{x} expecting "x" ammount
+ Match 1 or more
? Match 0 or 1
* Match 0 or more
$ Match the end of a string
^ Matching the beginning of a string
| either or ex: \d{1-3} | \d{1-5}
[] range or "variance" [A-Z]

WHITE SPACE CHARACTERS:

important ones:

\n new line
\s space
\t tab
------------
\e escape
\f form feed
\r return



# Slightly improved the pattern:
s/\/([^/]+\/)*([^/]*)/\2/g
# The s/a/b/ operator is often written with slashes
# But you could use another character to avoid some backslashing, here %
s%/([^/]+/)*([^/]*)%\2%g
# the choice of delimiter is for readability
# and prevents having to escape the slashes to avoid collision
# s%a%b%g replaces a to b throughout the file
# The pattern is, hence:
/ ([^/]+/)* ([^/]*)
# I used spaces to separate, which works on some regex languages, while in others they're taken to be part of the pattern, beware
# First there is a slash, it has no special meaning, so the string to match starts with a slash
# The [...] means "any of the characters listed inside
# The [^...] means the opposite: "any character EXCEPT those listed
# [^/] thus means: any character but a slash
# x+ means one or more occurences of 'x' (consecutive of course)
# [^/]+ therefore means 'one or more not-slash characters
# Then there is a slash and everything is grouped in parentheses
([^/]+/)
# matches 'foo/' 'x/' but not '/' or 'foo/bar/baz/'
# x* means 'zero or more x'
([^/]+/)*
# matches all the strings aforementioned. But neither match strings like 'foo' or 'foo/bar'
# remember we had a slash at the beginning?
/([^/]+/)*
# matches any full pathname for directories, such as '/usr/share/src/'
# You could be more succinct with
/.*/
# The dot ( . ) means 'any character whatsoever. The star means 'zero or more'
# lastly we have a familiar pattern:
[^/]*
# zero or more non-slash characters
# the reason for the parenthesis comes later. now
/ ([^/]+/)* ([^/]*)
# would be a full pathname for a regular (a non-directory) file: '/usr/bin/emacs'
# Remember that the second part was unnecesarily enclosed in parentheses?
# The s// operator catches everything it matches under parentheses in special variables
# They are named \1 \2 \3 etc.
# the pathname part (minus the first slash) is caught inside \1
# The filename part is caught under \2
# That variable is used for the substitution
s%/([^/]+/)*([^/]*)%\2%
# For every pathname that ends in a regular file, substitute it for just the name of the file

# there are other ways to do this, a simpler one, a bit prone to error if you have directory pathnames in your input, would be
s%/.*/%%
# change every pathname ending in a slash to nothing

# Also to note, if your input is something like
blah /usr/bin/vim
# there is a match
# if you want to say "lines containing ONLY X" you'd do
^X$
# lines STARTING with X
^X
# lines ENDING in X
X$

# finally the 'g' at the end of the s// operator
s/a/b/g
# is a flag for the operator, which means 'do for every line in the input
# otherwise it would only operate on the first match

# The original regex I posted on lainchan ended with
([^/]*\..*)
# which matches filenames with a dot like '/home/anon/hello.c' but not '/home/anon/hello'
# You can see I escaped the dot ( \. ) to make it a literal match
# and then used a dot-star ( .* ) for the extension
# another flaw there is that it'd match '/home/anon/emacs.d/' because the last dot matches anything
# after the literal dot the 'd/' get captured.
# again it could be fixed like this:
([^/]*\.[^/]*)
# or even better
([^/]*(\.[^/])*)
# Which makes the file extension optional and as well

# Sorry if my autism was excessive here.
'''

import re

exampleString = '''
Jessica is 15 years old, and Daniel is 27 years old.
Edward is 97, and his grandfather, Oscar, is 102.
'''

ages = re.findall(r'\d{1,3}', exampleString)
names = re.findall(r'[A-Z][a-z]*', exampleString)

print (ages)
print (names)
