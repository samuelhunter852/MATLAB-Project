% This file is identical to directionTest3.m

% This function moves the player north, south, east, or west depending on
% the player's input.
function pos = movement(pos,direction,map)

% Update position dependent on user input.
switch direction
    case {"north","n"} % Short-form and long-form are both accepted inputs.
        pos(1) = pos(1) - 1;
        % Checks if position is within bounds, if not position is reset.
        if pos(1) > size(map,1) || pos(1) < 1
            fprintf("You cannot move beyond the borders of the map.\n")
            pos(1) = pos(1) + 1;
        end
        % Same as above.
    case {"south","s"}
        pos(1) = pos(1) + 1;
        if pos(1) > size(map,1) || pos(1) < 1
            fprintf("You cannot move beyond the borders of the map.\n")
            pos(1) = pos(1) - 1;
        end
    case {"east","e"}
        pos(2) = pos(2) + 1;
        if pos(2) > size(map,2) || pos(2) < 1
            fprintf("You cannot move beyond the borders of the map.\n")
            pos(2) = pos(2) - 1;
        end
    case {"west","w"}
        pos(2) = pos(2) - 1;
        if pos(2) > size(map,2) || pos(2) < 1
            fprintf("You cannot move beyond the borders of the map.\n")
            pos(2) = pos(2) + 1;
        end
    otherwise
        % If an invalid direction is inputted, the position is unchanged.
        pos = pos;
        fprintf("Please enter a valid direction.\n")
end