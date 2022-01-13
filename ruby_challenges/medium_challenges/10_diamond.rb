class Diamond

  def build_array(letter)
    ("A"..letter).to_a
  end

  def placeholder_array(sum, arr)
    arr.map { |_| " " * sum }
  end

  def final_arr(new_arr, last_index, arr)
    new_arr.each.with_index do |ele, i|
      ele[last_index + i] = arr[i]
      ele[last_index - i] = arr[i]
    end
    new_arr
  end

  def row_arr(arr, letter)
    last_index = arr.index(letter)
    arr_size = arr.size
    sum = last_index + arr_size
    new_arr = placeholder_array(sum, arr)
    final_arr(new_arr, last_index, arr)
  end

  def remaining(part_arr)
    new_arr = []
    (0...part_arr.size-1).each { |ele| new_arr << part_arr[ele] }
    new_arr = new_arr.reverse
    part_arr.concat(new_arr)
  end

  def self.make_diamond(letter)
    return letter + "\n" if letter == "A"
    diamond = Diamond.new
    arr = diamond.build_array(letter)
    part_arr = diamond.row_arr(arr, letter)
    diamond.remaining(part_arr).join("\n") << "\n"
  end
end
