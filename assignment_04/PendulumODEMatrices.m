function [W,RHS] = PendulumODEMatrices(in1,F,in3)
%PENDULUMODEMATRICES
%    [W,RHS] = PENDULUMODEMATRICES(IN1,F,IN3)

%    This function was generated by the Symbolic Math Toolbox version 8.5.
%    22-Feb-2021 20:18:40

L = in3(3,:);
M = in3(2,:);
dtheta_1 = in1(5,:);
dtheta_2 = in1(6,:);
dx = in1(4,:);
g = in3(4,:);
m = in3(1,:);
theta_1 = in1(2,:);
theta_2 = in1(3,:);
t2 = cos(theta_1);
t3 = cos(theta_2);
t4 = sin(theta_1);
t5 = sin(theta_2);
t6 = L.^2;
t7 = -theta_2;
t8 = L.*M.*t3;
t9 = t7+theta_1;
t10 = L.*M.*t2.*2.0;
t11 = cos(t9);
t12 = sin(t9);
t13 = M.*t6.*t11;
W = reshape([M.*2.0+m,t10,t8,t10,M.*t6.*2.0,t13,t8,t13,M.*t6],[3,3]);
if nargout > 1
    RHS = [F;L.*M.*dtheta_1.*(dx.*t4.*2.0+L.*dtheta_2.*t12)-L.*g.*m.*t4.*2.0;L.*M.*dtheta_2.*(dx.*t5-L.*dtheta_1.*t12)-L.*g.*m.*t5];
end
