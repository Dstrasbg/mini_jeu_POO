class Player
    attr_accessor :name, :life_points 
    #habilité à lire et écrire
    
    def initialize(name)
        @name = name
        @life_points = 10 
        #solde initial de vies=10
    end
   
    def show_state
        #afin de montrer les points de vies
        puts "#{@name} a #{@life_points} points de vie"
    end

    def gets_damage(damage_recived)

        @life_points = @life_points - damage_recived
        #solde de points de vie
        if @life_points <= 0 
            #plus moyen de continuer à jouer puisque le jouer est mort
            puts "Le joueur #{@name} a été tué !"
        end    
    end
    
    def attacks(player)
        #le combat commence l'un attaque l'autre
        puts "Le joueur #{@name} attaque le joueur #{player.name}"
        lives_lost=compute_damage 
        puts ":il lui inflige #{lives_lost} points de dommages"
        player.gets_damage(lives_lost)
        #celui qui recoit l'attaque perd des vies
    end

    def compute_damage
        #perte de vies au hazard entre 1 et 6
        return rand(1..6)
    end

end