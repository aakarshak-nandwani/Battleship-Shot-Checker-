function outcome = checkColSink(battleMatrix, rowShot, colShot)
%
%checkColSink function checks if the ship 
%oriented in vertical direction is sunk or not
%
%Input parameters - input battle matrix,
%row and column (coordinates of the shot taken)
%
%Return value - 100+ship no.(sunk) or ship no.(not sunk)

%mapping ship no. with ship size
shipSize=[5 4 3 3 2];
%ship no.
x=battleMatrix(rowShot,colShot);
%shipsize
currentSize=shipSize(1,x);

%matrix top edge condition
if currentSize>=rowShot
    tmp=rowShot-1;
else
    tmp=currentSize-1;
end

%check for presence of ship blocks in upward direction
sz=0;
for i=(rowShot-1):-1:(rowShot-tmp)
    if battleMatrix(i,colShot)~=(100+x)
        break;
    end
    sz=sz+1;
end

%check for presence of ship blocks in downawards direction 
%for remaining ship blocks
for i=(rowShot+1):(rowShot+currentSize-sz-1)
    if i>10
        %if loop variable crosses matrix edge
        outcome=x;
        break;
    else
        %ship does not sink if all blocks of same ship are not shot 
        if battleMatrix(i,colShot)~=(100+x)
            outcome=x;
            break;
        end
    end
end

%if given coordinates are the bottommost block of the sinking ship
if (currentSize-1)==sz
    outcome=100+x;
%ship sinks if all blocks of same ship are shot 
elseif (isequal(i,(rowShot+currentSize-sz-1)) && (i<=10) && isequal(battleMatrix(i,colShot),(100+x)))
    outcome=100+x;
%ship does not sink if all blocks of same ship are not shot 
else
    outcome=x;
end

end