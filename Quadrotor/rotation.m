% rotation

function [R_b2e, R_phi, R_theta, R_psi, T_mat] = rotation(phi, theta, psi)
    R_phi = [1, 0, 0;
             0, cos(phi), -sin(phi);
             0, sin(phi), cos(phi)]; % radians. cosd(phi): deg

    R_theta = [cos(theta), 0, sin(theta);
               0, 1, 0;
               -sin(theta), 0, cos(theta)];

    R_psi = [cos(psi), -sin(psi), 0;
             sin(psi), cos(psi), 0;
             0, 0, 1];
    %this R is for converting body to earth like Ve = R_b2e * Vb
    R_b2e = R_psi*R_theta*R_phi; %rmb, its z*y*x, not xyz

    T_mat = [1, sin(phi)*tan(theta), cos(phi)*tan(theta);
             0, cos(phi), -sin(phi);
             0, sin(phi)/cos(theta), cos(phi)/cos(theta)];
end
