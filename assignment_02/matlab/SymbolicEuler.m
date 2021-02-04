clear all
close all
clc

%%% FILL IN ALL PLACES LABELLED "complete"
% Again, please check out the functionality of the symbolic toolbox used
% here
syms rho theta psi real
syms drho dtheta dpsi real

% Symbols for the angles and their derivatives 
A     = [rho;theta;psi];
dA    = [drho;dtheta;dpsi];

% rotation about x
R{1} =  [1 0 0;
         0 cos(A(1)) -sin(A(1));
         0 sin(A(1)) cos(A(1))];


% rotation about y
R{2} =  [cos(A(2)) 0 sin(A(2));
         0 1 0 ;
         -sin(A(2)) 0 cos(A(2))];

% rotation about z
R{3} =  [cos(A(3)) -sin(A(3)) 0;
         sin(A(3)) cos(A(3)) 0;
         0 0 1];


%Rotation matrix. Using function 'simplify' from the toolbox for convenience 
Rba = simplify(R{1}*R{2}*R{3});

% Time deriviatve of the rotation matrix (Hint: use the function "diff"
% (the one from the Symbolic Math Toolbox) to differentiate the matrix w.r.t. the
% angles rho, theta, psi one by one, and form the whole time derivative using the
% chain rule and summing the deriviatives)
dRba = 0;
for k = 1:3
    dRba = dRba + diff(Rba, A(k)) * dA(k);
end

% Use the formula relating Rba, dRba and Omega (skew-symmetric matrix
% underlying the angular velocity omega) (6.9.5 in the book). Hint: What is the
% inverse of Rba? 
Omega = simplify(Rba.'*dRba);

% Extract the angular veloticy vector omega (3x1) from the matrix Omega (3x3)
omega = [Omega(3 ,2);
         Omega(1 ,3);
         Omega(2 ,1)];

% This line generates matrix M in the relationship omega = M*dA
M = jacobian(omega,dA);

% This line creates a Matlab function returing Rba and M for a given
% A  = [rho;theta;psi], can be called using [Rba,M] = Rotations(state);
matlabFunction(Rba,M,'file','Rotations','vars',{A})
