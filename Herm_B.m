function Bi = Herm_B(T, i, N)
% A supporting function to calculate Hermite interpolating polynomaial
    syms x Li(x) B(x)
    
    Li(x) = LagPoly(T, i, N);
    B(x) = (x - T{i,1})*Li(x)*Li(x)*T{i,3};
    Bi = B(x);
end