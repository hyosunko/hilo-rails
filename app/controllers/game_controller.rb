class GameController < ApplicationController
    def try

        cookies[:name] = params[:name] unless params[:name].nil?
        cookies[:counter] = cookies[:counter] == nil ? 0: cookies[:counter].to_i+1

        @guess = params[:guess].to_i unless params[:guess].nil?
        cookies[:secret_number] = rand 100 if cookies[:secret_number].nil?
        
        if @guess.nil?
            @result_string = ""
            cookies[:last_counter] = cookies[:counter]
        elsif @guess > cookies[:secret_number].to_i
            @result_string = "Your number is too high"
            cookies[:last_counter] = cookies[:counter]
        elsif @guess < cookies[:secret_number].to_i
            @result_string = "Your number is too low"
            cookies[:last_counter] = cookies[:counter]
        elsif @guess == cookies[:secret_number].to_i
            @result_string = "YOU WON. Please enter another number to play new game."
            cookies[:secret_number] = rand 100
            cookies[:counter] = 0
        else
            @result_string = "Wrong number, please enter number between 1 and 100."
        end

        render 'try.html.erb'
    end
    
end