%attitude_control
function [Ld, Md, Nd, ephi, etheta, epsi] = attitude_control( ...
    phi, theta, psi, P, Q, R, phi_d, theta_d, psi_d, ...
    Iphi, Itheta, Ipsi, params)

    ephi = phi_d - phi;
    etheta = theta_d - theta;
    epsi = psi_d - psi;

    Ld = params.Kp_phi*ephi + params.Ki_phi*Iphi - params.Kd_phi*P;
    Md = params.Kp_theta*etheta + params.Ki_theta*Itheta - params.Kd_theta*Q;
    Nd = params.Kp_psi*epsi + params.Ki_psi*Ipsi - params.Kd_psi*R;

end
