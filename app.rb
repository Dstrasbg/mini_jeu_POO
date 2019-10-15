require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'
#fait appel aux fichiers dans le dossier lib

player1 = Player.new("Josiane") #notre 1er joueur
player2 = Player.new("José") #notre 2eme joueur

while player1.life_points > 0 && player2.life_points > 0
    #le jeu continue tant qu'un reste vivant, au moins 1 vie restant

puts "\n Voici l'état de chaque joueur"
#solde de vies pour chacun 
player1.show_state
player2.show_state

puts "\n Passons à la phase d'attaque :"
#phase de reduction du solde de vies
player1.attacks(player2)

break if player2.life_points <= 0
#s'arrete si le joueur 2 n'a plus de vies

player2.attacks(player1) 
#attque de retour du 2e sur le 1er

end

binding.pry 
#appel gem pry pour tester l'app