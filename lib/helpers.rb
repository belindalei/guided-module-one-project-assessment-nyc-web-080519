
def sanitize(min, max, msg = "\n\nInvalid input. Try again.".red)
    while true
        user_input = gets.strip
        if user_input == "" || !user_input.match?(/\A-?\d+\Z/) || user_input.to_i < min || user_input.to_i > max || user_input == nil
            puts msg 
            next 
        end 
        return user_input.to_i 
    end
end


def return_main_menu(job_id, job_seeker)
  if job_id == 0
      clear 
      puts "Welcome back to the main menu."
      main_menu(job_seeker)
  end
end


def exists_in_database(job_seeker, msg)
  liked_job_list = job_seeker.liked_jobs.map do |liked_job|
    liked_job.id
  end
  while true 
    puts msg 
    id_num = sanitize(0,10000)
    if !liked_job_list.include?(id_num)
      next 
    end
    return id_num 
  end 
end
