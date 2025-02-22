% Prompt user for map size
% Small = 5x5
% Medium = 7x7
% Large = 9x9
% Custom = dimensions are user defined.
mapSize = input("Choose a map size (small, medium, large, custom):","s");

% Run map generator function with given parameters.
switch mapSize
    case {"s","small"}
        map = mapGeneratorTest(5,5)
    case {"m","medium"}
        map = mapGeneratorTest(7,7)
    case {"l","large"}
        map = mapGeneratorTest(9,9)
    case "custom"
        fprintf("Enter dimensions.\n")
        length = input("Length: ");
        width = input("Width: ");
        map = mapGeneratorTest(length,width)
    otherwise
        fprintf("Enter a valid map size.")
end


