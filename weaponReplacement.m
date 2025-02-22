% Weapon replacement system.
function [weapon, attackBonus] = weaponReplacement(loot,weapon,attackBonus,newAtkBonus)

% Compares new weapon with old one.
fprintf("Current weapon: %s (+%.0f damage boost)\n",weapon,attackBonus)
fprintf("New weapon: %s (+%.0f damage boost)\n",loot,newAtkBonus)

% User is given a choice to discard or keep the loot.
replacement = input("Would you like to replace your existing weapon with the new one? (y/n): ","s");

% Replaces weapon slot and stats with new values.
switch replacement
    case {"y","yes"}
        fprintf("Weapon replaced.\n")
        weapon = loot;
        attackBonus = newAtkBonus;
    % If the user declines replacement, old values are kept.
    otherwise
        fprintf("Replacement declined.\n")
        weapon = weapon;
        attackBonus = attackBonus;
end