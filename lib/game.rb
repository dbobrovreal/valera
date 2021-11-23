require_relative 'print_game'
require_relative 'save_load'

class Game
  def initialize(character, actions_pool)
    @character = character
    @actions_pool = actions_pool
    @stack = []
  end

  def game_run
    until @character.dead?
      print_information
      value = IOAdapter.instance.input '[ВВЕДИТЕ ДЕЙСТВИЯ]:'
      next_command = @actions_pool.avaliable_actions(@character)[value]
      unless next_command.nil?
        @stack.push(@character.clone)
        next_command.execute(@character)
      end
      other_actions(value)
    end
    print_indicators
    IOAdapter.instance.output "\x1B[31m \nВалера умер! \x1B[0m \n"
  end

  def other_actions(value)  
    case value
    when 'save'
      SaveOrLoad.new.save(@character)
      IOAdapter.instance.output('Сохранить игру.')
    when 'load'
      SaveOrLoad.new.load(@character)
      IOAdapter.instance.output 'Загрузить сохранения'
    when 'exit'
      IOAdapter.instance.output 'До встречи!'
      exit
    end
  end
end
