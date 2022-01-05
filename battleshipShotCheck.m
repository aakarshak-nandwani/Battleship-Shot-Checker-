function [outcome, battleMatrix] = battleshipShotCheck(battleMatrix, rowShot, colShot)
%
%battleshipShotCheck function checks if shot hit sinks the ship or not
%and updates the matrix after the shot, and checks for error conditions
%
%Input parameters - input battle matrix,
%row and column (coordinates of the shot taken)
%
%Return value - 100+ship no.(sunk) or ship no.(not sunk) 
%else -96 -> invalid input arguments of coordinates,
%     -97 -> shot coordinates not on the battleMatrix, 
%     -98 -> battleMatrix contains one or more undefined values,
%     -99 -> battleMatrix out of proportion

%% invalid input arguments of coordinates
if (isstring(rowShot)||isstring(colShot)||ischar(rowShot)||ischar(colShot))
    outcome=-96;
    return;
end
%% shot coordinates are not on the battleMatrix
if ~((rowShot>=1)&&(rowShot<=10)&&(colShot>=1)&&(colShot<=10))
    outcome=-97;
    return;
end
%% battleMatrix contains one or more undefined values
for i=1:10
    for j=1:10
        if ~((battleMatrix(i,j)>=0 && battleMatrix(i,j)<=5) || (battleMatrix(i,j)>=100 && battleMatrix(i,j)<=105))
            outcome=-98;
            return;
        end
    end
end
%% battleMatrix out of proportion
s=size(battleMatrix);
if (~(isequal(s(1,1),10) && isequal(s(1,2),10))) || (~validInputMatrix(battleMatrix))
    outcome=-99;
    return;
end
%% update battleMatrix
temp_matrix=battleMatrix;
% to check if the block is already shot
if battleMatrix(rowShot, colShot)<100
    temp_matrix(rowShot, colShot)=battleMatrix(rowShot, colShot)+100;
end
%% 
x=battleMatrix(rowShot,colShot); %no. on the block of matrix
if (x>=100)&&(x<=105)
    outcome=mod(x,100); %if the block has already been shot 
    battleMatrix=temp_matrix;
    return;
elseif (x>=0)&&(x<=5)
    if x==0
        outcome=0; %if the block has no ship
        battleMatrix=temp_matrix;
        return;
    else
        outcome=checkColSink(battleMatrix, rowShot, colShot); %check if ship in vertical direction is sunk
        if outcome<100
            outcome=checkRowSink(battleMatrix, rowShot, colShot); %check if ship in horizontal direction is sunk
        end
        battleMatrix=temp_matrix;
        return;
    end
end
end