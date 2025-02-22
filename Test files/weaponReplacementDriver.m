% Weapon replacement driver.

% Set attackBonus to minimum.
attackBonus = 0;

weapon = "Test";

% Generate the loot.
[loot,newAtkBonus] = generateLootTest2("weapon");

switch loot
    case "Boogie Bomb"
        [weapon, attackBonus] = weaponReplacementTest(loot,weapon,attackBonus,newAtkBonus);
    case "Bolt-action sniper"
        [weapon, attackBonus] = weaponReplacementTest(loot,weapon,attackBonus,newAtkBonus);
    case "Golden SCAR"
        [weapon, attackBonus] = weaponReplacementTest(loot,weapon,attackBonus,newAtkBonus);
    case "Revolver"
        [weapon, attackBonus] = weaponReplacementTest(loot,weapon,attackBonus,newAtkBonus);
end


disp(weapon)
disp(attackBonus)