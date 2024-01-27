%function which reads a txt file containg a list of words and returns it as a string array.
function [returnStrings] = wordList(fileName)
%read file and for each line, store in array
fileWords = [];
fileWords = readlines(fileName);
%check if all words are actually five letters long, then place them in
%returnStrings array
returnStrings = [];
for i = 1:size(fileWords)
    if strlength(fileWords(i)) == 5
    returnStrings = [returnStrings; fileWords(i)];
    end
end
end