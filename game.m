%% Untitled MATLAB roguelike (scuffed version (epic))

% Wipe console and workspace.
clc;
clear;

% First run.
fprintf("Untitled MATLAB roguelike V. 1.0\n")
fprintf("Made by Samuel Hunter (Student ID a1826216)\n")

% Generate map on first run.
validMap = false;

while validMap == false
    mapSize = input("Choose a map size (small, medium, large, custom): ","s");

    % Run map generator function with given parameters.
    switch mapSize
        case {"s","small"}
            [map,visualMap] = mapGenerator(5,5);
            validMap = true;
        case {"m","medium"}
            [map,visualMap] = mapGenerator(7,7);
            validMap = true;
        case {"l","large"}
            [map,visualMap] = mapGenerator(9,9);
            validMap = true;
        case "custom"
            fprintf("Enter dimensions.\n")
            height = input("Height: ");
            width = input("Width: ");
            [map,visualMap] = mapGenerator(height,width);
            validMap = true;
        otherwise
            fprintf("Enter a valid map size.\n")
    end
end

% Places the base position in the approximate middle of the map.
size1 = size(map,1)/2;
size2 = size(map,2)/2;
pos = [ceil(size1),ceil(size2)];

% Initialisation of variables.
health = 100;
weapon = "Rusty blade";

% Current weapon determines the power of the attack.
attackBonus = 0;

% Stores quantities of the four healing items (default is zero).
inventory = [0,0,0,0];

% Boolean value to determine if the game has finished.
gameEnd = false;

% Style
fprintf("\nYou enter the dungeon.\n")

while gameEnd == false
    % Ends the game if health reaches zero.
    if health <= 0
        fprintf("Game over! Run the program again to start a new game\n")
        gameEnd = true;
        break
    end

    % Update visual map based on position.
    visualMap(pos(1),pos(2)) = 'O';

    % Display health and currently equipped weapon.
    fprintf("Map:\n")
    disp(visualMap)
    fprintf("Health: %.0f\n",health)
    fprintf("Weapon: %s (+%.0f attack boost)\n",weapon,attackBonus)
    fprintf("\n") % formatting
    % Reset visual map.
    if map(pos(1),pos(2)) ~= 4
        visualMap(pos(1),pos(2)) = '=';
    else
        visualMap(pos(1),pos(2)) = '#';
    end

    % Give user the option to access healing items or move.
    inventoryAccess = input("What would you like to do? (inventory/move): ","s");

    switch inventoryAccess
        case {"inventory","inv","i"}
            % Display current inventory contents.
            fprintf("\n")
            fprintf("Health: %.0f\n",health)
            fprintf("Inventory:\n")
            fprintf("1: Bread (%.0f)\n",inventory(1))
            fprintf("2: Small healing potion: (%.0f)\n",inventory(2))
            fprintf("3: Large healing potion (%.0f)\n",inventory(3))
            fprintf("4: Ultra healing potion (%.0f)\n",inventory(4))
            fprintf("\n") % formatting

            % Prompt the user to choose one of the four items.
            invAccess = input("Would you like to use an item? (y/n): ","s");
            if invAccess == "yes" || invAccess == "y"
                item = input("Choose an item: ");
                % Run healing function, add new value to current health
                if inventory(item) > 0
                    damageHealed = healing(item,inventory);
                    health = health + damageHealed;
                    % Reset health to 100 if overhealed.
                    if health > 100
                        health = 100;
                    end
                    inventory(item) = inventory(item) - 1;
                else
                    fprintf("\n")
                    fprintf("This inventory slot is empty.\n")
                end
            end
        otherwise
            % Update position based on direction.
            direction = input("Which way would you like to go? ", "s");
            % Call movement function.
            pos = movement(pos,direction,map);

            % Use new position to trigger functions.
            mapPos = map(pos(1),pos(2));

            switch mapPos
                case 1
                    fightTrigger = input("You encounter a goblin. " + ...
                        "Do you want to fight? (y/n) ","s");
                    if fightTrigger == "y" || fightTrigger == "yes"
                        [playerDamage,fightWin] = fight(health,attackBonus);
                        health = health - playerDamage;
                        switch fightWin
                            case {1,3}
                                loot = generateLoot("healItem");
                            case 2
                                [loot,newAtkBonus] = generateLoot("weapon");
                        end
                        if fightWin > 0
                            switch loot
                                case "Bread"
                                    inventory(1) = inventory(1) + 1;
                                case "Small healing potion"
                                    inventory(2) = inventory(2) + 1;
                                case "Large healing potion"
                                    inventory(3) = inventory(3) + 1;
                                case "Ultra healing potion"
                                    inventory(4) = inventory(4) + 1;
                                case "Bronze dagger"
                                    [weapon, attackBonus] =...
                                        weaponReplacement(loot,weapon,attackBonus,newAtkBonus);
                                case "Iron sword"
                                    [weapon, attackBonus] =...
                                        weaponReplacement(loot,weapon,attackBonus,newAtkBonus);
                                case "Forged steel longsword"
                                    [weapon, attackBonus] =...
                                        weaponReplacement(loot,weapon,attackBonus,newAtkBonus);
                                case "Blade of Legends"
                                    [weapon, attackBonus] =...
                                        weaponReplacement(loot,weapon,attackBonus,newAtkBonus);
                            end
                        end
                    end
                    % Wipe map data.
                    map(pos(1),pos(2)) = 0;
                case 2
                    % Weapon generator.
                    lootTrigger = input("There is a chest." + ...
                        " Do you wish to open it? (y/n): ","s");

                    if lootTrigger == "y"
                        [loot,newAtkBonus] = generateLoot("weapon");
                        switch loot
                            case "Bronze dagger"
                                [weapon, attackBonus] =...
                                    weaponReplacement(loot,weapon,attackBonus,newAtkBonus);
                            case "Iron sword"
                                [weapon, attackBonus] =...
                                    weaponReplacement(loot,weapon,attackBonus,newAtkBonus);
                            case "Forged steel longsword"
                                [weapon, attackBonus] =...
                                    weaponReplacement(loot,weapon,attackBonus,newAtkBonus);
                            case "Blade of Legends"
                                [weapon, attackBonus] =...
                                    weaponReplacement(loot,weapon,attackBonus,newAtkBonus);
                        end
                        % Wipe map data.
                        map(pos(1),pos(2)) = 0;
                    end


                case 3
                    lootTrigger = input("There is a chest." + ...
                        " Do you wish to open it? (y/n): ","s");

                    if lootTrigger == "y"
                        loot = generateLoot("healItem");
                        % Update inventory slot based on generated item.
                        switch loot
                            case "Bread"
                                inventory(1) = inventory(1) + 1;
                            case "Small healing potion"
                                inventory(2) = inventory(2) + 1;
                            case "Large healing potion"
                                inventory(3) = inventory(3) + 1;
                            case "Ultra healing potion"
                                inventory(4) = inventory(4) + 1;
                        end
                        % Wipe map data.
                        map(pos(1),pos(2)) = 0;
                    end
                case 4
                    % Ask user if they want to enter the boss room.
                    bossRoom = input("\nYou see a small cave entrance.\n" + ...
                        "Once you enter you cannot leave.\n" + ...
                        "Are you sure you want to enter? (y/n): ","s");
                    % Triggers boss fight sequence.
                    if bossRoom == "y" || bossRoom == "yes"
                        playerDamage = bossFight(health,attackBonus,inventory);
                        health = health - playerDamage;
                        gameEnd = true;
                    else
                        % Prevent wiping of boss room.
                        map(pos(1),pos(2)) = 4;
                    end
            end
    end
end
% Checks if the boss has been successfully defeated.
if health >= 0 && gameEnd == true
    fprintf("You won the game.\n Run the program again to start a new game.\n")
end