class SaveOrLoad
  def initialize(filename = 'save_games/valera_game.txt')
    @filename = filename
    @parameters = %w[health mana happiness fatigue money]
  end

  def save(character)
    File.open(@filename, 'w') unless File.zero?(@filename)
    @parameters.each do |param|
      File.open(@filename, 'a') { |file| file.write("#{character.send param} ") }
    end
  end

  def load(character)
    new_parameters = File.open(@filename, 'r', &:read)
    new_parameters = new_parameters.split
    i = 0
    @parameters.each do |param|
      character.send("#{param}=", new_parameters[i].to_i)
      i += 1
    end
  end
end
