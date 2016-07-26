##A gem to change an array of chords from one key to any other key

###Installation
`$ gem install key_change`

```ruby
require 'key_change'

chords = ["G", "Em", "C", "D"]
old_key = "G"
new_key = "A"

# Declare a new array of chords with the function
new_chords = Change(chords, old_key, new_key, :default)
```
The output is:
```ruby
["A", "F♯m", "D", "E"]
```

##Writing sharps and flats
```ruby
# To make a sharp chord, write a hash character
# It will be converted to "♯"
old_key = "F#"

# To make a flat chord, write a lowercase "b"
# It will be converted to "♭"
new_key = "Ab"
```

##Key change options
As seen in the function, the last argument is an option.
There are 4 options that can be chosen from
```ruby
:sharp # This is the same as default
:flat
:all_sharp
:all_flat
```

The option decides how the chords will be changed.
###Option 1 (:sharp)
```ruby
chords = ["G", "Gb", "Em", "C"]
original_key = "G"
new_key = "A"

new_chords = Change(chords, old_key, new_key, :sharp)
# The output is ["A", "A♭", "F♯m", "D"]
# Any chord that was originally flat will stay flat if applicable
# In any other case, they will become sharp (Like "F♯m")
```

###Option 2 (:flat)
```ruby
chords = ["G", "F♯", "Em", "C"]
original_key = "G"
new_key = "A"

new_chords = Change(chords, old_key, new_key, :flat)
# The output is ["A", "G♯", "G♭m", "D"]
# Any chord that was originally sharp will stay sharp if applicable
# In any other case, they will become flat (Like "G♭m")
```

###Option 3 (:all_sharp)
```ruby
chords = ["G", "Gb", "Em", "C"]
original_key = "G"
new_key = "A"

new_chords = Change(chords, old_key, new_key, :all_sharp)
# The output is ["A", "G♯", "F♯m", "D"]
# All applicable chords will be changed into sharps
```

###Option 4 (:all_flat)
```ruby
chords = ["G", "Gb", "Em", "C"]
original_key = "G"
new_key = "A"

new_chords = Change(chords, old_key, new_key, :all_sharp)
# The output is ["A", "A♭", "G♭m", "D"]
# All applicable chords will be changed into flats
```

##Supported chords
The following chords are supported:
```ruby
# Any of these can be added at the end of a chord or key
# for example: "Am7"
"dim7"
"dim"
"2"
"sus4"
"sus"
"maj7"
"maj"
"m7"
"m"
"7"
"6"
"9"
"aug"
"11"
```
##Not yet
Haven't put these chords in yet:
```ruby
"add2"
"add9"
```

##Caution:
After putting the original chords through the function,
they will be changed. Be careful if you decide to use them
again after using the function.
If people request, I might change the code so the original
chords will stay unaffected.


##日本語の説明を書くこと...
