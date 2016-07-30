require 'minitest/autorun'
require 'key_change'

class KeyChangeTest < Minitest::Test
  def test_G_to_A
    chords = ["G", "Em", "C", "D"]
    old_key = "G"
    new_key = "A"
    new_chords = change(chords, old_key, new_key, :default)
    assert_equal ["A", "F♯m", "D", "E"], new_chords
  end

  def test_G_to_A_with_sharp
    chords = ["G", "Gb", "Em", "C"]
    original_key = "G"
    new_key = "A"
    new_chords = change(chords, original_key, new_key, :sharp)
    assert_equal ["A", "A♭", "F♯m", "D"], new_chords
  end

  def test_G_to_A_with_flat
    chords = ["G", "F♯", "Em", "C"]
    original_key = "G"
    new_key = "A"
    new_chords = change(chords, original_key, new_key, :flat)
    assert_equal ["A", "G♯", "G♭m", "D"], new_chords
  end

  def test_G_to_A_with_all_sharp
    chords = ["G", "Gb", "Em", "C"]
    original_key = "G"
    new_key = "A"
    new_chords = change(chords, original_key, new_key, :all_sharp)
    assert_equal ["A", "G♯", "F♯m", "D"], new_chords
  end

  def test_G_to_A_with_all_flat
    chords = ["G", "Gb", "Em", "C"]
    original_key = "G"
    new_key = "A"
    new_chords = change(chords, original_key, new_key, :all_flat)
    assert_equal ["A", "A♭", "G♭m", "D"], new_chords
  end

  def test_same_key
    chords = ["G", "Gb", "Em", "C"]
    original_key = "G"
    new_key = "G"
    new_chords = change(chords, original_key, new_key, :default)
    assert_equal ["G", "G♭", "Em", "C"], new_chords
  end

  def test_A_to_G
    chords = ["A", "F#m", "D", "E"]
    old_key = "A"
    new_key = "G"
    new_chords = change(chords, old_key, new_key, :default)
    assert_equal ["G", "Em", "C", "D"], new_chords
  end

  def test_C_to_B
    chords = ["C", "Am", "F", "G"]
    old_key = "C"
    new_key = "B"
    new_chords = change(chords, old_key, new_key, :default)
    assert_equal ["B", "G♯m", "E", "F♯"], new_chords
  end

  def test_B_to_C
    chords = ["B", "G#m", "E", "F#"]
    old_key = "B"
    new_key = "C"
    new_chords = change(chords, old_key, new_key, :default)
    assert_equal ["C", "Am", "F", "G"], new_chords
  end

  def test_chord_types
    original_key = "G"
    new_key = "A"

    chords = ["Gdim7"]
    new_chords = change(chords, original_key, new_key, :default)
    assert_equal ["Adim7"], new_chords

    chords = ["Gdim"]
    new_chords = change(chords, original_key, new_key, :default)
    assert_equal ["Adim"], new_chords

    chords = ["Gdim7"]
    new_chords = change(chords, original_key, new_key, :default)
    assert_equal ["Adim7"], new_chords

    chords = ["G2"]
    new_chords = change(chords, original_key, new_key, :default)
    assert_equal ["A2"], new_chords

    chords = ["Gsus4"]
    new_chords = change(chords, original_key, new_key, :default)
    assert_equal ["Asus4"], new_chords

    chords = ["Gsus"]
    new_chords = change(chords, original_key, new_key, :default)
    assert_equal ["Asus"], new_chords

    chords = ["Gmaj7"]
    new_chords = change(chords, original_key, new_key, :default)
    assert_equal ["Amaj7"], new_chords

    chords = ["Gmaj"]
    new_chords = change(chords, original_key, new_key, :default)
    assert_equal ["Amaj"], new_chords

    chords = ["Gm7"]
    new_chords = change(chords, original_key, new_key, :default)
    assert_equal ["Am7"], new_chords

    chords = ["Gm"]
    new_chords = change(chords, original_key, new_key, :default)
    assert_equal ["Am"], new_chords

    chords = ["G7"]
    new_chords = change(chords, original_key, new_key, :default)
    assert_equal ["A7"], new_chords

    chords = ["G6"]
    new_chords = change(chords, original_key, new_key, :default)
    assert_equal ["A6"], new_chords

    chords = ["G9"]
    new_chords = change(chords, original_key, new_key, :default)
    assert_equal ["A9"], new_chords

    chords = ["Gaug"]
    new_chords = change(chords, original_key, new_key, :default)
    assert_equal ["Aaug"], new_chords

    chords = ["G11"]
    new_chords = change(chords, original_key, new_key, :default)
    assert_equal ["A11"], new_chords
  end
end
