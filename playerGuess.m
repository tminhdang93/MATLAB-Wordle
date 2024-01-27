%function which takes a user input and checks if the input is five letters
%long
function [userInput] = playerGuess()
userInput = char(input("Enter a five letter word: ",'s'))
while length(userInput) ~= 5
    userInput = char(input("Your word is not five letters long. Please enter a five letter word: ", 's'));
end