class JobSeeker < ActiveRecord::Base
    has_many :liked_jobs
    has_many :open_jobs, through: :liked_jobs

    @@base_url = "https://data.cityofnewyork.us/resource/kpav-sd4t.json?"

    def self.create_profile(name)
        puts "What is your minimum annual salary requirement? (Between $0-$300000)"
        salary = Sanitize.get_num(0, 300000, "\nInvalid entry. Your salary needs to be an integer between 0-300000.")
        puts "What is your government job/GS level? GS levels consist of 15 grades with 1 being the lowest and 15 being the highest."
        level = get_num(1, 15, "Please input a GS level between 1-15 with 1 being the entry level position and 15 being the most senior position.")
        new_job_seeker = JobSeeker.create(name: name.capitalize, desired_salary: salary, level: level)
        puts `clear`
        puts "Hello, #{new_job_seeker.name}. You've just created a new profile."
        new_job_seeker 
    end

    def get_matches
        job_data = JSON.parse(RestClient.get(@@base_url))
        
        matches = job_data.select do |job|
            job["salary_range_from"].to_i >= self.desired_salary
        end.uniq {|job| job["job_id"]}.take(15).sort_by {|job| job["salary_range_from"].to_i}.reverse

        table = Text::Table.new
        table.head = ["Job ID", "Job Title", "Salary From", "Salary To", "Location"]

        matches.each do |match|
           table.rows << [match['job_id'], match['business_title'],
            '$' + match['salary_range_from'],
            '$' + match['salary_range_to'],
            match['work_location']]
        end
        table.to_s
    end

    def like_job(job_id)
        job_data = JSON.parse(RestClient.get("#{@@base_url}job_id=#{job_id}"))[0]
        if job_data == nil
            return "Job ID does not exist in the database. Please try again."
        end
        new_job = OpenJob.create(
            title: job_data["business_title"],
            description: job_data["job_description"],
            level: job_data["level"],
            salary_range_from: job_data["salary_range_from"],
            salary_range_to: job_data["salary_range_to"],
            api_job_id: job_data["job_id"]
        )
        LikedJob.find_or_create_by(open_job_id: new_job.id, job_seeker_id: self.id)
        return "\n#{job_id} - #{new_job.title} added!"
    end

    def remove_liked_job(liked_job_id)
        self.liked_jobs.select do |liked_job|
            liked_job.id == liked_job_id
        end[0].destroy
    end

    def display_liked_jobs
        table = Text::Table.new
        table.head = ["Job ID", "Title", "Notes", "Salary Range From", "Salary Range To"] #"Level"
        self.liked_jobs.reload.each_with_index do |liked_job, i|
            open_job = OpenJob.where(id: liked_job.open_job_id).first
            table.rows << [liked_job.id, open_job.title, liked_job.notes, "$" + open_job.salary_range_from.to_s, "$" + open_job.salary_range_to.to_s]
        end
        return "\nYou have #{self.liked_jobs.count} liked jobs in your list: \n\n" + table.to_s + "\nThe above are your liked jobs.\n\n"
    end
    
    def add_notes(liked_job_id, notes)
        self.liked_jobs.select do |liked_job|
            liked_job.id == liked_job_id
        end[0].update(notes: notes)
    end

    def self.nightmare_visit
        puts "Goodnight! Sleep Tight!"
        sleep(3)
        puts `clear`
        puts "Goodnight!!! Sleep Tight!!!"
        sleep(3)
        puts `clear`
        puts "HAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAH"
        sleep(3)
        puts "SLEEP SLEEP SLEEP SLEEP SLEEP SLEEP SLEEP SLEEP"
        sleep(3)

        puts <<-CLOWN
        `+xxMMMMMMMMMxMMMMMxxxxWWxxxxxMMMWMMWWWWnzxWMMMxMMMMMMMMMxxxxxxxxxxxnnnnnnnnnnnxxxxxxnnMWMWMMMMWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW
        .nxMMMMMMMMMxMMMMMMxMxWWxxxxMMMWWWWWWMxWWWWWMMMWMWWWWWMMMMMxxMxxxxxxxxxxxxxxxxxxxxxxxMMMMMMMMWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW
         +nxxMMMMMMMxMMMMMMxMxWWxxMMMWWWWWWWWWWWWWWWWWWMMWWWWMMMMMMMMMMxxxxxxxxxxxxxxxMMMMxMxxxMMxxMWWMMMWWMWWWWWWWWWWWWWWWWWWWWWWWW
         `+nxxMMxxMMxMMMMMxxMxWWxMMxMWWWWWWWWWWWWWWWWWMMMMMMMMWMMMMMMMMMMxxxxxxxxxxxxxxMMMMxxxxMxMMMMMMMMMMMWWWWWWWWWWWWWWWWWWWWWWWW
           ;nxxxxMxMxMMxMMxxMxWWMMMMWWWW@WWWWWWWWWWWWWWWMWMMMMMMMMMMxxMMMxxxxxxnnxxxxMMMMMMxxxxxxMxMxxxxMMMMWMWMWWWWW@WWWWWWWWWWWWWW
            .*xxxxxxxMMxxMxMMxWWxxMMWWWWWWWWW@WWWWWWWMMMMMMxxxxxxxxxxxxxxxxxxxxnnxxxxMxMMMMxxxxnxxxxxnnxxxMMMWMMWWWWWWWWWWWWWWWWWWWW
              ;xxxxxxMMxMMxxMMW@xxMMWWW@WW@W@@@WWMMMMxxxxxxxxxxnnxxnxxxxxxxxMMMz*i;:,.,:i+nxxxnxxxxxnnnnxxxxMMMMWWWWWWWWWWWWWWWWWWWW
              `innxxxMMMMMxxMxWWxxMWWW@@@W@@@WWWMMMxxxxxnnxnnnnnnnnnnnnxxxxxn*,`          `,inxxxxxxnnxxxnxxxxMMMMWWWWWWWWWWWWWWWWWW
                *xxxxMMMMMxxMxWWxxMW@@@@@@@WWWMMMMxxxxxxnxnnnnnnnnnnnxxxxxni`              ```;znxxxxxxxxxxxxxxxMMMMWMMMWWWWWWWW@WWW
                inxxxMMMMMxxMxWWxxMW@@@@@@WWWWMMMMxxxxnnnnnnnnnnnnnnnxxxni``                   .*nxxxnnnnxxnxxxxxxxMxMMWWWWW@WWW@@@W
                ,znxxMMMMMxxMMW@xxWW@@@@WWWWWWMMMMxxxxnnnnnnnnnnnnnnnxnz,``            ` ````` ``;nxnnnnnnnnnnxxxxxxxxMMMWWWWW@@@@@W
                 inxxxMMMMxxMx@@MMMM@@@@WWWMWMMMMMxxxxnnnnnnnnnnnnnnnx#.`              ` `````````:znxnnnnnnnnxnnnnxxxxMMMWWW@@@@@WW
                 `#nxxxMMMxxMx@@MMWM@@@WWWWWWMWMMxxxxnnnnnnnnnnnnnnxx+````             ````````` ``,znnnnnnnnnxnnnnnxxxMMMWWWWW@@@WW
                  `#nxxxxxxxMxW@MMWW@@WWWWWWMWMMxxxnnnnnnnnnnnnnnnnnz.`           ``````````````````:nxxxnnnnnnnnnnnxxxxMMMMWWWWW@@W
                   .+nxxxxxxMM@@MMWx@WWWWWWWWMMMxxnnnnnnnnnnnnnnnnnn:``           ` `````````````````*xxnxnnnnnnnnnnnnxxxxMMMMWWWW@W
                    .#nnxxxxMxW@MMWxWWWWWWWMMMMxxxnnnnnnnnnnnnnnnnn#````         ````````````````````.nxxxxnnnnxnnnnnnnnxxxMWWWWWWWW
                     .znxxxxMxW@MMWxWWWWWWMMMMxxxxnnnnnnnnnnnxnnnxn:`````` ```  ```````..`........````ixxxxxnnnxnnnnnnnnnxxxMWWWWWWW
                      ;znxxxMMW@MMWx@WWWWWMMMMxxxnnnnnnnnnnnnnnxnxz```     ``   ```````.............``.nnxxxnnnnnnnnnnnnnnxxxMMWWWWW
                      `+znxxMMWWMMWn@@WWWMMMMMxxnnnnnnnnnnnnnnnnnn*```   ``    ``````................``+xxxnnnnnnnnnnnnnnnnnxxxMMWWW
                       ,znnxxMWWMMWxWWWWWMMMMxxxxnnnnnnnnnnnnnnnnn;``  ```    ` ````.................`.ixxxxnnnnnnnnnnnnnnnnnxxxMMMW
                       `+nnxxMWWMMWWWWWWWMMMxxxxxnnnnnnnnnnnnnnnnz,``        `  ````...................:xxxxxnnnnnnnnnnnnxnnnnxxxMMM
                        :znxxxWWMWW@WWWMMMxxxxxnnnnzznzznnnnnnnnnz.``         `````````................,nxxxxxnnnnnnnnnnnnnnnnnnxMMM
                        `#nnxxWWWWWWWWWMMxxxxnnnnnnznnnnnnnnnnnnnz`````        ````````...............,,#xxxxxxxnnnnnxnnnnnnnnnnnxxM
                         ;znxxWWWWWWWWMMMxxxxnnnnnnnnnnnnnnnnnnxx#``            `````````.............,,#xxxxxnxxnnnnnnnnnnnnnnnnnxx
                         `#nxMWWWWWWWMMMxxxxxxnnnnnnnnnnnnnnnnnnn+```            ````````.........,,..,,+xxnxxnnnnnnnnnnnnnnnnnnnnnn
                          innMWWWWWWWMMMxxxxxxnnnnnnnnnnnnnnnnnnx+``        ````````...............,,,,,+xxxnnnnnnnnnnnnnnnnnnnnnnnz
                          .zxMWWWWWMWMMMMxxxxxnnnnnnnnnnnnnnnnnnx+`         ``  `````..............,,,,,#xnnnnnnxnnnnnnnnnnnnnnnnnnn
                           +xMWWMMMMMMMMMMxxxxnnnxnnnnnnnnnnxnnxx#``            ```````............,,,,:nxxnnxnnnnxnnnnnnnnnnnnnnnnn
                           :#xMMMMxMMMMxxxxxxnxxnnnnznnnnnnnnnnnn#`               ``````......,,,.,,,,,;nxxxxxxnnnnxnnnnnnnnnnnnnnnz
                           .+nMMMMMMMMxxxxnxnxnnnzznznnnnznnzzzzzz:                     ```..:;;,....,:i#xxxxxnnnnnnnnnnnnznnnnnzzz#
                           .#nMxxMMMMMxxxxxxnnnnnnnnnnnnxnnnnnnnxx+       .,.`     `   ```.,:#z#+....,:#nxxnnnnnnnnnnnnnnnnnnnnznnz#
                           `+zxxxMMMMMMxxxxxxxnnnnnnnxxnnnnnnnxxxxn.`    ,::i#i````.......,*z;,.,i:..::zxxxxxxxxxxnnnxxxnnnznnnnnnnn
                           `iznxMMMxxxxxxxxxxxnnnnxxxnnxxxxnnxxxxxx;`   ,.   .+#,..,,,,,,;##:,,,.`:..,:xxxxxxxxxxxxxxxxxxxxnnnnnnnnn
                           `:#znxxxxxxxxxxxxxxnnxxxnnxxxxxxxxxxxxxx#`   .  ``.:+n;::;:;;i#ni;ii;:,....:xMxxxxxxxxxxxxxxxxxxxxxnnnnnn
                           `.;#nxxxxxxxxxxxxxxxxxxxnxxxxxxnxxxxxxxxn`    `..,::;+n*iiiii#x++**:;ii...,ixxMxxxxxxxxxxxxxxxxxxxnxnnnnn
                            ..iznnxnxxxxxxxxxxxxxxxxxxxxxnxxxxxxxxxx,   `..:##+*+zz+*i*+xzz*##zi#+;,..+xxxxxxxxxxxMMxxxxxxMxxxxxnnnn
                            `,,+zznxxz*#nxnnz+*+#nxxxxxxxxxxxxxxxMMMi  `..:znxx#*##+ii*+n##xMMxz*+i,..zMMxxxxxxxxxxMMxxxxxxxxxxxnnnn
                            `.,::,i+*:;+zzz+++i*+zxxxxxxxxxxxxxxxMMx+` `..zxMWWx#*#i`.;+##xMMWMnx+;,.,nxxxxxxMMMMMxMMxxxxxxxxxxxnnnn
                             .::;:;;;;*zzzz#####zznxxxxxxxxxxxxxxMMMn```.iz*xMn#xn#; `,i+xMzxMx+xz;,.,xMxxxxxMMMMMxMMMMxxxxxxxxxxnnn
                            `.:;*+*iii+nnxzzz##zzznMxxxxxxxxxxxMMMxMx,``.,#*#z++nn#, `.,;zxn#nzn+:,..:xMMxMxxxMMMMMMMMMMxxxxxxxxxxnn
                           `,iii+++i**#zxxxnz#z++#zxxxMxxxxxMMMMMMMMM;````.i#zz#+**` `..,+zzzn#ii..``:xxMMMMMxMMMMMMMMMMMxxxxxxxxxnn
                          .:i*+##z+i*+znxMxzz#+**zzxMxMMxxxxMMMMMMMMx;   `..ii*ii;``.;:,,;+++#i;:`  `,xMMMMMMMMMMMMMxxMMMMMxxMxxxxnn
                         .,;i*+#nn***#znxWxzz##i*#nxMMMMxxxMMMMMMMMMxi`   `.;.,;:`.+zzzzi.,ii*i;,. ``.xMMMMMMMMMMMMMMMMMMMMMxMxxxxxx
                        .:;ii+#nx#ii+znxWWxxn#++*#zxMMMMxMMMMMMMMMMMxi    ``...` `#znnnnni.`,,,,......xMMMMMMMMMMMMMMMMMMMMMxxMMMxxx
                       `,;i*+#znz+ii+znMWWWMn#+++#znMMMMMMMMMMMxMMMMxi    ````` `i##xxxxxn,```.,......xMMMMMMMMMWMMMMMMMMMMMMMMMMMxx
                      `,:;++zzz*****#zxn*zMMxz#+*+#zMMMMMMMMMMMMMMMMxi     ```  `znnxMMxxx*.```.,,,,.,xMWMMMMMMMWWWMMMMMMWMMMMMMxMxx
                      ,;:;##z#iii*++znx+::i#xn#+++#nxWWMxMMMMMMMMMMMx;         `,znxMMMMMMz:```..,,,.,xMWWMMMMMMWWWMMMMMMWWWMMMMMMMM
     `               `i;;*#z#iii;*#zznn;:::;izz++*+znMMMMMMMMMMMMMMMMi        `.:znxMMMMMMn*,....,,,,,MWWWWMWWMMMWWMMWMMMWWWWWMWMMMM
                     .+####ziii*i+#znn#::::;i*z#+*+#nMMMMWMMMMMxMMMMM*`      ``,,zxMMWWMMMzi*;...,,..:MWWWWWWWWWMMWWMMMMMMMWMWWWWWWM
                     `i++#z#;i**+*##xn*i;::;;*nz#++#nxMWMMMMMMMMMMMMMz`    ``..``*znxMMxxx*..ii,.,,..iMWWWWWWWWWWWMWWMMMMWMWWWWWWWWM
                     `i*+zn+i*z#++#zn#**ii:;izMn####znWMWWWWWWMMMMMMMx`    ``.`  ,*:;zn#z#,```:;,,...*WWWWWWWWWWWWWWWWWWWWWWWWWWWWWW
                     .*+#znii+zznnnzn+****i++;iz####zzxMMWWWWWMMMMMxxM:    `.     `..i+*;,...``.:..``zWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW
                     .*+#zn;;+znnnnn#**i**i*:,,,#z#zznWMWMWMWWWWMMMMxM+    `       `.,,.........,..``xWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW
                     ,*+#zz;;+#zznnz*ii**i#i:;;:i#zznMxMMMMWWWWMMMxMMMn`   `         `.`....,::,.`` ;MWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW
                     :*##n#;;#z+##z*.;i*ii##iii;;#znxxzii+nMMWMMMxxxxxx:    `,.`     ```.,:;*##i.```+WWWWWWW@@WWWWWWWWWWWWWWWWWW@W@W
                     ;*#zn+ii#znnnz,`;i*ii*zz++*+#znxxz++i:*nMMMMMxxxxx#   `:*z*i:i**i*;*i:#n#,.,``.zWWWWWWWWWW@W@WWWWWWWWWWWWWWW@WW
                     :*+zn#i*zznnx+``:i*i*i#z#++++znxx#+*i::;*nxxMMMxMxx.` ```#nn;,,..,...;*n;..,.`,zMWWWWWWWWWWWWWWWWWWWWWWWWWW@WWW
                     :i+znzi+##zxni  ,;i*i;+##+++#nnxx#+*i:::;;izxxMMMxM; `  `:zn###ii*i#i,iz....``,#MWWWWWWWWWWWWWWWWWWWWWWWWW@@@WW
                     ,i*znni#+znnz,  ,;i**i+###++#nnxx+*i;,,,::::;zxxxxx# `   `*z:;*nMMxzi;zi`...``.+MMWWWWWWWWWWWWWWWWWWWWWWWW@@WWW
                     .+#nnx+#*#znz`  .;i**i*###++#nnxx+i;:`...,,:::*nxxxn.     ,#*,.;#+*:;nn,....`.,+MWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW
                     `*#nxx#+++#z+   .;i***i*++++#znxn*i:, `...,,:::i#xxni     `;+z+*::;+#zi....``.:*xWWWWWWWWWWWWWWMMMMWWWWWW@W@@WW
                      izxxxn#++zz;   .:i***i;;;ii#znnn*;:,`  `..,::;:;innz`     `i#z#+##z#i.....`..:ixWWWWWWWMMMMxzzzMWWWWWWWWWWW@WW
                      ;znnxn##znn,   .:i**i;:,,,;#zznn*;:,`   `..,,:;::znn;      `;+##++i,......`.,:;nMMMWWWWWWMn+iiizzzxMWWW@@WWWWW
                      .zxnxz#zzn#`   .:iiii:.  `,+z#nz*:,,`    `..,:;:+xnnz``    ``.,;;:,,,,....`.,:inM#nxMMxMMxzi:;:::i#nWWWW@W@WWW
                       +xxxzznnn*    .:;ii;,`   ,#znn#i::,`     `..,:*zznnx;``    `.,,,::;;,.....,,,izx;nMxz#nxxn*:;::,..:MWWW@@@@WW
                       ;nxxxxxxz:    .:;ii:,    ,+zxn#;:,.`      `.,,i;,;*z#```  ``.:;iiii;:.......,;#+;xx*;,,;#n+:;;:,;zxxxMMWWWWWW
                       ,zxxxxxxz,    .:;i;:.    :+znz+;:,.`       `..;**;.,;;.````.,:;*iii;,.......,;*.,+#,..`````..:+xWWMxnnznxMWWW
                       `*nxMMnn+.    .,;;;:.    ,+nMx*;:,.`        `.,:i**i:,:.``...:;iii;:,,......:i,..#x:.````,;+nMWWWWMMMMxz+#xWW
                        ;nxznnzi.    .,:;::.    ,+xMzi:,,.           ..,:;iiii.`.....,::,,.:,......::`.;xxz,`:#+;.`.:zWWWWMMMMMxz+zW
                        ,znizn#,.    .,:::,`    `#xx*;:,,.            ````.,::;`.,,......,;;,.,...,i``.*;,.,,:,.::;*##+WWWWWMMMMMn+z
                        `+x:nz;,.    .,:::,`     ixni;:,,.                 `..:,..;*ii;i**;,,....,;,`.;*..,:;;,.,;;;i+;MWWWWMMMMxnnn
                         :z:n*,,.    .,::,,`     *x+;::,.`                  `.,:..;i*+**ii;,.....;:`.,,i+i,,;:,.``:..,:MWWWWWMMMxxxi
                         `#;#,,,.    .,,:,.`     +ni::,,.`                   `.:;`.;i***i;,,....:,..`,.,..i+#::..``.``+MWWWWWWMMxn.`
                         `+*i,,,.    .,,,,.`     #+::,,,.                     `.:;..;i**i:,....:. `.`.````...::,,::,:+x#MWWMMxMMx+``
                         `*+:,,,.   `.,,,,.      #;.,,,,`                      `.;*:,;iii:...,:`   `  `...`` .**nMWWMMMn#MWWMz#zn,`.
                         `#+,,,,.`  `...,..     `+``,,..`                       `.;*:;ii;,.,:. `.` .`    `` ``:xMWWWMMMxn+xWWx#ni,`,
                         `#:,,,..`  `..,,.`      ,  ....                         `,:*ii;:.``  `...,+*`  `:,,,,;MMMWWMMMMxn+nWWnz,:`.
                         `;`.....`  `..,,.`         ...`                         `.,;*;`      ``.``;nn, ,i;:::zWMMMWWMMMMxn+nMx;,,..
                            .....`  ...,..`         `..                           `,:;*;`.:;:. `,,,`+xn:`.i;i+MWMMxMMMMMMxxn+#z.:...
                            `....`  ......          `.`                           `.,:;i:i**##;..:,,:;;:.`:##nMWMMMxznxMMMxxnzi.:...
                             `...` `.,...`          ``                             `.,i#+*++zz++***ii+*;;,.xMMWWWMMMz+*zxnzznM#,,...
                             `.... `.....`                                         .:*###*+#n##z#+###+#+;;ixMMWWWWMMMn+*#xnnx+:,...,
                              ``..``.....                                         `:;#zzzzzzxxnznnnnnzn#;:;+xMWWWWMMMMnz+zMM*;:...,;
                               `````....`                                        ,ii+zzzznnxxxxxxxxxxxzi::;*#xWWWWMMMMxxnnM#*;,...;;
        CLOWN
        exit
    end
end
