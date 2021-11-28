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

  def print_happines(name, count)
    if count >= 0
      IOAdapter.instance.output "[#{name}]:|#{'█' * count.abs}#{' ' * (10 - count.abs)}|" 
    else
      IOAdapter.instance.output "[#{name}]:|#{'#' * count.abs}#{' ' * (10 - count.abs)}|" 
    end
  end  
 
  def beauty_print(name)
    count = @character.send name
    case name
    when 'money'
      IOAdapter.instance.output "[#{name}]: #{count}"
    when 'happiness'
      print_happines(name, count) 
    else
      procentcount = (count / 10).ceil
      IOAdapter.instance.output "[#{name}]:|#{'█' * procentcount}#{' ' * (10 - procentcount)}|" 
    end
  end

  def print_indicators
    system 'clear'
    indicators = %w[health mana happiness fatigue money]
    IOAdapter.instance.output '[Параметры Валеры]:'
    indicators.each { |param| beauty_print(param) }
  end
end
