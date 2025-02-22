% Basic healing mechanic

function damageHealed = healingTest(item,inventory)

switch item
    case 1
        if inventory(item) > 0
            damageHealed = 10;
            fprintf("10 points of health restored.\n")
        end
    case 2
        if inventory(item) > 0
            damageHealed = 25;
            fprintf("25 points of health restored.\n")
        end
    case 3
        if inventory(item) > 0
            damageHealed = 50;
            fprintf("50 points of health restored.\n")
        end
    case 4
        if inventory(item) > 0
            damageHealed = 75;
            fprintf("75 points of health restored.\n")
        end
end
end