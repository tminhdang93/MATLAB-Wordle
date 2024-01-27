%Wordle -  the program picks a random five letter word from a txt file and the player must guess the word using inputs. For each input, the program will generate an image showing how close the input is to the answer.
%Version 4 - Added visual to indicate if input letters are within the answer.
clear;
clc;
%set up the game by obtaining the answer from an array containing a list of five letter words.
words = wordList("fiveLetterWords.txt");
answer = randomWord(words);

%create a boolean value to check if user has guessed the correct answer
correctAnswer = false;
%create value for image showing guesses
imageData = [];

%loop five times to give the player 5 guesses
for g = 1:5
    if ~correctAnswer
        %user inputs guess for what the word is and check if word is exactly 5 letters long.
        userInput = playerGuess
        correctLetters = 0;
        %establish vectors which are used in creating coloured rows.
        colourRow = [];
        imageRow = [];

        %loop through each letter to check if it is in the answer
        for i = 1:length(userInput)
            if userInput(i) == answer(i) %if letter is in answer and has same position
                fprintf("The letter %s is in the same position as the answer.\n", userInput(i));
                %+1 to correctLetters for each correct letter in the same position. If correctLetters reaches 5, player wins.
                correctLetters = correctLetters + 1;
                colourRow = [colourRow, 0];
            else
                %if letter is in the answer but not in the same position
                for j = 1:length(answer)
                    if userInput(i) == answer(j) && userInput(i) ~= answer(i)
                        fprintf("The letter %s is in the answer.\n", userInput(i));
                        colourRow = [colourRow, 0.5];
                        break
                    else
                        %if letter is not in the answer.
                        if userInput(i) ~= answer(1) && userInput(i) ~= answer(2) && userInput(i) ~= answer(3) && userInput(i) ~= answer(4) &&userInput(i) ~= answer(5)
                            fprintf("The letter %s is not in the answer.\n", userInput(i));
                            colourRow = [colourRow, 1];
                            break
                        end
                    end
                end
            end
        end

        %implement the creation of coloured rows to indicate word hints.
        imSize = 100; %establish the size of the final image (if user has 5 guesses)
        numRows = imSize;
        numCols = imSize;
        for row = (g-1)*(imSize/5):g*(imSize/5) %for each guess made, concatenates the row of coloured blocks into a new line in the array
            imageLine = [];
            for n = 1:5
                for col = (n-1)*(imSize/5):n*(imSize/5)
                    pixelVal = uint8((colourRow(n))*255);
                    imageLine = [imageLine, pixelVal];
                end
            end
            imageData = [imageData; imageLine];
        end

        %check if all letters are correct and in the right position.
        if correctLetters == 5
            correctAnswer = true;
        end

        %display image after every guess.
        close all;
        imshow(imageData);
    end
end

%End of game, checks if correctAnswer is true of false then states if use has won or lost
if correctAnswer == true
    fprintf("Congratulations, you got the answer correct!\n");
else
    fprintf("You have lost, the correct answer was %s.\n", answer)
end









