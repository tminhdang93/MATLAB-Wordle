%Wordle - program picks a random five letter word from a txt file and the
%player must guess the word using inputs. 
%Version 3 - Added checks to see if user has won the game or not.
clear;
clc;
%set up the game by obtaining the answer from an array containing a list of
%five letter words.
words = wordList("fiveLetterWords.txt");
answer = char(words(randi(numel(words))))

%create a boolean value to check if user has guessed the correct answer
correctAnswer = false;

%loop five times to give the player 5 guesses
for g = 1:5
if ~correctAnswer
%user inputs guess for what the word is and check if word is exactly 5
%letters long.
userInput = playerGuess
correctLetters = 0;
    
    %loop through each letter to check if it is in the answer
for i = 1:length(userInput)
    if userInput(i) == answer(i) %if letter is in answer and has same position
        fprintf("The letter %s is in the same position as the answer.\n", userInput(i));
        %+1 to correctLetters for each correct letter in the same position. If
        %correctLetters reaches 5, player wins.
        correctLetters = correctLetters + 1;
    else 
        %if letter is in the answer but not in the same position
            for j = 1:length(answer)
                if userInput(i) == answer(j) && userInput(i) ~= answer(i)
                    fprintf("The letter %s is in the answer.\n", userInput(i));
                    break
                else 
                    %if letter is not in the answer.
                    if userInput(i) ~= answer(1) && userInput(i) ~= answer(2) && userInput(i) ~= answer(3) && userInput(i) ~= answer(4) &&userInput(i) ~= answer(5)
                        fprintf("The letter %s is not in the answer.\n", userInput(i));
                        break
                    end
                end 
            end    
    end
    if correctLetters == 5
        correctAnswer = true;
    end
end
end
end

%End of game, checks if correctAnswer is true of false then states if user
%has won or lost
if correctAnswer == true
            fprintf("Congratulations, you got the answer correct!");
    else
        fprintf("You have lost, the correct answer was %s.\n", answer)
end









