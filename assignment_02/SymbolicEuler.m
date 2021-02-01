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
R{1} = [complete];

% rotation about y
R{2} = [complete];

% rotation about z
R{3} = [complete];

%Rotation matrix. Using function 'simplify' from the toolbox for convenience 
Rba = simplify(complete);

% Time deriviatve of the rotation matrix (Hint: use the function "diff"
% (the one from the Symbolic Math Toolbox) to differentiate the matrix w.r.t. the
% angles rho, theta, psi one by one, and form the whole time derivative using the
% chain rule and summing the deriviatives)
dRba = complete;

% Use the formula relating Rba, dRba and Omega (skew-symmetric matrix
% underlying the angular velocity omega) (6.9.5 in the book). Hint: What is the
% inverse of Rba? 
Omega = simplify(complete);

% Extract the angular veloticy vector omega (3x1) from the matrix Omega (3x3)
omega = complete;

% This line generates matrix M in the relationship omega = M*dA
M = jacobian(omega,dA)

% This line creates a Matlab function returing Rba and M for a given
% A  = [rho;theta;psi], can be called using [Rba,M] = Rotations(state);
matlabFunction(Rba,M,'file','Rotations','vars',{A})
