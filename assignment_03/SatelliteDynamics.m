function [statedot] = SatelliteDynamics(t, x, parameters)
    position = x(1:3);
    R = reshape(x(4:12), 3, 3);
    velocity = x(13:15);
    omega = x(16:18);
    omegacross = [
            0, -omega(3), +omega(2);
            +omega(3), 0, -omega(1);
            -omega(2), +omega(1), 0
            ];
    inertia = parameters;
    statedot = [
            velocity;
            reshape(R * omegacross, 9, 1);
            GravityAcceleration(position);
            -inv(inertia) * omegacross * inertia * omega
            ];
end

function [g] = GravityAcceleration(position)
    M = 5.972e+24;
    G = 6.674e-11;
    g = -G * M * position / norm(position, 2)^3;
end
