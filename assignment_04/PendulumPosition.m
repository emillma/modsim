function [out1,out2] = PendulumPosition(in1,in2)
%PENDULUMPOSITION
%    [OUT1,OUT2] = PENDULUMPOSITION(IN1,IN2)

%    This function was generated by the Symbolic Math Toolbox version 8.5.
%    22-Feb-2021 22:37:40

L = in2(3,:);
theta_1 = in1(2,:);
theta_2 = in1(3,:);
x = in1(1,:);
t2 = cos(theta_1);
t3 = sin(theta_1);
t4 = L.*t2;
t5 = L.*t3;
t6 = -t4;
out1 = [t5+x;t6];
if nargout > 1
    out2 = [t5+x+L.*sin(theta_2);t6-L.*cos(theta_2)];
end