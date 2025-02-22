% NOTE: The Fortnite item names will be replaced in the final code.

% Loot generator
function [loot,newAtkBonus] = generateLootTest(itemClass)

rng("shuffle")

% Generates a random item.
item = randi(4);

% Item class is predetermined by the map tile. Most of the map tile data
% will not be visible to the end user.
switch itemClass
    case "weapon"
        switch item
            case 1
                fprintf("Boogie Bomb generated.\n")
                loot = "Boogie Bomb";
            case 2
                fprintf("Bolt-action sniper generated.\n")
                loot = "Bolt-action sniper";
            case 3
                fprintf("Golden SCAR generated.\n")
                loot = "Golden SCAR";
            case 4
                fprintf("Revolver generated.\n")
                loot = "Revolver";
        end
    case "healItem"
        switch item
            case 1
                fprintf("Chug jug generated.\n")
                loot = "Chug Jug";
            case 2
                fprintf("Mini shield generated.\n")
                loot = "Mini shield";
            case 3
                fprintf("Chug splash generated.\n")
                loot = "Chug splash";
            case 4
                fprintf("Shield pot generated.\n")
                loot = "Shield pot";
        end
end
end
