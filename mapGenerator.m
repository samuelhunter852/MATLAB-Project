% Generates the map used by the game.
function [map,visualMap] = mapGenerator(length,height)

rng("shuffle")

% Preallocate map of given size.
map = zeros(length,height);
visualMap = '';

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
                map(row,col) = randi(3);
        end
    end
end

% Place the boss room on a random square.
bossRoom1 = randi(rows);
bossRoom2 = randi(cols);

map(bossRoom1,bossRoom2) = 4;

% Generate visual map with data stripped.
for row = 1:rows
    for col = 1:cols
        visualMap(row,col) = '-';
    end
end

visualMap(bossRoom1,bossRoom2) = '#';

