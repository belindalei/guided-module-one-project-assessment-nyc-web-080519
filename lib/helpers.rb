module Sanitize
    #get the user input and sanitize and return
    def get_num(min, max, msg = "Invalid input. Try again.")
        while true
            user_input = gets.strip
            if user_input == "" || !user_input.match?(/\A-?\d+\Z/) || user_input.to_i < min || user_input.to_i > max
                puts msg 
                next 
            end 
            return user_input.to_i 
        end
    end
end