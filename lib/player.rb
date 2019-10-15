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


class HumanPlayer < Player
    attr_accessor :weapon_level
    #habilité à lire et écrire

    def initialize(name, weapon_level=1, life_points=100)
        @life_points = life_points
        @weapon_level = weapon_level
    end

    def show_state #annonce à l'humain ses points de vie et niveau de son arme
        puts "#{name} a #{life_points} points de vie et une arme de niveau #{weapon_level}"
    end

    def compute_damage #arme de l'humain upgrated!
        rand(1..6) * @weapon_level
    end
    
    def search_weapon
        test = rand(1..6)
        puts "Tu as trouvé une arme de niveau #{test}"
        if (test > @weapon_level)
            #prendre ou laisser le nouvelle arme
            puts "Youhou! elle est meilleure que ton arme actuelle : tu la prends."
            @weapon_level = test
        else
            puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
        end
    end

    def search_health_pack
        test = rand(1..6)
        if (test = 1)
            puts "Tu n'as rien trouvé... "
        elseif (test >=2 && test <= 5)
            user.life_points=life_points+50
            puts "Bravo, tu as trouvé un pack de +50 points de vie !"
        elseif (test test =6)
            life_points=life_points+50
            user.puts "Waow, tu as trouvé un pack de +80 points de vie !"
        end
    end

  end