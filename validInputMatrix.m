function valid=validInputMatrix(battleMatrix)
%
%validInputMatrix function checks if the ships placed on the board follow
%the defined properties(size in this case) and returns 1 or 0
%
%Input parameters - input battle matrix to be validated
%
%Return value - 1(valid) or 0(invalid)

    valid=1; %return value of function
    %traverse through the matrix
    for i=1:10
        for j=1:10
            %extracting ship no. from block
            x=battleMatrix(i,j);
            %if block not already valid
            if x<500
                %to make sure shot blocks are also taken in consideration
                x=mod(x,100);
                if (~isequal(x,0)) && (~isequal(x,100))
                    %mapping ship no. with shipsize
                    shipSize=[5 4 3 3 2];
                    %size of the ship
                    currentSize=shipSize(1,x);
                    if x<500
                        %denotes count of continous blocks of same type of ship
                        sz=1;
                        k=j+1;
                        while k<=10
                            %counting no. of continous blocks of same type
                            %of ship in rightward direction
                            if (~isequal(battleMatrix(i,k),x)) && (~isequal(battleMatrix(i,k),(100+x)))
                                break;
                            end
                            sz=sz+1;
                            k=k+1;
                        end
                        if (mod(sz,currentSize)==0)
                            %check if block contributes to valid ship in
                            %horizontal direction
                            battleMatrix(i,j:(j+currentSize-1))=500+x;
                        else
                            sz=1;
                            k=i+1;
                            while k<=10
                                %counting no. of continous blocks of same type
                                %of ship in downward direction
                                if (~isequal(battleMatrix(k,j),x)) && (~isequal(battleMatrix(k,j),(100+x)))
                                    break;
                                end
                                sz=sz+1;
                                k=k+1;
                            end
                            if (mod(sz,currentSize)==0)
                                %check if block contributes to valid ship in
                                %vertical direction
                                battleMatrix(i:(i+currentSize-1),j)=500+x;
                            else
                                %even if one block does not contribute to
                                %horizontal or vertical direction
                                %matrix is invalid
                                valid=0;
                                return;
                            end
                        end
                    end
                end
            end
        end
    end
end