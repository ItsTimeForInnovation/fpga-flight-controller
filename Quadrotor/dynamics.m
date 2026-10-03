% dynamics

function xdot = dynamics(t, x, params)

    phi = x(1);
    theta = x(2); 
    psi = x(3);
    P = x(4);
    Q = x(5);
    R = x(6);
    U = x(7);
    V = x(8);
    W = x(9);
    X = x(10);
    Y = x(11);
    Z = x(12);

    Ix = x(13);
    Iy = x(14);
    Iz = x(15);
    Iphi = x(16);
    Itheta = x(17);
    Ipsi = x(18);
    
    [Td, phi_d, theta_d, psi_d, ex, ey, ez] = position_control(t, ...
        X, Y, Z, U, V, W, phi, theta, psi, Ix, Iy, Iz, params);

    [Ld, Md, Nd, ephi, etheta, epsi] = attitude_control(phi, theta, ...
        psi, P, Q, R, phi_d, theta_d, psi_d, Iphi, Itheta, Ipsi, params);

    omega = motor_mixing(Td, Ld, Md, Nd, params);
    omega1 = omega(1);
    omega2 = omega(2);
    omega3 = omega(3);
    omega4 = omega(4);

    [R_b2e, R_phi, R_theta, R_psi, T_mat] = rotation(phi, theta, psi);

    [T1, T2, T3, T4, T, L, M, N] = motor_forces(omega1, omega2, ...
        omega3, omega4, params);

    %now we calculate Pdot, Qdot, Rdot
    %then phidot, thetadot, psidot
    %then Udot Vdot Wdot
    %then Xdot Ydot Zdot.
    Pdot = (L - Q*R*(params.Izz - params.Iyy))/params.Ixx;
    Qdot = (M - P*R*(params.Ixx - params.Izz))/params.Iyy;
    Rdot = (N - P*Q*(params.Iyy - params.Ixx))/params.Izz;
    
    bodyrates = [P; Q; R];
    anglesdot = T_mat*bodyrates;

    phidot = anglesdot(1);
    thetadot = anglesdot(2);
    psidot = anglesdot(3);

    Udot = R*V - Q*W - params.g*sin(theta) + params.FAx/params.m;

    Vdot = R*U - P*W + params.g*sin(phi)*cos(theta) ...
        + params.FAy/params.m;

    Wdot = P*V - Q*U + params.g*cos(phi)*cos(theta) ...
        - T/params.m + params.FAz/params.m;

    velocities = [U; V; W];
    positionsdot = R_b2e*velocities;

    Xdot = positionsdot(1);
    Ydot = positionsdot(2);
    Zdot = positionsdot(3);

    IXdot = ex;
    IYdot = ey;
    IZdot = ez;

    Iphidot = ephi;
    Ithetadot = etheta;
    Ipsidot = epsi;

    xdot = [phidot; thetadot; psidot; Pdot; Qdot; Rdot;
            Udot; Vdot; Wdot; Xdot; Ydot; Zdot;
            IXdot; IYdot; IZdot; Iphidot; Ithetadot; Ipsidot];

end