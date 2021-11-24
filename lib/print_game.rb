class GameMenu
  def initialize(character, actions_pool)
    @character = character
    @actions_pool = actions_pool
    print_indicators
    print_actions
  end

  def print_actions
    IOAdapter.instance.output "\n[Действия]:"
    actions = @actions_pool.avaliable_actions(@character)
    actions.each { |key, value| IOAdapter.instance.output("[#{key}] - #{value.name} (#{value.description})") }
    IOAdapter.instance.output '--------------------'
    IOAdapter.instance.output '[save] [load] [exit]'
  end

  def print_indicators
    indicators = %w[health mana happiness fatigue money]
    IOAdapter.instance.output "\n[Параметры]:"
    indicators.each { |param| IOAdapter.instance.output "[#{param}] : #{@character.send param}" }
  end
end
