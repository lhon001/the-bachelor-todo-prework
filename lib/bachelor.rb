require "pry"
def get_first_name_of_season_winner(data, season)
  data[season].each do |contestant_info|
    if contestant_info["status"] == "Winner"
      name = contestant_info["name"].split(" ")
      return name[0]
    end
  end
end

def get_contestant_name(data, occupation)
  data.each do |season_key, season_val|
    season_val.each do |contestant_info|
      if contestant_info["occupation"] == occupation
        return contestant_info["name"]
      end
    end
  end
end

def count_contestants_by_hometown(data, hometown)
  counter = 0
  data.each do |season_key, season_val|
    season_val.each do |contestant_info|
      if contestant_info["hometown"] == hometown
        counter += 1
      end
    end
  end
  counter
end

def get_occupation(data, hometown)
  #It returns the occupation of the first contestant
  #who hails from that hometown.
  data.each do |season_key, season_val|
    season_val.each do |contestant_info|
      if contestant_info["hometown"] == hometown
        return contestant_info["occupation"]
      end
    end
  end
end

def get_average_age_for_season(data, season)
  # Iterate through the hash and return the average age
  # of all of the contestants for that season
  age = 0
  counter = 0
  data[season].each do |key, value|
    age += key["age"].to_f
    counter += 1
  end
  (age / counter).round
end
