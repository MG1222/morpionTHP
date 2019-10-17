class Board

	attr_accessor :boardcase_array, :boardcase1, :boardcase2, :boardcase3, :boardcase4, :boardcase5, :boardcase6, :boardcase7, :boardcase8, :boardcase9
	attr_accessor :boardcase_value, :boardcase_id


	def initialize

		@boardcase_array = []

		@boardcase_array[0] = Boardcase.new(" ","A1")
		@boardcase_array[1] = Boardcase.new(" ","A2")
		@boardcase_array[2] = Boardcase.new(" ","A3")
		@boardcase_array[3] = Boardcase.new(" ","B1")
		@boardcase_array[4] = Boardcase.new(" ","B2")
		@boardcase_array[5] = Boardcase.new(" ","B3")
		@boardcase_array[6] = Boardcase.new(" ","C1")
		@boardcase_array[7] = Boardcase.new(" ","C2")
		@boardcase_array[8] = Boardcase.new(" ","C3")

	end 


	def show
		puts "A | #{@boardcase_array[0].boardcase_value} | #{@boardcase_array[1].boardcase_value} | #{@boardcase_array[2].boardcase_value} |"
		puts "-" * 16
		puts "B | #{@boardcase_array[3].boardcase_value} | #{@boardcase_array[4].boardcase_value} | #{@boardcase_array[5].boardcase_value} |"
		puts "-" * 16
		puts "C | #{@boardcase_array[6].boardcase_value} | #{@boardcase_array[7].boardcase_value} | #{@boardcase_array[8].boardcase_value} |"
		puts "    1    2    3"
	end 





	# on vérifie s'il y a au moins une case vide
	def is_full?
		
		@boardcase_array.each {|element| 
			if element.boardcase_value == " "
				return false
				exit
			end
		}
		# s'il n'y a aucune case vide la grille est pleine
		return true

	end 

	def three_symbol_aligned?(value_X_O) # un joueur a gagné s'il a aligné trois symbol/8 possibilités. 
		if @boardcase_array[0].boardcase_value == value_X_O && @boardcase_array[1].boardcase_value == value_X_O && @boardcase_array[2].boardcase_value == value_X_O 
			return true
		elsif @boardcase_array[3].boardcase_value == value_X_O && @boardcase_array[4].boardcase_value == value_X_O && @boardcase_array[5].boardcase_value == value_X_O 
			return true
		elsif @boardcase_array[6].boardcase_value == value_X_O && @boardcase_array[7].boardcase_value == value_X_O && @boardcase_array[8].boardcase_value == value_X_O 
			return true
		elsif @boardcase_array[0].boardcase_value == value_X_O && @boardcase_array[3].boardcase_value == value_X_O && @boardcase_array[6].boardcase_value == value_X_O 
			return true
		elsif @boardcase_array[1].boardcase_value == value_X_O && @boardcase_array[4].boardcase_value == value_X_O && @boardcase_array[7].boardcase_value == value_X_O 
			return true
		elsif @boardcase_array[2].boardcase_value == value_X_O && @boardcase_array[5].boardcase_value == value_X_O && @boardcase_array[8].boardcase_value == value_X_O 
			return true
		elsif @boardcase_array[0].boardcase_value == value_X_O && @boardcase_array[4].boardcase_value == value_X_O && @boardcase_array[8].boardcase_value == value_X_O 
			return true
		elsif @boardcase_array[6].boardcase_value == value_X_O && @boardcase_array[4].boardcase_value == value_X_O && @boardcase_array[2].boardcase_value == value_X_O 
			return true
		else
			return false
		end

	end 

   # virifie si c'est vide
	def update (player_id_choice, value_X_O)

		@boardcase_array.each {|element| 
			if element.boardcase_id == player_id_choice
				element.boardcase_value = value_X_O
				break
			end
		}

	end 
    # on vérifie l'id est ok 
	def is_case_correct?(player_id_choice)
		
		if ["A1", "a1", "A2", "a2", "A3", "a3", "B1", "b1", "B2", "b2", "B3","b3", "C1","c1", "C2","c2", "C3","c3"].include? player_id_choice
			# ok mais on vérifie que la case choisie par le joueur est bien vide
			@boardcase_array.each {|element| 
				if element.boardcase_id == player_id_choice && element.boardcase_value != " "
						puts "-> ! Cette case est déjà prise! <-"
						return false
						exit
				end
			}
			return true
		else
			puts "* NOP , s!"
			return false
		end

	end 



	def show
		puts "A | #{@boardcase_array[0].boardcase_value} | #{@boardcase_array[1].boardcase_value} | #{@boardcase_array[2].boardcase_value} |"
		puts "-" * 16
		puts "B | #{@boardcase_array[3].boardcase_value} | #{@boardcase_array[4].boardcase_value} | #{@boardcase_array[5].boardcase_value} |"
		puts "-" * 16
		puts "C | #{@boardcase_array[6].boardcase_value} | #{@boardcase_array[7].boardcase_value} | #{@boardcase_array[8].boardcase_value} |"
		puts "    1   2   3"
	end 



	def clear

		# on réinitialise toutes les cases du plateaux à vide " " 
		# appelé à chaque début de partie
		@boardcase_array[0] = Boardcase.new(" ","A1")
		@boardcase_array[1] = Boardcase.new(" ","A2")
		@boardcase_array[2] = Boardcase.new(" ","A3")
		@boardcase_array[3] = Boardcase.new(" ","B1")
		@boardcase_array[4] = Boardcase.new(" ","B2")
		@boardcase_array[5] = Boardcase.new(" ","B3")
		@boardcase_array[6] = Boardcase.new(" ","C1")
		@boardcase_array[7] = Boardcase.new(" ","C2")
		@boardcase_array[8] = Boardcase.new(" ","C3")

	end 

end # fin class Board