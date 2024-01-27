%since this function could not be implemented the same way in the main
%program, this was instead used to check if the code I had in mind would
%produce the results that I wanted.

%function which takes a vector of numbers and concatenates them into an
%image array.
function[imageRow] = imageColours(colourRow)
imageSize = 100;
numRows = 20;
numCols = 100;
imageRow = [];
for row = 1:numRows
    imageLine = [];
    for i = 1:5
        for col = (i-1)*20:i*(numCols/5)
            pixelVal = uint8(colourRow(i)*255);
            imageLine = [imageLine pixelVal];
        end 
    end
    imageRow = [imageRow; imageLine]; 
end
end