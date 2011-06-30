module CharactersHelper
  
  def base_value_of(stat)
    current_user.character.send(stat.to_sym)
  end
  
  def bonus_value_of(stat)
    bonus = current_user.character.send(stat.to_sym) - Character::BASE_STAT
    if bonus > 0
      #"<span class='positive'>+#{bonus}</span>"
      "+#{bonus}"
    elsif bonus < 0
      "-#{bonus}"
      #"<span class='negative'>-#{bonus}</span>"
    else
      0
    end
  end
  
  def total_value_of(stat)
    current_user.character.send(stat.to_sym)
    # current_user.character.send(stat.to_sym) + current_user.character.send("bonus_#{stat}".to_sym)
  end
end
