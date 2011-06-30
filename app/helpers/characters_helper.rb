module CharactersHelper
  
  def base_value_of(stat)
    current_user.character.send(stat.to_sym)
  end
  
  def bonus_value_of(stat)
    bonus = current_user.character.send("bonus_#{stat}".to_sym)
    # capture_haml do
    #   # haml_tag :span, :class => "positive" do
    #   #   "+#{bonus}"
    #   # end
    # end
    if bonus > 0
      #"<span class='positive'>+#{bonus}</span>"
      "+#{bonus}"
    elsif
      "-#{bonus}"
      #"<span class='negative'>-#{bonus}</span>"
    else
      # 0 case
    end
  end
  
  def total_value_of(stat)
    current_user.character.send(stat.to_sym) + current_user.character.send("bonus_#{stat}".to_sym)
  end
end
