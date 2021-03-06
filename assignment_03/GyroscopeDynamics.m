function [statedot] = GyroscopeDynamics(t, x, parameters)
    z = [0; 0; 1];
    g = 9.81;
    R = reshape(x(1:9), 3, 3);
    omega = x(10:12);
    omegacross = [0, -omega(3), +omega(2);
            +omega(3), 0, -omega(1);
            -omega(2), +omega(1), 0];
    L = parameters(1);
    m = parameters(2);
    M = reshape(parameters(3:11), 3, 3);
    statedot = [reshape(R * omegacross, 9, 1);
            -inv(M) * (omegacross * (M * omega) - L * m * g * cross(z, R' * z))];
end
