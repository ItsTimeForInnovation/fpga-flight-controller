%position_control


function [Td, phi_d, theta_d, psi_d, ex, ey, ez] = position_control(t, ...
    X, Y, Z, U, V, W, phi, theta, psi, IX, IY, IZ, params)

    [Xd, Yd, Zd, Xd_dot, Yd_dot, Zd_dot] = trajectory(t, params);

    ex = X - Xd;
    ey = Y - Yd;
    ez = Z - Zd;

    [R_b2e, ~, ~, ~, ~] = rotation(phi, theta, psi);

    earth_velocity = R_b2e*[U; V; W];

    Xdot = earth_velocity(1);
    Ydot = earth_velocity(2);
    Zdot = earth_velocity(3);

    ex_dot = Xdot - Xd_dot;
    ey_dot = Ydot - Yd_dot;
    ez_dot = Zdot - Zd_dot;

    a_xd = -params.Kp_x*ex - params.Ki_x*IX - params.Kd_x*ex_dot;
    a_yd = -params.Kp_y*ey - params.Ki_y*IY - params.Kd_y*ey_dot;
    a_zd = -params.Kp_z*ez - params.Ki_z*IZ - params.Kd_z*ez_dot;

    spec_force = params.m*[a_xd; a_yd; a_zd];
    grav = params.m*params.g*[0; 0; 1];
    air_res = [params.FAx; params.FAy; params.FAz];

    F_required = spec_force - grav - air_res;
    Td = norm(F_required);
    b3_d = -F_required/Td;

    
    %refer notes for derivation:
    psi_d = params.psi_d;

    theta_d = atan2(b3_d(1)*cos(psi_d) + b3_d(2)*sin(psi_d), ...
                    b3_d(3));

    phi_d = atan2(b3_d(1)*sin(psi_d) - b3_d(2)*cos(psi_d), ...
                  sqrt(b3_d(3)^2 + ...
                  (b3_d(1)*cos(psi_d) + ...
                   b3_d(2)*sin(psi_d))^2));

end
