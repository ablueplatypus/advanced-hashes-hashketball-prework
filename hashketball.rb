require "pry"
def game_hash
  basketball = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        "Reggie Evans" => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        "Brook Lopez" => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        "Mason Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        "Jason Terry" => {
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        }
      }
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        "Bismak Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10
        },
        "DeSagna Diop" => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        "Ben Gordon" => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        "Brendan Haywood" => {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 22,
          :blocks => 5,
          :slam_dunks => 12
        }
      }
    }
  }
end

def num_points_scored(player_names)
  game_hash.each do |location, team_data|
    team_data[:players].map do |names, stats|
      if names == player_names
        points_scored = team_data[:players][names][:points]
        return points_scored
      end
    end
  end
end

def shoe_size(player_name)
  game_hash.each do |location, team_data|
    team_data[:players].map do |names, stats|
      if names == player_name
        shoe_size = team_data[:players][names][:shoe]
        return shoe_size
      end
    end
  end
end

def team_colors(team_name)
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team_name
      return team_data[:colors]
    end
  end
end

def team_names
 game_hash.map do |location, team_data|
  team_data[:team_name]
 end
end

def player_numbers(team_name)
  jersey_numbers = []
 game_hash.map do |location, team_data|
   if team_data[:team_name] == team_name
     team_data[:players].map do |player_names, stats|
       players_numbers = team_data[:players][player_names][:number]
       jersey_numbers << players_numbers
     end
   end
 end
 return jersey_numbers
end

def player_stats(player_name)
 game_hash.each do |location, team_data|
   team_data[:players].map do |player_names, stats|
     if player_names == player_name
       return stats
     end
   end
 end
end

def big_shoe_rebounds
largest_shoe_size = 0
player_rebounds = 0
 game_hash.each do |location, team_data|
   team_data[:players].map do |player_names, stats|
     if stats[:shoe] > largest_shoe_size
       largest_shoe_size = stats[:shoe]
       player_rebounds = stats[:rebounds]
     end
   end
 end
return player_rebounds
end

def most_points_scored
  most_points = 0
  player_with_most_points = ""
  game_hash.each do |location, team_data|
    team_data[:players].map do |player_names, stats|
      if stats[:points] > most_points
        most_points = stats[:points]
        player_with_most_points = player_names
      end
    end
  end
  player_with_most_points
end

def winning_team
  home_team_points = 0
  away_team_points = 0
  winners = ""
    game_hash.each do |location, team_data|
      team_data[:players].each do |player_names, stats|
        if location == :home
          home_team_points += stats[:points]
        elsif location == :away
          away_team_points += stats[:points]
        end
      end
    end
    if home_team_points > away_team_points
      winners = game_hash[:home][:team_name]
    else
      winners = game_hash[:away][:team_name]
    end
    puts winners
end

def player_with_longest_name
  longest_name = ""
    game_hash.each do |location, teams|
      teams[:players].each do |player_names, stats|
        if player_names.length > longest_name.length
          longest_name = player_names
        end
      end
    end
    puts longest_name
end

def long_name_steals_a_ton
  most_steals = 0
  player_with_most_steals = ""
   game_hash.each do |location, teams|
     teams[:players].each do |player_names, stats|
       if stats[:steals] > most_steals
         most_steals = stats[:steals]
         player_with_most_steals =  player_names
       end
     end
   end
   if player_with_longest_name == player_with_most_steals
     puts true
   else
    puts false
   end
  puts player_with_most_steals
end
long_name_steals_a_ton
