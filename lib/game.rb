class Game

    attr_accessor :player1, :player2, :board, :player_turn

    def initialize

        system("clear")
      # debut de jeu
        puts "-" * 50
        puts "           Bienvenue     "
        puts "Vous etez pret a juer TIC TOC TOE ? "
        puts "-" * 50

    # chaque joueur choisi un nom
        puts " * Chosis to pseudo ?"
        print "> "
        name = gets.chomp
        @player1 = Player.new(name, "X")
        puts " * Et ton pseudo ?"
        print "> "
        name = gets.chomp
        @player2 = Player.new(name, "O")
    # affichage du plateau avec le numéro des cases
        @board = Board.new
        @board.show

        puts " "
        puts " * #{@player1.name} vous aurez les pions X :)"
        puts " * #{@player2.name} vous aurez les pions O :)"
        puts " ~ ~ Bonne chance ~ ~"

    end 

    def first_player
        # pour la première partie on tire au sort le joueur qui commence, ensuite on alternera
        y = rand(1..2)
        y == 1 ? @player_turn = @player1 : @player_turn = @player2
        puts " * Après tirage au sort, c'est #{@player_turn.name} qui commence à jouer"
        puts " "
    end

    def play_turn
        # on récupère le choix du joueur
        puts " "
        puts " * #{@player_turn.name}, dans quelle case tu veux aller ?"
        player_id_choice = gets.chomp
        # on demande au joueur de rentrer une nouvelle case tant que celle-ci n'est pas correcte
        while @board.is_case_correct?(player_id_choice) == false
            player_id_choice = gets.chomp
        end
        # on met à jour la grille avec l'entrée choisie par le joueur
        # si c'est le tour du joueur1 on passe "X", si c'est le tour du joueur2 on passe "O"
        value_X_O = @player_turn.symbol  
        @board.update(player_id_choice, value_X_O)

        # on affcihe la grille du TTT mis à jour
        @board.show

    end 

    # on change de joueur à chaque coup
    def change_player
        
        if @player_turn == @player1
            @player_turn = @player2
        elsif @player_turn == @player2
            @player_turn = @player1
        end

    end 

    def player_won?
        # le jeu est terminé si le joueur qui vient de poser un pion a gagné, c'est à dire s'il a réussi à aligner trois pions
        # si c'est le tour du joueur1 on passe "X", si c'est le tour du joueur2 on passe "O"
        # si le joueur a gagné on retourne true, sinon on retourne false
        value_X_O = @player_turn.symbol
        if @board.three_symbol_aligned?(value_X_O) == true
            puts "-" * 40
            puts " ~ ~ ~ BRAVOOOO !!! TU AS GAGNE :) ~ ~ ~ "
            puts "-" * 40
            # on incrémente le score du joueur gagnant de 1
            if @player_turn == @player1
                @player1.score = @player1.score + 1
            elsif @player_turn == @player2
                @player2.score = @player2.score + 1
            end
            return true
        else
            return false
        end 

    end
    # le jeu n'est pas terminé tant qu'il reste au moins une case vide
    def is_still_going?
        if @board.is_full? == false
            return true
        else
            puts "-" * 35
            puts "Le jeu est terminé! Tous les pions ont été placés. "
            puts "         Mais !!! PERSONNE A GARGNE :(             "
        end

    end 
 
 

    def launch_new_game?
        puts "----  ENCORE ? :D ? (y/n)  -----"
        player_yn_choice = gets.chomp

        # on vérifie que la réponse 
        until ["y", "n", "Y","N"].include? player_yn_choice
            puts "Ceci n'est pas une valeur valable! Répondez par y/n."
            player_yn_choice = gets.chomp
        end

        if player_yn_choice == "y" or player_yn_choice == "Y"
            puts "","C'est parti pour un nouveau tour!"
            puts "SCORE #{player1.name} = #{player1.score} partie(s) gagnée(s)"
            puts "SCORE #{player2.name} = #{player2.score} partie(s) gagnée(s)"
            # on réinitialise toutes les cases du plateaux à vide " " pour la nouvelle partie
            @board.clear
            # on rappelle les id de toutes les cases de la grille
            @board.show_id
            return true
            #sinon
        else player_yn_choice == "n" or player_yn_choice == "N"
            puts " * * *   A bientôt :)  * * * "
            return false
        end


    end 
end # fin classe Game