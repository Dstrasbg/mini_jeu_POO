require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'
#fait appel aux fichiers dans le dossier lib

puts "--------------------------------------------------"
puts "| Bienvenue sur 'ILS VEULENT TOUS MA POO'  !     |" 
puts "| Le but du jeu est d'être le dernier survivant !|"
puts "--------------------------------------------------"

user=HumanPlayer.new(name)
puts "Ton prénom ?"
print ">"
user.name=name
player1 = Player.new("Josiane") #notre 1er joueur
player2 = Player.new("José") #notre 2eme joueur

while user.life_points >0 && (player1.life_points > 0 || player2.life_points> 0)
    #le jeu continue tant qu'un reste vivant, humain ou enemies
    
    user.show_state #vies de l'humain

    puts "\n Quel action veut tu effectuer ?"
    puts "a - chercher une meilleure arme"
    puts "s-chercher à se soigner"

    puts "\n Attaquer un joueur en vue :"
    puts "0 -"
    player1.show_state
    puts "1 -"
    player2.show_state
    #solde de vies pour chacun

    print ">"
    choix=choix
    if (choix = a)
        search_weapon
    elseif (choix= s)
        search_health_pack
    elseif (choix= 0)
        user.attacks(player1)
    elseif (choix=1)
    choix.attacks(player2)        
    end

puts "\n Les autres joueurs t'attaquent !!"
player1.attacks(user)
player2.attacks(user) # manque l'array....

break if player2.life_points <= 0 || player1.life_points<=0
#s'arrete si un enemi n'a plus de vies

puts  "La partie est finie"
if user.life_points > 1
    puts"BRAVO ! TU AS GAGNE !"
else puts "Loser ! Tu as perdu !"
    end
end


binding.pry #appel gem pry pour tester l'app