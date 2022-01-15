class Robot

  @@names = []

  def name
    return @name if @name
    @name = create_new_name while name_check?(@name) || @name.nil?
    add_legacy(@name)
    @name
  end

  def add_legacy(name)
    @@names << @name
  end

  def create_new_name
    alpha = ("A".."Z").to_a
    numbers = (0..9).to_a
    str = ""
    2.times { str << alpha[rand(26)] }
    3.times { str << numbers[rand(10)].to_s }
    str
  end

  def reset
    @@names.delete(@name)
    @name = nil
  end

   def name_check?(new_name)
    @@names.include?(new_name)
  end
end
