## This gem is not object oriented. Please use <a href="https://github.com/gazayas/musician">this gem</a> to make classes

[![Gem](https://img.shields.io/gem/v/key_change.svg?style=plastic)](https://rubygems.org/gems/key_change)

## A gem to change an array of chords from one key to any other key

###Installation
`$ gem install key_change`

```ruby
require 'key_change'

chords = ["G", "D/F#", "Em", "C", "D"]
old_key = "G"
new_key = "A"

# Declare a new array of chords with the function
new_chords = change(chords, old_key, new_key, :default)
```
The output is:
```ruby
["A", "E/G♯", "F♯m", "D", "E"]
```

##Writing sharps and flats
```ruby
# To make a sharp chord, write a pound sign
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
:sharp # This is the same as :default
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

new_chords = change(chords, old_key, new_key, :sharp)
# The output is ["A", "A♭", "F♯m", "D"]
# Any chord that was originally flat will stay flat if applicable
# In any other case, they will become sharp (Like "F♯m")
```

###Option 2 (:flat)
```ruby
chords = ["G", "F♯", "Em", "C"]
original_key = "G"
new_key = "A"

new_chords = change(chords, old_key, new_key, :flat)
# The output is ["A", "G♯", "G♭m", "D"]
# Any chord that was originally sharp will stay sharp if applicable
# In any other case, they will become flat (Like "G♭m")
```

###Option 3 (:all_sharp)
```ruby
chords = ["G", "Gb", "Em", "C"]
original_key = "G"
new_key = "A"

new_chords = change(chords, old_key, new_key, :all_sharp)
# The output is ["A", "G♯", "F♯m", "D"]
# All applicable chords will be changed into sharps
```

###Option 4 (:all_flat)
```ruby
chords = ["G", "Gb", "Em", "C"]
original_key = "G"
new_key = "A"

new_chords = change(chords, old_key, new_key, :all_sharp)
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

## key_change：歌のコードを楽に転調するためのgem
## このgemはクラスが実装していません（オブジェクト指向なし）
。クラスインスタンス変数などを作るには<a href="https://github.com/gazayas/musician">こちら</a>の方をお使いください。

[![Gem](https://img.shields.io/gem/v/key_change.svg?style=plastic)](https://rubygems.org/gems/key_change)

歌の（配列としての）コード、歌のキーと転調するための新しいキー、そしてどんな風に転調されるかを決めるオプション（4つの引数）をメソッドに渡すことで、歌の転調を楽に行うことができます。

###インストール
`$ gem install key_change`

```ruby
require 'key_change'

chords = ["G", "D/F#", "Em", "C", "D"]
old_key = "G"
new_key = "A"

# change()メソッドで新しい配列を定義します
new_chords = change(chords, old_key, new_key, :default)
```
出力されるのは：
```ruby
["A", "E/G♯", "F♯m", "D", "E"]
```

##シャープやフラット記号
```ruby
# シャープ記号を書くには、コメントで使う"#"を書きます
# "♯"に変換されます
old_key = "F#"

# フラット記号を書くには、小文字の"b"を書きます
# "♭"に変換されます
new_key = "Ab"
```

##転調のオプション
change()メソッドの最後の引数はオプションです。
4つのオプションから選べます。
```ruby
:sharp # これは「:default」と同じです
:flat
:all_sharp
:all_flat
```

###「:sharp」オプション
```ruby
chords = ["G", "Gb", "Em", "C"]
original_key = "G"
new_key = "A"

new_chords = change(chords, old_key, new_key, :sharp)
# 出力されるのは["A", "A♭", "F♯m", "D"]です
# 元々はフラットであったコードはそのままフラットに変換されます
# それ以外のコードはシャープに変換されます（「F♯m」みたいに）
```

###「:flat」オプション
```ruby
chords = ["G", "F♯", "Em", "C"]
original_key = "G"
new_key = "A"

new_chords = change(chords, old_key, new_key, :flat)
# 出力されるのは["A", "G♯", "G♭m", "D"]です
# 元々はシャープであったコードはそのままシャープに変換されます
# それ以外のコードはフラットに変換されます（「G♭m」みたいに）
```

###「:all_sharp」オプション
```ruby
chords = ["G", "Gb", "Em", "C"]
original_key = "G"
new_key = "A"

new_chords = change(chords, old_key, new_key, :all_sharp)
# 出力されるのは["A", "G♯", "F♯m", "D"]です
# 対象となるコードは全部シャープに変換されます
```

###「:all_flat」オプション
```ruby
chords = ["G", "Gb", "Em", "C"]
original_key = "G"
new_key = "A"

new_chords = change(chords, old_key, new_key, :all_sharp)
# 出力されるのは["A", "A♭", "G♭m", "D"]です
# 対象となるコードは全部フラットに変換されます
```

##使用可能なコード
下記のコードは使用できます：
```ruby
# コードやキーの語尾として追加できます
# 例えば: "Am7"
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
##まだ
下記のadditionはまだコードに入っていません：
```ruby
"add2"
"add9"
```
