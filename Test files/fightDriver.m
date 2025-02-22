% Get health and weapon stats from program.
health = 100
maxHit = 5 % Actually min. hit, this will be changed in the final program.

inventory = [5,5,5,5];
 weapon = "Test";
 
% Call fight program
%playerDamage = fightTest(health,maxHit);
%health = health - playerDamage;

% Call fight program (with loot)
% [playerDamage,fightWin] = fightTest2(health,maxHit);
% switch fightWin
%     case {1,3}
%         loot = generateLootTest("healItem");
%     case 2
%         loot = generateLootTest("weapon");
% end
% if fightWin > 0
%     switch loot
%         case "Mini shield"
%             inventory(1) = inventory(1) + 1;
%         case "Shield pot"
%             inventory(2) = inventory(2) + 1;
%         case "Chug splash"
%             inventory(3) = inventory(3) + 1;
%         case "Chug Jug"
%             inventory(4) = inventory(4) + 1;
%         case "Boogie Bomb"
%             weapon = loot;
%         case "Bolt-action sniper"
%             weapon = loot;
%         case "Golden SCAR"
%             weapon = loot;
%         case "Revolver"
%             weapon = loot;
%     end
% end
% health = health - playerDamage;

disp(inventory)

% Boss fight program.
playerDamage = bossFightTest(health,maxHit,inventory);
health = health - playerDamage;
