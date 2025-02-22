% Basic combat system with inventory management code.
% Similar to fight.m but without the ability to exit.
function playerDamage = bossFight(health,attackBonus,inventory)

rng("shuffle")

% Initialisation of variables.
playerDamage = 0;
enemyHealth = 150;

% Boolean variable to determine if the fight is over or not.
fightEnd = false;

% The fight sequence will run until either the player or enemy have zero
% health, or if the player terminates the fight.
while fightEnd == false

    % Displays current health and enemy health, and asks the user if they want
    % to fight.
    fprintf("Health: %.0f\n", (health - playerDamage))
    fprintf("Goblin King Health: %.0f\n", enemyHealth)
    fightPrompt = input("Would you like to fight? (y/inventory): ","s");

    % Answering "y" will run through one turn of the fight
    % Answering anything else will exit the fight.
    switch fightPrompt
        case {"yes","y"}
            fprintf("\n") % formatting
            % Player's turn.
            playerAttack = attackBonus + randi(10); % generates an attack
            enemyHealth = enemyHealth - playerAttack; % removes attack from health
            fprintf("You deal %.0f damage to enemy!\n",playerAttack)
            fprintf("\n") % formatting

            % Ends fight if enemy reaches zero health.
            if enemyHealth <= 0
                fprintf("You win the fight!\n")
                fightEnd = true;
                break
            end
            % Enemy's turn
            enemyDamage = randi(40); % generates enemy attack
            playerDamage = playerDamage + enemyDamage;
            fprintf("Goblin King dealt %.0f damage!\n", enemyDamage)
            fprintf("\n") % formatting

            % Ends fight if player reaches zero health.
            if playerDamage >= health
                fprintf("You died!\n")
                fightEnd = true;
                break
            end

            % Inventory management code
        otherwise
            % Display current inventory contents.
            fprintf("\n")
            fprintf("Health: %.0f\n",health)
            fprintf("Inventory:\n")
            fprintf("1: Bread (%.0f)\n",inventory(1))
            fprintf("2: Small healing potion (%.0f)\n",inventory(2))
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
                    % This is required to allow healing on the first turn
                    % when the player has not taken damage yet.
                    if playerDamage == 0 && health < 100
                        health = health + damageHealed;
                        if health > 100
                            health = 100;
                        end
                    else
                        playerDamage = playerDamage - damageHealed;
                        % Reset health to 100 if overhealed.
                        if playerDamage < 0
                            playerDamage = 0;
                        end
                    end
                    inventory(item) = inventory(item) - 1;
                else
                    fprintf("\n")
                    fprintf("This inventory slot is empty.\n")
                end
            end
    end
end