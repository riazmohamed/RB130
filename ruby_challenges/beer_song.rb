class BeerSong

  def self.lesser_than_one
    "No more bottles of beer on the wall, no more bottles of beer.\n" \
    "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
  end

  def self.equal_to_one
    "1 bottle of beer on the wall, 1 bottle of beer.\n" \
    "Take it down and pass it around, no more bottles of beer on the wall.\n"
  end

  def self.equal_to_two
    "2 bottles of beer on the wall, 2 bottles of beer.\n" \
    "Take one down and pass it around, 1 bottle of beer on the wall.\n"
  end

  def self.otherwise(number)
    "#{number} bottles of beer on the wall, #{number} bottles of beer.\n" \
    "Take one down and pass it around, #{number - 1} bottles of beer on the wall.\n"
  end

  def self.verse(number)
    if number < 1
      lesser_than_one
    elsif number == 1
      equal_to_one
    elsif number == 2
      equal_to_two
    else
      otherwise(number)
    end
  end

  def self.verses(num1, num2)
    (num2..num1).to_a.reverse.each_with_object([]) do |num, output|
      output << verse(num)
    end.join("\n")
  end

  def self.lyrics
    verses(99, 0)
  end
end
