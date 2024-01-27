%function which takes an array and returns a random string from
%the array. used to determine the answer of the current game.
function [answer] = randomWord (words)
answer = char(words(randi(numel(words))));
end