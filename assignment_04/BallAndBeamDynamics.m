function [dstate] = BallAndBeanDynamics(t, x, parameters)
%PENDULUMODEMATRICES
%    [W,RHS] = PENDULUMODEMATRICES(IN1,F,IN3)
%    This function was generated by the Symbolic Math Toolbox version 8.5.
%    22-Feb-2021 19:18:47
% state = [q;dq];
% param = [J; M; R; g];
q = x(1:2);
dq = x(3:4);
F= 200*(x(1) - x(2)) + 70*(x(3) - x(4));
[W, RHS] = BallAndBeamODEMatrices(x, F, parameters);
dstate = [dq; W\RHS];
end
