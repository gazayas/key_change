# 便利なファンクションの定義
def Sharp? (note)
  if note.match(/♯/) || note.match(/\#/)
    return true
  else
    return false
  end
end

def Flat? (note)
  if note.match(/♭/) || note.match(/b/)
    return true
  else
    return false
  end
end


# 主本のメソッド
def Change (chords, old_key, new_key, option)

  # 必要な変数の定義
  notes_sharp = ["C", "C♯", "D", "D♯", "E", "F", "F♯", "G", "G♯", "A", "A♯", "B"]
  notes_flat = ["C", "D♭", "D", "E♭", "E", "F", "G♭", "G", "A♭", "A", "B♭", "B"]
  new_chords = []

  # b か # であったら変換してくれる
  if Sharp?(old_key)
    old_key.gsub!(/\#/, "♯")
  elsif Flat?(old_key)
    old_key.gsub!(/\b/, "♭")
  end

  if Sharp?(new_key)
    new_key.gsub!(/\#/, "♯")
  elsif Flat?(new_key)
    new_key.gsub!(/b/, "♭")
  end


   # 古いキーの位置を調べて取得する
   if Flat? (old_key)
     old_key_position = notes_flat.index(old_key) + 1
   else
     old_key_position = notes_sharp.index(old_key) + 1
   end

   # 新しい方も
   if Flat? (new_key)
     new_key_position = notes_flat.index(new_key) + 1
   else
     new_key_position = notes_sharp.index(new_key) + 1
   end

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

  chords.each do |chord|

    # メソッドが終わってもオリジナルのコードが影響を受けてgsub!されるので注意してください
    if Sharp?(chord)
      chord.gsub!(/\#/, "♯")
    elsif Flat?(chord)
      chord.gsub!(/b/, "♭")
    end

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



    if key_up == true
      if Flat?(chord)
        original_position = notes_flat.index(chord) + 1
        new_position = original_position + difference
        if new_position > 12
          new_position -= 12
        end
        new_position -= 1
      else
        original_position = notes_sharp.index(chord) + 1
        new_position = original_position + difference
        if new_position > 12
          new_position -= 12
        end
        new_position -= 1
      end
    else # key_up == false
      if Flat?(chord)
        original_position = notes_flat.index(chord) + 1
        new_position = original_position - difference
        if new_position < 1
          new_position += 12
        end
        new_position -= 1
      else
        original_position = notes_sharp.index(chord) + 1
        new_position = original_position - difference
        if new_position < 1
          new_position += 12
        end
        new_position -= 1
      end
    end

    if option == :default
      option = :sharp
    end

    case option
    when :sharp then
      if Flat?(chord)
        new_chords << notes_flat[new_position] + addition
      else
        new_chords << notes_sharp[new_position] + addition
      end
    when :flat then
      if Sharp?(chord)
        new_chords << notes_sharp[new_position] + addition
      else
        new_chords << notes_flat[new_position] + addition
      end
    when :all_sharp then
        new_chords << notes_sharp[new_position] + addition
    when :all_flat then
        new_chords << notes_flat[new_position] + addition
    end

  end #chords.eachの終わり

  return new_chords

end
