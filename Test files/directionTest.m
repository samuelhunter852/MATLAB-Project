% grid

% health = 100

 map = [0,0,0,0,0;...
        0,0,1,0,0;...
        0,4,0,3,0;...
        0,0,2,0,0;...
        0,0,0,0,0;];

% Position on the map.
pos = [3,3]

% Code to change position on map
 direction = input("Which way would you like to go? ", "s")
switch direction
    case {"north","n"}
        pos(1) = pos(1) - 1
        disp(map(pos(1),pos(2)))
    case {"south","s"}
        pos(1) = pos(1) + 1
        disp(map(pos(1),pos(2)))
    case {"east","e"}
        pos(2) = pos(2) + 1
        disp(map(pos(1),pos(2)))
    case {"west","w"}
        pos(2) = pos(2) - 1
        disp(map(pos(1),pos(2)))
    otherwise
        fprintf("Please enter a valid direction.")
end