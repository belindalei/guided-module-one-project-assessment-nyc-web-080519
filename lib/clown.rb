def weird_jobs
  table = Text::Table.new
  table.head = ["Death Count", "ÇØ‰‰¨∏ˇ´Î_JØb_ˇˇÒ´", "The Sacrement", "Insidious", "A Place Lost to Time"]
  


  array = [
    [-10000, "Harvest Coordinator 🌚", "$0🖤", "$0🎎", "The Pit 🕷"],
    ["HAHAHA🦇", "Dental Hygienist 💉", "💰", "60 Billion🦑", "A deep dark well 🕳"],
    [12345, "Loan Officer", "DIE", "DESTROY", "The office down the hall"],
    [999, "Chemist 🧪", "$45000🥭", "$50000🦴", "Area 51 👽"],
    [666, "Evil Clown🤡", "Fear is its own reward!", "Permanent Nightmares 🎈", "Carnival of Souls 🔨"],
    ["MEAT", "Butcher 🔪", "🥩!", "!!🍖!!", "Your FRIENDLY neighborhood Whole Foods 🧸"]
  ]

  array.each do |job|
    table.rows << job
  end
  puts table.to_s.red
  sleep 3.0 
  clown_main_menu 
end

def clown_main_menu
  print_clown_options
  input = gets.chomp.to_i
  clown_menu_router(input)
end

def clown_menu_router(input)
  if input != 6 
  puts "\nMUHAHAHAHA. YOU'RE MINE. YOU ONLY HAVE ONE OPTION.".red
  elsif input == 6 
    nightmare_visit
  end
end

def print_clown_options

    puts "\nWelcome to your favorite...\n\n".red +
    "N̸̜̩̅Î̵͓G̴̜͂̉Ḥ̴̀T̷̹͂͝M̸̨͇̅Á̶̛̟R̸̜͇̈́͐E̷͉̻̓͠ ̸̲͖͝V̶̯̅ͅI̷͍͊̇S̵̡̹͗Ị̶̽T̴̠͐\n\n".red + 
    "\nPlease choose from a option from the list below:\n\n".red +
    "6. Show me a list of jobs that match my profile. (Sorted by salary)\n".red +
    "6. Show me the list of jobs on my 'liked' list.\n".red +
    "6. Exit.\n".red 
    
    print "\nPlease enter your choice: ".red
end 

def printer(string)
  my_arr = string.split("")
  my_arr.each do |char|
    print char
    sleep(0.2)
  end
end

def print_fast(string)
  10.times do
    print string + " "
    sleep(0.3)
  end
  10.times do
    print string + " "
    sleep(0.2)
  end
  100.times do 
    print string + " "
    sleep(0.05)
  end
  500.times do 
    print string + " "
    sleep(0.01)
  end
  clear
  sleep(1)
end

def nightmare_visit
  string1 = "Thank you for choosing 'Nightmare Visit'".red
  string2 = "Goodnight! Sleep Tight!".red
  string3 = "HA... HA... HA...".red
  
  clear
  printer(string1)
  sleep(1)
  clear
  printer(string2)
  sleep(1)
  clear
  printer(string3)
  clear
  print_fast"SLEEP! SLEEP!".red
  sleep(1)
  clear


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
      pid = fork{ exec 'killall', "afplay"} 
      exit
  end