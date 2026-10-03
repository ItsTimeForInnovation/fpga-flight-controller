% main

parameters

%starting all from 0

phi0 = 0; theta0 = 0; psi0 = 0;
P0 = 0; Q0 = 0; R0 = 0;

U0 = 0; V0 = 0; W0 = 0;
X0 = 0; Y0 = 0; Z0 = 0;

Ix0 = 0; Iy0 = 0; Iz0 = 0;
Iphi0 = 0; Itheta0 = 0; Ipsi0 = 0;

x0 = [phi0; theta0; psi0;
      P0; Q0; R0;
      U0; V0; W0;
      X0; Y0; Z0;
      Ix0; Iy0; Iz0;
      Iphi0; Itheta0; Ipsi0];

tspan = [0 100];

[t, x] = ode45(@(t,x) dynamics(t,x,params), tspan, x0);

phi = x(:,1);
theta = x(:,2);
psi = x(:,3);

P = x(:,4);
Q = x(:,5);
R = x(:,6);

U = x(:,7);
V = x(:,8);
W = x(:,9);

X = x(:,10);
Y = x(:,11);
Z = x(:,12);

Ix = x(:,13);
Iy = x(:,14);
Iz = x(:,15);

Iphi = x(:,16);
Itheta = x(:,17);
Ipsi = x(:,18);

Xd = zeros(size(t));
Yd = zeros(size(t));
Zd = zeros(size(t));

for i = 1:length(t)

    [Xd(i), Yd(i), Zd(i), ~, ~, ~] = trajectory(t(i), params);

end

ex = X - Xd;
ey = Y - Yd;
ez = Z - Zd;

altitude = -Z;
altitude_d = -Zd;

figure; %euler angles
plot(t, phi, t, theta, t, psi)
xlabel('Time (s)')
ylabel('Angle (rad)')
title('Euler Angles')
legend('\phi', '\theta', '\psi')
grid on;


figure; %body rates
plot(t, P, t, Q, t, R)
xlabel('Time (s)')
ylabel('Body Rate (rad/s)')
title('Body Rates')
legend('P', 'Q', 'R')
grid on;


figure; %body velocities
plot(t, U, t, V, t, W)
xlabel('Time (s)')
ylabel('Velocity (m/s)')
title('Body Velocities')
legend('U', 'V', 'W')
grid on;


figure; %positions

plot(t, X, t, Y, t, Z)
xlabel('Time (s)')
ylabel('Position (m)')
title('Positions wrt Earth')
legend('X', 'Y', 'Z')
grid on;


figure; %+ve altitude
plot(t, altitude, t, altitude_d, '--')
xlabel('Time (s)')
ylabel('Altitude (m)')
title('Altitude')
legend('Actual', 'Desired')
grid on;


figure; %errors in posi^n
plot(t, ex, t, ey, t, ez)
xlabel('Time (s)')
ylabel('Position Error (m)')
title('Position Errors')
legend('e_X', 'e_Y', 'e_Z')
grid on;


figure; %2d trajectory
plot(X, Y)
hold on
plot(Xd, Yd, '--')
xlabel('X (m)')
ylabel('Y (m)')
title('Horizontal Trajectory')
legend('Actual Trajectory', 'Desired Trajectory')
grid on;


figure; %3d trajectory

plot3(X, Y, -Z)
hold on
plot3(Xd, Yd, -Zd, '--')
xlabel('X (m)')
ylabel('Y (m)')
zlabel('Z (m)')
title('3D Trajectory')
legend('Actual Trajectory', 'Desired Trajectory')
grid on;
axis equal;