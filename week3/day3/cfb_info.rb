require 'rubygems'
require 'bundler/setup'
require 'tty'
require 'active_record'
require 'pry'
require 'sqlite3'
require_relative 'team'
require_relative 'conference'

# require_relative 'mascot'


ActiveRecord::Base.logger = Logger.new(STDOUT)

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => 'example.sqlite3'
)

binding.pry

Team.order(wins: :desc).each do |team|
  puts "#{team.name} has won #{team.victories} games."
end

Conference.all.each do |conf|
  puts conf.name
end

prompt = TTY::Prompt.new

if prompt.yes?("Would you like to add a team?")
  name = prompt.ask("What's your team name?")
  state = prompt.ask("What state are they in?")
  wins = prompt.ask("How many wins do they have?")
  team = Team.create(name: name, state: state, wins: wins)
  puts "We added #{team.name} to our database! Thank you!"
else
  puts "Goodbye"
end

# Today's pry
# team = Team.first
# exit
# Team.first
# Team.last
# Team.where("state = MN").first
# Team.where("state = 'MN'").first
# Team.where(state: "MN").first
# Team.sum(:wins)
# Team.where("wins < ?", 300).sum(:wins)
# Team.where("wins < ?", "300").sum(:wins)
# team = Team.new
# team.name = "Arizona"
# team.state = "AZ"
# teams.wins = 243
# team.wins = 243
# team
# team.save
# team
# exit
# Team.last
# team = Team.new(name: "Nebraska", state: "NE", wins: 321)
# team.persisted?
# team.save
# team.persisted?
# team2 = Team.create(name: "Auburn", state: "AL", wins: 213)
# team3 = Team.new(name: "Arizona State", state: "Arizona", wins: 123)
# team3.save
# team2 = Team.save(name: "Alabama", state: "AL", wins: 413)
# team2 = Team.new.save(name: "Alabama", state: "AL", wins: 413)
# team2 = Team.new(name: "Alabama", state: "AL", wins: 413).save
# team2.wins
# bama = Team.find(14)
# bama.wins
# bama.wins = 526
# bama.save
# team = Team.find(13)
# team
# team.destroy
# Team.count
# Team.where(state: "AZ").count
# Team.where(state: "AL").count
# Team.where(state: "AL").order(:wins)
# Team.where(state: "AL").order(:wins).class
# Team.where(state: "AL").order(wins: :desc)
# Team.where(state: "AL").order("RAND()")
# Team.where(state: "AL").order({wins: :desc})
# Team.where("state = 'AL'").order({wins: :desc})
# Team.where("state == 'AL'").order({wins: :desc})
# state = "AL"
# Team.where(["state = ?", state]).order({wins: :desc})
# state = "AL; DROP TABLE teams; --"
# Team.where("state = ?", state).order(wins: :desc)
# exit
# devils = Team.where(name: "Arizona State").first
# devils.state = "AZ"
# devils.save
# devils.update(state: "AK")
# exit
# Team.first
# wvu = Team.first
# wvu.conference
# wvu.conference_id
# wvu.conference
# exit
# conf = Conference.last
# conf.teams
# conf.team
# exit
# conf = Conference.new(name: "SEC")
# conf.save
# conf
# conf.persisted?
# teams = Team.where(state: "AL")
# teams.each do |t|
#   t.conference_id = conf.id
#   t.save
# end
# conf.teams
# unaffiliated = Team.where(conference: nil)
# az_st = Team.find 12
# az_st.update(state: "AZ")
# pac_12 = Conference.where(name: "Pac12").first
# az_teams = Team.where(state: "AZ")
# az_teams.each do |team|
#   pac_12.teams << team
# end
# pac_12
# unaffiliated = Team.where(conference: nil)
# huskers = Team.find(10)
# huskers.conference
# huskers.conference = Conference.where(name: "B1G").first
# huskers
# huskers.conference = Conference.where(name: "B1G")
# huskers.conference = Conference.find_by(name: "B1G")
# huskers.save
# conference = Conference.create(name: "CUSA")
# conference
# conference.teams
# conference.teams << Team.find_by(name: "Marshall")
# exit
# conf = Conference.last
# team = {name: "Tennessee", state: "TN", wins: 234}
# vols = Team.new(team)
# vols.conference = Conference.find_by(name: "SEC")
# vols
# vols.save
# vols
# secsec = Conference.find_by(name: "SEC")
# secsec.teams.count
# secsec.teams.where("wins > ?", 200).count
# secsec.teams.where("wins > ?", 300).count
# secsec.teams.where("wins > ?", 300)
# secsec.teams.where("wins > ?", 300).first
# unaffiliated = Team.where(conference: nil)
# unaf = Conference.create(name: "Independent")
# unaf.methods
# secsec[2]
# secsec[1]
# secsec[0]
# unaf
# unaf.teams <<  Team.where(conference: nil).first
# unaf.teams.count
# unaf.teams <<  Team.where(name: "Notre Dame").first
# unaf.teams.count
# acc = Conference.find_by(name: "ACC")
# acc.teams.count
# acc.teams.first
# exit
