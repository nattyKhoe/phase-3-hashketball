# Write your code below game_hash
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

require "pry"
# Write code here
# Helpers code
def all_players
  game_hash[:home][:players].concat(game_hash[:away][:players])
end

def find_player (name)
  all_players.find {|player| player[:player_name] == name}
end

def num_points_scored (name)
  find_player(name) [:points]
end

def shoe_size (name)
  find_player(name) [:shoe]
end

def find_team (name)
  game_hash.find {|location, team_data| team_data[:team_name] == name} [1]
end

def team_colors (name)
   find_team(name) [:colors]
end

def team_names
  team = [] 
  game_hash.each {|location, team_data| team << team_data[:team_name]}
  team
end

def player_numbers (name)
  numbers = []
  find_team(name) [:players].each{|player| numbers << player[:number]}
  numbers
end

def player_stats (name)
  all_players.find{|player| player[:player_name] == name}
end

def find_biggest_shoe
  big_foot = all_players.first
  all_players.each do |player|
    if player[:shoe] > big_foot[:shoe]
      big_foot = player
    end
  end
  big_foot
end

def big_shoe_rebounds
  find_biggest_shoe[:rebounds]
end

def most_points_scored
  winner = all_players.first

  all_players.each do |player|
    if player [:points] > winner [:points]
      winner = player
    end
  end

  winner [:player_name]
end

def winning_team
  home_score = 0
  away_score = 0

  game_hash[:home][:players].each do |player|
    home_score = home_score + player[:points]
  end
  game_hash[:away][:players].each do |player|
    away_score = away_score + player[:points]
  end

  if home_score > away_score 
    game_hash[:home][:team_name]
  elsif away_score < home_score
    game_hash[:away][team_name]
  else
    "It is a draw"
  end
  
end

def player_with_longest_name
  name = all_players.first[:player_name]

  all_players.each do |player|
    if player[:player_name].length > name.length
      name = player[:player_name]
    end
  end

  name
end

def long_name_steals_a_ton?
  thief = all_players.first

  all_players.each do |player|
    if player [:steals] > thief [:steals]
      thief = player
    end
  end

  thief[:player_name] == player_with_longest_name

end

puts long_name_steals_a_ton?


