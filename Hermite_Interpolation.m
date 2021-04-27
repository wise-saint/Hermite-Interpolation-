Copyright (c) 2021, 9mpd
All rights reserved.

This source code is licensed under the MIT license found in the
LICENSE file in the root directory of this source tree.

% Hermite Interpolation

evalin('base','clear')  % Clear Matlab Workspace
clc   % Clear Matlab Command Window

disp("Hermite Interpolation");     % Title of the program.

syms x H(x) r(x)         
H(x) = 0; r(x) = 1;

% Blank Table.
N = input("\nEnter the size of data set : ");
T = table('Size', [N 3], 'VariableTypes', {'double','double','double'});
T.Properties.VariableNames([1 2 3]) = {'X' 'f(X)' '(d/dx)f(X)'};

fprintf("\n<strong>NOTE: If you want a polynomial of degree <= n,</strong>");
fprintf("<strong>then input n+1 data points.</strong>");
fprintf("\nEnter the data set. e.g. {X1,X2,...} & {f(X1),f(X2),...}.\n\n");

% Input Given Data Set. 
for i=1:N
    T{i,1} = input(['Enter X' num2str(i-1) ' : ']);
end
fprintf("\n");
for i=1:N    T{i,2} = input(['Enter f(X' num2str(i-1) ') : ']);
end
fprintf("\n");
for i=1:N
    T{i,3} = input(['Enter (d/dx)f(X' num2str(i-1) ') : ']);
end

for i = 1:N
    H(x) = H(x) + Herm_A(T, i, N) + Herm_B(T, i, N);
end

l = 0;
while l ~= 1
    fprintf("\n\n<strong>Select an option.</strong>");
    fprintf("\n1. Exit");
    fprintf("\n2. Interpolating polynomial");
    fprintf("\n3. Interpolate at a point");
    fprintf("\n4. Truncation error at a Point");
    fprintf("\n5. Bound on error");
    l = input("\nYour option : ");
   
    switch l
        case 1
            break;
        case 2
            fprintf("<strong>\n\nINTERPOLATING POLYNOMIAL</strong>")
            simplify(H(x))
            pause(1);
        case 3
            p = input("\n\nEnter X where you want to interpolate : ");
            fprintf("<strong>Value of f(%.5f) ≈ %.5f</strong>", p, H(p));
            pause(1);
        case 4
            p = input("\n\nEnter X where you want truncation error : ");
            q = 1;
            for i = 1:N
                q = q*(p - T{i,1});
            end
            E = q*q/factorial(2*N);
            fprintf("<strong>The appx. error in f(%.5f) is %.5f*M." + ...
                "</strong>",p,E);
            fprintf("\nWhere M is the %.0fth derivative of f(X) at " + ...
                "X = %.5f.",2*N,p);
            pause(1);
        case 5
            for i = 1:N
                r(x) = r(x)*(x-T{i,1});
            end
            Narayan = matlabFunction(r(x)*r(x));
            Jee = T{1,1};
            Jha = T{N,1};
            z = Jee:0.001:Jha;
            [pks,id] = findpeaks(Narayan(z));
            BE = pks/factorial(2*N);
            fprintf("\n<strong>Bound on error = %.5f*M</strong>", BE(1));
            fprintf("\nWhere M = max[%.0fth derivative of " + ...
                "f(X); %.0f ≤ X ≤ %.0f]", 2*N, T{1,1}, T{N,1});
            pause(1);
         otherwise  
            fprintf('\n<strong>Wrong input.</strong>');
            pause(1);
    end
end

% Graphs Plotting.
figure;
P1 = plot(T{1:N,1},T{1:N,2},"ro");
hold on;
xline(0);
yline(0);
P2 = fplot(H(x),"k");
xlabel("X -->");
xh = get(gca,'xlabel');
u = get(xh,'position');
u(2) = 1.05*u(2); 
set(xh,'position',u);
ylabel("f(X) -->");
yh = get(gca,'ylabel');
v = get(yh,'position');
v(2) = 1.05*v(2);
set(yh,'position',v);
title("\color{magenta}HERMITE INTERPOLATION");
lgd = legend([P1 P2],{'Given Points','Interpolation Curve'});
set(lgd,'fontsize',8,'TextColor','blue'); 
rect = [0.7, 0.7, 0.05, 0.15];
set(lgd, 'Position', rect) 
hold off;
