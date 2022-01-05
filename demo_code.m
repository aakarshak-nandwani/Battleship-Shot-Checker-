battleMatrix = [0 0 0 3 0 0 2 2 2 2;
                0 0 0 3 0 0 0 0 0 0;
                2 0 0 3 0 4 104 104 0 5;
                102 0 100 0 0 0 0 0 0 5;
                2 0 0 0 0 100 100 0 0 0;
                2 100 0 0 0 5 0 100 0 103;
                104 4  104 100 0 5 0 0   0 103;
                0   0  4   4   4 0 0 100 0 3;
                0   0  104 104 104 0 0 0 0 0;
                0 0 0 0 0 1 1 101 101 101];  % input battle matrix
% coordinates of the shot 
rowShot = 10;  
colShot = 7;
% checking the outcome 
[outcome, updatedBattleMatrix] = battleshipShotCheck(battleMatrix, rowShot, colShot)


