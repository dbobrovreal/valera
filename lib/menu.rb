class Menu
  def initialize(character, actions)
    @character = character
    @game = Game.new(character, actions)
  end

  def beginning
    IOAdapter.instance.output "[Добро Пожаловать]\n
    [1] - Начать новую игру\n
    [2] - Загрузить игру\n
    -----------------------------
    [exit]"
    beginning = IOAdapter.instance.input "\n[ВВЕДИТЕ ДЕЙСТВИЯ]: "
    case beginning
    when '1'
      @game.game_run
    when '2'
      SaveOrLoad.new.load(@character)
      @game.game_run
    when 'exit'
      IOAdapter.instance.output 'До встречи!'
      exit
    end
  end
end
