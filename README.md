# Hermite_Interpolation
Scientific Computing

The Hermite interpolating polynomial interpolates function <br>
as well as its certain order derivatives at given data points. <br>

Conditions satisfied by Hermite polynomial :<br>
**H(X<sub>i</sub>) = f(X<sub>i</sub>)** and \
**H<sup>'</sup>(X<sub>i</sub>) = f<sup>'</sup>(X<sub>i</sub>)** where i = 0,1,2...n

*Since there are **2n+2** conditions to be satisfied, <br>
**H(X)** must be a polynomial of degree ≤ **2n+1**.*

The required polynomial is written as :<br>
**H(X) = ∑<sup>n</sup><sub>i=0</sub>  *A<sub>i</sub>(X)f(X<sub>i</sub>)* +  ∑<sup>n</sup><sub>i=0</sub>  *B<sub>i</sub>(X)f<sup>'</sup>(X<sub>i</sub>)***

Using Lagrange fundamental polynomials **l<sub>i</sub>(X)**, We have <br>
**A<sub>i</sub>(X) = [1 - 2(X - X<sub>i</sub>)l<sub>i</sub><sup>'</sup>(X<sub>i</sub>)]l<sub>i</sub><sup>2</sup>(X)** <br>
**B<sub>i</sub>(X) = (X - X<sub>i</sub>)l<sub>i</sub><sup>2</sup>(X)**

Error at a point "ʓ" is given by : <br>
**E(f ; ʓ) = (ʓ - X<sub>0</sub>)\*(ʓ - X<sub>1</sub>)\*...(ʓ - X<sub>n</sub>)\*f<sup>2n+2</sup>(ʓ)/(2n+2)!**

Bound on error is given by : <br>
**|f(X) - H(X)| = max{(X - X<sub>0</sub>)\*(X - X<sub>1</sub>)\*...(X - X<sub>n</sub>)}\*M/(2n+2)!**\
Where **M = max(f<sup>2n+2</sup>(ʓ)); X<sub>0</sub> ≤ ʓ ≤ X<sub>n</sub>**
