class Game

    def new_grid

            grid = {}
            9.times{|item| grid[item+1] = item + 1}
            return grid

    end

    def draw_grid(grid_hash)

        puts "#{grid_hash[1]} | #{grid_hash[2]} | #{grid_hash[3]}" 
        puts "--+---+--" 
        puts "#{grid_hash[4]} | #{grid_hash[5]} | #{grid_hash[6]}" 
        puts "--+---+--" 
        puts "#{grid_hash[7]} | #{grid_hash[8]} | #{grid_hash[9]}" 

    end

end

def winner(grid)

    case1 = grid[1] == grid[2] && grid[1] == grid[3]
    case2 = grid[4] == grid[5] && grid[4] == grid[6]
    case3 = grid[7] == grid[8] && grid[7] == grid[9]

    case4 = grid[1] == grid[4] && grid[1] == grid[7]
    case5 = grid[2] == grid[5] && grid[2] == grid[8]
    case6 = grid[3] == grid[6] && grid[3] == grid[9]

    case7 = grid[1] == grid[5] && grid[1] == grid[9]
    case8 = grid[7] == grid[5] && grid[7] == grid[3]

    case1 || case2 || case3 || case4 || case5 || case6 || case7 || case8

end

def start_game

    game = Game.new
    grid = game.new_grid
    player_number = 1
    player_symbol = "X"
    game.draw_grid(grid)

    loop do

        #game.draw_grid(grid)
        puts "Player #{player_number} select cell (exit to terminate):"
        input = gets.chomp
        cell = input.to_i

        if grid.has_key?(cell)  && grid[cell] != "O" && grid[cell] != "X"

            grid[cell] = player_symbol
            game.draw_grid(grid)
            if winner(grid)
                puts "Player #{player_number} is the winner!!!"
                break
            end

            if player_number == 1
                player_number = 2
                player_symbol = "0"
            else
                player_number = 1
                player_symbol = "X"
            end

        else
            exit if input == "exit"
            game.draw_grid(grid)
            puts "Something went wrong with your selection, try again!"
            next
        end

    end

end


def boot_game

    loop do
        puts "start a new Game? y/n"
        response = gets.chomp.downcase
        
        case response
        when "n"
            puts "Leaving....."
            exit

        when "y"
            puts "Starting a new game"
            start_game            

        end

    end

end

boot_game
