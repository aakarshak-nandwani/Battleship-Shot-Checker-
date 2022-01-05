function outcome = checkRowSink(battleMatrix, rowShot, colShot)
%
%checkRowSink function checks if the ship 
%oriented in horizontal direction is sunk or not
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

%matrix left edge condition
if currentSize>=colShot    
    tmp=colShot-1;
else
    tmp=currentSize-1;
end

%check for presence of ship blocks in leftwards direction
sz=0;
for i=(colShot-1):-1:(colShot-tmp)
    if battleMatrix(rowShot,i)~=(100+x)
        break;
    end
    sz=sz+1;
end

%check for presence of ship blocks in rigthwards direction 
%for remaining ship blocks
for i=(colShot+1):(colShot+currentSize-sz-1)
    if i>10
        %if loop variable crosses matrix edge
        outcome=x;
        break;
    else
        if battleMatrix(rowShot,i)~=(100+x)
            %ship does not sink if all blocks of same ship are not shot 
            outcome=x;
            break;
        end
    end
end

%if given coordinates are the rightmmost block of the sinking ship
if (currentSize-1)==sz
    outcome=100+x;
%ship sinks if all blocks of same ship are shot 
elseif (isequal(i,(colShot+currentSize-sz-1)) && (i<=10) && isequal(battleMatrix(rowShot,i),(100+x)))
    outcome=100+x;
%ship does not sink if all blocks of same ship are not shot 
else
    outcome=x;
end

end