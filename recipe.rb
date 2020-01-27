class Recipe
  attr_reader :name, :description, :time, :done, :dif, :parsed
  def initialize(name, description, time, dif, parsed = false, done = false)
    @name = name
    @description = description
    @time = time
    @done = done
    @dif = dif
    @parsed = parsed
  end

  def done!
    @done = "true"
  end
end
