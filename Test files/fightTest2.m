% Basic combat system (+ additional output that generates loot on death).
function [playerDamage,fightWin] = fightTest2(health,maxHit)

% This might not be needed
rng("shuffle")

% Initialisation of variables.
playerDamage = 0;
enemyHealth = 25;

% Boolean variable to determine if the fight is over or not.
fightEnd = false;

% The fight sequence will run until either the player or enemy have zero
% health, or if the player terminates the fight.
while fightEnd == false

% Displays current health and enemy health, and asks the user if they want
% to fight.
    fprintf("Health: %.0f\n", (health - playerDamage))
    fprintf("Enemy Health: %.0f\n", enemyHealth)
    fightPrompt = input("Would you like to fight? (y/n): ","s");

% Answering "y" will run through one turn of the fight
% Answering anything else will exit the fight.
switch fightPrompt
    case {"yes","y"}
        fprintf("\n") % formatting
        % Player's turn.
        playerAttack = maxHit + randi(10); % generates an attack
        enemyHealth = enemyHealth - playerAttack; % removes attack from health
        fprintf("You deal %.0f damage to enemy!\n",playerAttack)
        fprintf("\n") % formatting

        % Ends fight if enemy reaches zero health.
        if enemyHealth <= 0
            fprintf("You win the fight!\n")
            fightEnd = true;
            fightWin = randi(3) % This variable is used to generate loot.
        end
        % Enemy's turn
        enemyDamage = randi(15); % generates enemy attack
      playerDamage = playerDamage + enemyDamage;
      fprintf("Enemy dealt %.0f damage!\n", enemyDamage)
      fprintf("\n") % formatting

      % Ends fight if player reaches zero health.
      if playerDamage >= health
          fprintf("You died!\n")
          fightEnd = true;
          fightWin = 0;
          break
      end

    % Ends fight if player chooses to end fight. 
    % The fight will also end if the player does not properly type "y" or "yes"
    otherwise
        fprintf("You run away.\n")
        playerDamage; % Keeps damage in case the player exits mid fight.
        fightEnd = true;
        fightWin = 0;
end
end