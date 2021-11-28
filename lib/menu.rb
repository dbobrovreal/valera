require_relative 'save_load'

ACTIONS = %w[1 2 3 START start LOAD load exit EXIT Старт Загрузка Выход].freeze

class Menu
  def initialize(character, actions)
    @character = character
    @game = Game.new(character, actions)
  end

  def beginning
    IOAdapter.instance.output "[Добро Пожаловать!]\n
    [1] - Новая игра
    [2] - Загрузить игру
    [3] - Exit"

    beginning = IOAdapter.instance.input "\n[ВЫБЕРИТЕ ДЕЙСТВИЕ]:"
    if ACTIONS.include?(beginning)
      case beginning
      when '1', 'START', 'start', 'старт'
        @game.game_run
      when '2', 'LOAD', 'load', 'загрузка'
        SaveOrLoad.new.load(@character)
        @game.game_run
      when '3', 'EXIT', 'exit', 'выход'
        IOAdapter.instance.output "До скорого)\n"
        exit
      end
    else
      IOAdapter.instance.output "Невозможное действие\n"
      Application.new.run
    end
  end
end
