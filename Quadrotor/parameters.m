% parameters

params.m = 1.4;
params.g = 9.8;

params.l = 0.225;

params.Ixx = 0.0211;
params.Iyy = 0.0219;
params.Izz = 0.0366;

params.b = 1.105e-5; %also called c_T, to rename later
params.d = 1.779e-7; %also called c_M, to rename later

params.Cd = 0.073; %translational drag coeff (named as time const ..? )

params.Cdm_x = 0.01; %damping moment coeff abt x
params.Cdm_y = 0.01; %damping moment coeff abt y
params.Cdm_z = 0.0055; %damping moment coeff abt z

params.JRP = 0.0001287; %propeller MoI
params.Tm = 0.02; %motor response time const

params.CR = 1148; %slope relating throttle cmd to motor angular speed
params.wb = -141.4; %constant in the rela^n b/w cmd throttle & ang. speed

params.FAx = 0;
params.FAy = 0;
params.FAz = 0;

params.Kp_x = 1.0;
params.Kp_y = 1.0;
params.Kp_z = 1.5;

params.Ki_x = 0.005;
params.Ki_y = 0.005;
params.Ki_z = 0.005;

params.Kd_x = 1.4;
params.Kd_y = 1.4;
params.Kd_z = 2.2;

params.Kp_phi = 1.0;
params.Kp_theta = 1.0;
params.Kp_psi = 1.0;

params.Ki_phi = 0.001;
params.Ki_theta = 0.001;
params.Ki_psi = 0.001;

params.Kd_phi = 0.25;
params.Kd_theta = 0.25;
params.Kd_psi = 0.25;

%params.Xd = 5;
%params.Yd = 5;
%params.Zd = -10;

params.psi_d = deg2rad(0);
params.trajectory = 3;