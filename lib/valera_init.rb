class ValeraInit
  attr_accessor :money
  attr_reader :health, :mana, :happiness, :fatigue

  def initialize(health: 100, mana: 0, happiness: 0, fatigue: 0, money: 100)
    self.health = health
    self.mana = mana
    self.happiness = happiness
    self.fatigue = fatigue
    self.money = money
  end

  def dead?
    health <= 0 || happiness <= -10
  end

  def health=(value)
    @health = if value > 100
                100
              elsif value.negative?
                0
              else
                value
              end
  end

  def mana=(value)
    @mana = if value > 100
              100
            elsif value.negative?
              0
            else
              value
            end
  end

  def happiness=(value)
    @happiness = if value > 10
                   10
                 elsif value < -10
                   -10
                 else
                   value
                 end
  end

  def fatigue=(value)
    @fatigue = if value > 100
                 100
               elsif value.negative?
                 0
               else
                 value
               end
  end
end
