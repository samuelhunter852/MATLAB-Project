% Inventory management system.
% Initialise inventory.

% Simple inventory, the items can be named using fprintf statements.
inventory = [0,0,0,0];

% Generate loot.
loot = generateLootTest("healItem");

% This code will be moved into an updated loot generator.
switch loot
    case "Mini-shield"
        inventory(1) = inventory(1) + 1;
    case "Shield pot"
        inventory(2) = inventory(2) + 1;
    case "Chug splash"
        inventory(3) = inventory(3) + 1;
    case "Chug Jug"
        inventory(4) = inventory(4) + 1;
end

% Displays item and name
fprintf("\n")
fprintf("Inventory:\n")
fprintf("Mini-shield: %.0f\n",inventory(1))
fprintf("Shield pot: %.0f\n",inventory(2))
fprintf("Chug splash: %.0f\n",inventory(3))
fprintf("Chug jug: %.0f\n",inventory(4))
