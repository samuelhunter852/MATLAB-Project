% This function moves the player north, south, east, or west depending on
% the player's input.
function pos = directionTest2(pos,direction)

% Update position dependent on user input.
switch direction
    case {"north","n"} % Short-form and long-form are both accepted inputs.
        pos(1) = pos(1) - 1
    case {"south","s"}
        pos(1) = pos(1) + 1
    case {"east","e"}
        pos(2) = pos(2) + 1
    case {"west","w"}
        pos(2) = pos(2) - 1
    otherwise
        pos = pos % If an invalid direction is inputted, the position is unchanged.
        fprintf("Please enter a valid direction.")
end