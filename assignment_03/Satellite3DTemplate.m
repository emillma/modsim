clear all
%close all
clc

% Define your initial state, e.g. as:
earth_radius = 6356e+3;
orbit_height = 36000e+3;
% orbit_height = -1000e+3;

position = orbit_height * [0 0 1]';
I = eye(3);
orientation = reshape(I, [9, 1]); %nedover
velocity = 3066.89 * [0 1 0]';
angular_velocity = [1 / (1 * 3600) 0 0]'; % omega

m = 0.1;
length = 0.5;
d = 0.25 * [1 1 1]';
inertia = (1/6) * m * length * eye(3) + m * (d' * d * I - d * d');
parameters = inertia;
state = [
    position;
    orientation;
    velocity;
    angular_velocity
    ];

% "parameters" allows you to pass some parameters to the "SatelliteDynamics" function

time_final = 3600 * 24 * 7; %Final time

% Simulate satellite dynamics
[time, statetraj] = ode45(@(t, x)SatelliteDynamics(t, x, parameters), [0, time_final], state);

% Here below is a template for a real-time animation
tic; % resets Matlab clock
time_display = 0; % time displayed

animation_speed = 3600;

while time_display < time(end)

    time_animate = toc * animation_speed; % get the current clock time

    % Interpolate the simulation at the current clock time
    state_animate = interp1(time, statetraj, time_animate);

    ScaleFrame = 8; % Scaling factor for adjusting the frame size (cosmetic)
    FS = 15; % Fontsize for text
    SW = 0.035; % Arrows size

    p = reshape(state_animate(1:3), [3, 1]) * 1e-7; % reduce scale to fit
    R = reshape(state_animate(4:12), [3, 3]);
    velocity = state_animate(13:15);
    omega = reshape(state_animate(16:18), [3, 1]);

    figure(1); clf; hold on
    MakeFrame(zeros(3, 1), eye(3), ScaleFrame, FS, SW, 'a', 'color', 'k')
    MakeFrame(p, R, ScaleFrame * 0.5, FS, SW, 'b', 'color', 'r')
    MakeArrow(p, R * omega, FS, SW, '$$\omega$$', 'color', [0, 0.5, 0])
    DrawRectangle(p, R, 'color', [0.5, 0.5, 0.5]);
    FormatPicture([0; 0; 2], 0.5 * [73.8380 21.0967 30.1493])

    if time_display == 0
        display('Hit a key to start animation')
        pause
        tic
    end

    time_display = time_animate; % get the current clock time

end
