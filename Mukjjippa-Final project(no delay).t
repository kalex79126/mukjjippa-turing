%Alex Kim
%May 30,2023
%Mukjjippa tournament
%This program operates Mukjjippa tournament so the user can entertain the games

const rock := 1 %constant value for rock or muk
const paper := 2 %constant value for paper or ppa
const scissor := 3 %constant value for scissors or jji
var name : string %user's name input
var rounds : int %user's input for the number of rounds to play
var count : int := 0 %keeps the running total to show what round it is
var usermove : int %user's input between muk, jji, and ppa
var computermove : int %randomely generated number as a computer's move
var winner : string %variable to show the winner of the round
var computer : int := 0 %variable to keep tracking the number of times that computer wins
var user : int := 0 %variable to keep tracking the number of times that user wins
var mypic : int %variable for the picture "Rock"
var muk : int %variable for the picture "ROCK"
var no : int %variable for the picture "MUK JJI PPA"
var Muk : int %variable for the picture of Muk
var Jji : int %variable for the picture of Jji
var Ppa : int %variable for the picture of Ppa
var intfont : int := Font.New ("Elephant:30") %variabel to store the type and the size of the font
var finished : boolean := false %variable to stop the music
var start : string (1) := chr (13) %variable used to start the program
Text.Color (11)
process winnerr
    loop
	exit when finished
	Music.PlayFile ("Winner.MP3")
    end loop
end winnerr
process Backgroundmusic
    Music.PlayFileLoop ("Background.MP3")
end Backgroundmusic
process timer
    loop
	exit when finished
	Music.PlayFile ("start.MP3")
    end loop
end timer
process loser
    loop
	exit when finished
	Music.PlayFile ("loser.MP3")
    end loop
end loser
process morewin
    loop
	exit when finished
	Music.PlayFile ("finalwin.MP3")
    end loop
end morewin
process morelose
    loop
	exit when finished
	Music.PlayFile ("BOO.MP3")
    end loop
end morelose
loop
    Font.Draw ("Press any key to start", 180, 80, defFontID, black)
    if hasch then
	getch (start)
	exit
    else
    end if
end loop
cls
fork Backgroundmusic %start the background music
mypic := Pic.FileNew ("Rock.bmp")
Pic.ScreenLoad ("Rock.bmp", 0, 0, picCopy)
delay (2500)
cls
%no:=Pic.FileNew ("ROCK X.bmp")
%Pic.ScreenLoad("ROCK X.bmp",0,0,picCopy)
%delay(2500)
%cls
%muk:=Pic.FileNew ("MUK JJI PPA.bmp")
%Pic.ScreenLoad("MUK JJI PPA.bmp",0,0,picCopy)
%delay(2500)
%cls
%Muk:=Pic.FileNew ("MUK.bmp")
%Jji:=Pic.FileNew ("JJI.bmp")
%Ppa:=Pic.FileNew ("PPA.bmp")
%put "Please enter your name to start the game."
%get name:*
%put "Hello, ", name, "."
put "How many rounds would you like to play?"
get rounds
put " "
put " "
Text.Color (2)
%delay (500)
put "Welcome to mukjjippa tournament."
%delay (3000)
put "Mukjjippa is a South Korean game which has a basic concept of Rock-Paper-Scissors game."
%delay (3000)
put "Paper covers rock, scissors cut paper, and rock smashes scissors."
%delay (3000)
put "Muk is for rock, jji is for scissors, and ppa is for paper."
%delay (3000)
put "You and the computer start with a regular rock-paper-scissors game."
%delay (3000)
put "The current winner has to change their hand to the corresponding one."
%delay (3000)
put "The point is to get your opponent to make the same hand as you and then you win."
%delay (3000)
put "However, if you and computer both switch, the new winner then calls out their next hand and the process starts over."
%delay (3000)
put "Good luck then!"
delay (3000)
Music.PlayFileStop
Text.Color (2)
put " "
fork timer %start the timer soundeffect
for decreasing down : 3 .. 1
    put down : 30
    delay (1000)
end for
Time.Delay (2500)
finished := true
Music.PlayFileStop
put "Enter 1 for Muk, 2 for Ppa, and 3 for Jji."
delay (300)
put "start!"
put " "
put " "
for game : 1 .. rounds
    count := count + 1 %keeps tracking which round it is
    Text.Color (12)
    put "Round ", count
    Text.Color (9)
    loop
	loop
	    put "You: " ..
	    get usermove
	    exit when usermove = 1 or usermove = 2 or usermove = 3
	end loop
	case usermove of %shows what user entered
	    label 1 :
		put "Muk"
		Pic.ScreenLoad ("MUK.bmp", 50, 150, picCopy)
	    label 2 :
		put "Ppa"
		Pic.ScreenLoad ("PPa.bmp", 50, 150, picCopy)
	    label 3 :
		put "Jji"
		Pic.ScreenLoad ("JJI.bmp", 50, 150, picCopy)
	end case
	randint (computermove, 1, 3)
	put " " : 50, "Computer: ", computermove
	case computermove of %shows what computer's move was
	    label 1 :
		put " " : 50, "Muk"
		Pic.ScreenLoad ("MUK.bmp", 300, 150, picCopy)
	    label 2 :
		put " " : 50, "Ppa"
		Pic.ScreenLoad ("PPA.bmp", 300, 150, picCopy)
	    label 3 :
		put " " : 50, "Jji"
		Pic.ScreenLoad ("JJI.bmp", 300, 150, picCopy)
	end case
	delay (750)
	if (usermove = 1) and (computermove = 2) then
	    put "Computer is attacking first."
	    winner := "computer"
	elsif (usermove = 1) and (computermove = 1) then
	    put "You and the computer tied. Try it again"
	elsif (usermove = 1) and (computermove = 3) then
	    delay (750)
	    put "You are attacking first."
	    winner := "user"
	elsif (usermove = 2) and (computermove = 1) then
	    delay (750)
	    put "You are attacking first."
	    winner := "user"
	elsif (usermove = 2) and (computermove = 2) then
	    delay (750)
	    put "You and the computer tied. Try it again"
	elsif (usermove = 2) and (computermove = 3) then
	    delay (750)
	    put "Computer is attacking first."
	    winner := "computer"
	elsif (usermove = 3) and (computermove = 1) then
	    delay (750)
	    put "Computer is attacking first."
	    winner := "computer"
	elsif (usermove = 3) and (computermove = 2) then
	    delay (750)
	    put "You are attacking first."
	    winner := "user"
	elsif (usermove = 3) and (computermove = 3) then
	    delay (750)
	    put "You and the computer tied. Try it again"
	end if
	exit when usermove not= computermove
    end loop
    loop
	loop
	    put "You: " ..
	    get usermove
	    exit when usermove = 1 or usermove = 2 or usermove = 3
	end loop
	case usermove of %shows what the user entered
	    label 1 :
		put "Muk"
		Pic.ScreenLoad ("MUK.bmp", 50, 150, picCopy)
	    label 2 :
		put "Ppa"
		Pic.ScreenLoad ("PPa.bmp", 50, 150, picCopy)
	    label 3 :
		put "Jji"
		Pic.ScreenLoad ("JJI.bmp", 50, 150, picCopy)
	end case
	randint (computermove, 1, 3)
	put " " : 50, "Computer: ", computermove
	case computermove of %show what the computer's move was
	    label 1 :
		put " " : 50, "Muk"
		Pic.ScreenLoad ("MUK.bmp", 300, 150, picCopy)
	    label 2 :
		put " " : 50, "Ppa"
		Pic.ScreenLoad ("PPA.bmp", 300, 150, picCopy)
	    label 3 :
		put " " : 50, "Jji"
		Pic.ScreenLoad ("JJI.bmp", 300, 150, picCopy)
	end case
	if (usermove = 1) and (computermove = 2) then
	    put "Now computer is attacking."
	    winner := "computer"
	elsif (usermove = 1) and (computermove = 3) then
	    put "You are attacking."
	    winner := "user"
	elsif (usermove = 2) and (computermove = 1) then
	    put "You are attacking."
	    winner := "user"
	elsif (usermove = 2) and (computermove = 3) then
	    put "Now computer is attacking."
	    winner := "computer"
	elsif (usermove = 3) and (computermove = 1) then
	    put "Now computer is attacking."
	    winner := "computer"
	elsif (usermove = 3) and (computermove = 2) then
	    put "You are attacking."
	    winner := "user"
	end if
	exit when usermove = computermove or computermove = usermove
    end loop
    if winner = "user" then
	Font.Draw ("Winner!", 50, 150, intfont, 60)
	fork winnerr %play the sound effect for winning a game
	Time.Delay (4000)
	finished := true
	Music.PlayFileStop
    else
	Font.Draw ("Winner!", 300, 150, intfont, 60)
	fork loser %play the sound effect for losing a game
	Time.Delay (4000)
	finished := true
	Music.PlayFileStop
    end if
    Text.Color (5)
    put "The winner is ", winner, " for round ", count, "."
    if (winner = "user") then
	user := user + 1 %keeps tracking the number of times that user wins
    elsif (winner = "computer") then
	computer := computer + 1 %keeps tracking the number of times that computer wins
    end if
end for
if rounds = 1 then
    put "You played ", rounds, " game in total and won ", user, " game and lost ", computer, " game."
else
    put "You played ", rounds, " games in total and won ", user, " games and lost ", computer, " games."
end if
if computer > user then
    fork morelose %play sad sound effect
    Time.Delay (14300)
    finished := true
    Music.PlayFileStop
elsif user > computer then 
    fork morewin %play happy sound effect
    Time.Delay (11000)
    finished := true
    Music.PlayFileStop
end if
put "The End"

