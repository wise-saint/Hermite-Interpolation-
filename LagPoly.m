Copyright (c) 2021, 9mpd
All rights reserved.

This source code is licensed under the MIT license found in the
LICENSE file in the root directory of this source tree.

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
