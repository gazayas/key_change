# 必要な変数の定義
NOTES_SHARP = ["C", "C♯", "D", "D♯", "E", "F", "F♯", "G", "G♯", "A", "A♯", "B"]
NOTES_FLAT = ["C", "D♭", "D", "E♭", "E", "F", "G♭", "G", "A♭", "A", "B♭", "B"]

# 便利なメソッドの定義
def sharp? (note)
  note.match(/♯/) || note.match(/#/)
end

def flat? (note)
  note.match(/♭/) || note.match(/b/)
end

# 「b」か「#」であったら変換されます
def replace(note)
  if sharp?(note)
    note.gsub!(/#/, "♯")
  elsif flat?(note)
    note.gsub!(/b/, "♭")
  end
end

# noteの位置を調べて返します
# C と C♯ の差で (position = 1 - 0) にならないように「1」を足します
def position_of(note)
  if flat?(note)
    NOTES_FLAT.index(note) + 1
  else
    NOTES_SHARP.index(note) + 1
  end
end

# 主要のメソッド
def change (original_chords, old_key, new_key, option)

  chords = Marshal.load(Marshal.dump(original_chords))

  replace(old_key)
  replace(new_key)
  chords.each do |chord|
    replace(chord)
  end

  old_key_position = position_of(old_key)
  new_key_position = position_of(new_key)

   # キーの差を計算する
   if new_key_position == old_key_position
     return chords
   elsif new_key_position < old_key_position
     difference = old_key_position - new_key_position
     key_up = false
   else
     difference = new_key_position - old_key_position
     key_up = true
   end

  chords.map do |chord|

    addition = ""
    case chord
    when /dim7/ then
      addition = "dim7"
    when /dim/ then
      addition = "dim"
    when /2/ then
      addition = "2"
    when /sus4/ then
      addition = "sus4"
    when /sus/ then
      addition = "sus"
    when /maj7/ then
      addition = "maj7"
    when /maj/ then
      addition = "maj"
    when /m7/ then
      addition = "m7"
    when /m/ then
      addition = "m"
    when /7/ then
      addition = "7"
    when /6/ then
      addition = "6"
    when /9/ then
      addition = "9"
    when /aug/ then
      addition = "aug"
    when /11/ then
      addition = "11"
    end

    # chord を上手く計算するために、addition を chord から取り除く
    if addition != ""
      chord.gsub!(addition, "")
    end

    original_position = position_of(chord)
    if key_up == true
      new_position = original_position + difference
      if new_position > 12
        new_position -= 12
      end
    else # key_up == false
      new_position = original_position - difference
      if new_position < 1
        new_position += 12
      end
    end
    new_position -= 1

    if option == :default
      option = :sharp
    end

    case option
    when :sharp then
      if flat?(chord)
        NOTES_FLAT[new_position] + addition
      else
        NOTES_SHARP[new_position] + addition
      end
    when :flat then
      if sharp?(chord)
        NOTES_SHARP[new_position] + addition
      else
        NOTES_FLAT[new_position] + addition
      end
    when :all_sharp then
        NOTES_SHARP[new_position] + addition
    when :all_flat then
        NOTES_FLAT[new_position] + addition
    end

  end #chords.mapの終わり

end
