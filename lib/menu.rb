require_relative 'save_load'

class Menu
  def initialize(character, actions)
    @character = character
    @game = Game.new(character, actions)
  end

  def beginning
    IOAdapter.instance.output "[Добро Пожаловать!]\n
    [1] - Новая игра\n
    [2] - Загрузить игру\n
    ---------------------\n
    [exit]"
    beginning = IOAdapter.instance.input "\n[ВЫБЕРИТЕ ДЕЙСТВИЯ]: "
    case beginning
    when '1'
      @game.game_run
    when '2'
      SaveOrLoad.new.load(@character)
      @game.game_run
    end
  end
end
