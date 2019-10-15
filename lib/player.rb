class Player
    attr_accessor :name, :life_points
    
    def initialize(name)
        @name = name
        @life_points = 10
    end
   
    def show_state
        puts "#{@name} a #{@life_points} points de vie"
    end

    def gets_damage(damage_rec)
        @life_points = @life_points - damage_rec
        if @life_points <= 0
            puts "Le joueur #{@name} a été tué !"
        end    
    end
    
    def attacks(player)
        puts "Le joueur #{@name} attaque le joueur #{player.name}"
        lost=compute_damage
        puts ":il lui inflige #{lost} points de dommages"
        player.gets_damage(lost)
    end

    def compute_damage
        return rand(1..6)
    end

 end