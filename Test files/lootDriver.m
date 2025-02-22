% Loot driver

% Initialise
inventory = [];
weapon = "Test";

% Weapon test.
loot = generateLootTest("weapon");
weapon = loot;

% Inventory item test.
loot = generateLootTest("healItem");
inventory = [inventory loot];
loot = generateLootTest("healItem");
inventory = [inventory loot];

disp(weapon)
disp(inventory)