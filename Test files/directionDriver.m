% The game map, numbers correspond to location-specific events. 
map = [0,0,0,0,0;...
        0,0,1,0,0;...
        0,4,0,3,0;...
        0,0,2,0,0;...
        0,0,0,0,0;];

% Base position is set to the centre of the 5x5 map.
pos = [3,3]

% Update position on map based on user input direction.
direction = input("Which way would you like to go? ", "s")
pos = directionTest2(pos,direction)

% Use new position to read in value from map.
mapPos = map(pos(1),pos(2))

% Switch case for map specific events.
% Currently only prints location relative to centre, but this can be used
% to run location specific functions.
switch mapPos
    case 1
        fprintf("North of origin.")
    case 2 
        fprintf("South of origin.")
    case 3
        fprintf("East of origin.")
    case 4
        fprintf("West of origin")
    otherwise
        fprintf("Location undefined.")
end