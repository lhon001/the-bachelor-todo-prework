require "pry"
def get_first_name_of_season_winner(data, season)
  data.each do |season_key, season_val|
    if season_key.to_s == season
      season_val.each do |contestant_info|
        if contestant_info["status"] == "Winner"
          name = contestant_info["name"].split(" ")
          return name[0]
        end
      end
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
  age = []
  data.each do |season_key, season_val|
    if season_key == season
      season_val.each do |contestant_info|
        age << contestant_info["age"].to_i
      end
    end
  end
  total = 0.0
  age.each do |num|
    total += num
  end
  (total / age.length).round
end
