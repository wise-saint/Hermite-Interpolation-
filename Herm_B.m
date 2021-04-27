Copyright (c) 2021, 9mpd
All rights reserved.

This source code is licensed under the MIT license found in the
LICENSE file in the root directory of this source tree.

function Bi = Herm_B(T, i, N)
% A supporting function to calculate Hermite interpolating polynomaial
    syms x Li(x) B(x)
    
    Li(x) = LagPoly(T, i, N);
    B(x) = (x - T{i,1})*Li(x)*Li(x)*T{i,3};
    Bi = B(x);
end
