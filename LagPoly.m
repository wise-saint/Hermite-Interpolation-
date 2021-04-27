function Li = LagPoly(T, i, N)
% A supporting function to Herm_A and Herm_B functions.
    syms x Nr(x)
    
    Nr(x) = 1;
    Dr = 1;
    for j = 1:N
        if(j ~= i)
            Nr(x) = Nr(x)*(x-T{j,1});
            Dr = Dr*(T{i,1}-T{j,1});
        end
    end
    Li = Nr(x)/Dr;
end
