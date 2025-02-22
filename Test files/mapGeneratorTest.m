% Map generator
function [map,pos] = mapGeneratorTest(length,width)

rng("shuffle")

% Preallocate map of given size.
map = zeros(length,width);

% Get dimensions of map array.
rows = size(map,1);
cols = size(map,2);

% Populate array with numbers corresponding to events.
for row = 1:rows
    for col = 1:cols
        % 2/3 chance of generating a square with an event.
        chance = randi(3);
        switch chance
            case 1
                map(row,col) = 0;
            otherwise
                map(row,col) = randi(5);
        end
    end
end