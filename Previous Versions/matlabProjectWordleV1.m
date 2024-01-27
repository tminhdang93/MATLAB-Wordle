%Wordle - program picks a random five letter word from a txt file and the
%player must guess the word using inputs. 
%Version 1 - Basic foundation. Checks if letters from input match answer
clear;
clc;
%set up the game by obtaining the answer from an array containing a list of
%five letter words.
words = wordList("fiveLetterWords.txt");
answer = char(words(randi(numel(words))))
%create boolean for if word has been answered yet

%user inputs guess for what the word is and check if word is exactly 5
%letters long.
userInput = playerGuess();

%loop through each letter to check if it is in the answer
for i = 1:length(userInput)
    if userInput(i) == answer(i) %if letter is in answer and has same position
        fprintf("The letter %s is in the same position as the answer.\n", userInput(i));
    else 
        %if letter is in the answer but not in the same position
            for j = 1:length(answer)
                if userInput(i) == answer(j) && userInput(i) ~= answer(i)
                    fprintf("The letter %s is in the answer.\n", userInput(i));
                    break
                else 
                    %if letter does not match any letter in the answer
                    %(letter is not in answer)
                    if userInput(i) ~= answer(1) && userInput(i) ~= answer(2) && userInput(i) ~= answer(3) && userInput(i) ~= answer(4) &&userInput(i) ~= answer(5)
                        fprintf("The letter %s is not in the answer.\n", userInput(i));
                        break
                    end
                end 
            end    
    end
end


