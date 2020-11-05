require 'pry'
def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end

def players
  players = game_hash[:home][:players] + game_hash[:away][:players]
end

def num_points_scored player_name
  players.each do |hash|
    hash.each_value do |v| 
      if v == player_name
        return hash[:points]
      end
    end
  end
end

def shoe_size player_name
  players.each do |hash|
    hash.each_value do |v| 
      if v == player_name
      return hash[:shoe]
      end
    end
  end
end

def team_colors team_name
  game_hash.each_key do |k|
    if game_hash[k][:team_name] == team_name
      return game_hash[k][:colors]
    end 
  end  
end  

def team_names
  array = []
  game_hash.each_key do |k|
    array << game_hash[k].fetch(:team_name)
  end
  array
end

def player_numbers team
  array = []
  game_hash.each_key do |k|
    if game_hash[k][:team_name] == team
      game_hash[k][:players].each do |hash|
        array << hash[:number]
      end
    end  
  end 
  array
end

def player_stats name
  game_hash.each do |k,v|
    game_hash[k][:players].each do |hash| 
      return hash if hash[:player_name] == name 
    end
  end  
end

def big_shoe_rebounds
  players.max_by{|hash| hash[:shoe]}[:rebounds]
end  

def most_points_scored
  players.max_by{|hash| hash[:points]}[:player_name]
end  

def winning_team
  home_points = 0
  away_points = 0
  game_hash[:home][:players].each do |hash|
    home_points = home_points + hash[:points]
  end
  game_hash[:away][:players].each do |hash|
    away_points = away_points + hash[:points]
  end
  home_points > away_points ? game_hash[:home][:team_name] : game_hash[:away][:team_name]
end  

def player_with_longest_name
  players.max_by {|hash| hash[:player_name].length}[:player_name]
end  

def long_name_steals_a_ton?
  players.max_by {|hash| hash[:steals]}[:player_name] == player_with_longest_name
end
