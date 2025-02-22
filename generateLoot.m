% Loot generator
function [loot,newAtkBonus] = generateLoot(itemClass)

rng("shuffle")

% Determines which of the four items is chosen.
item = randi(4);

% Item class is predetermined by the map tile. This data is not visible to
% the end user.
switch itemClass

    % Generates one of the four weapons (25% chance of each).
    case "weapon"
        switch item
            case 1
                fprintf("You obtain a bronze dagger.\n")
                loot = "Bronze dagger";
                newAtkBonus = 3;
            case 2
                fprintf("You obtain an iron sword \n")
                loot = "Iron sword";
                newAtkBonus = 8;
            case 3
                fprintf("You obtain a forged steel longsword \n")
                loot = "Forged steel longsword";
                newAtkBonus = 12;
            case 4
                fprintf("You obtain the Blade of Legends.\n")
                loot = "Blade of Legends";
                newAtkBonus = 20;
        end

    % Generates one of the four healing items (25% chance of each).
    case "healItem"
        switch item
            case 1
                fprintf("You obtain a loaf of bread.\n")
                loot = "Bread";
            case 2
                fprintf("You obtain a small healing potion.\n")
                loot = "Small healing potion";
            case 3
                fprintf("You obtain a large healing potion.\n")
                loot = "Large healing potion";
            case 4
                fprintf("You obtain an ultra healing potion.\n")
                loot = "Ultra healing potion";
        end
end
end