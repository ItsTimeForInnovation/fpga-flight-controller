%altitude_control
function Td = altitude_control(Z, W, params)

    ez = Z - params.Zd;
    Td = params.m*params.g + params.Kp_z*ez + params.Kd_z*W;

    Td = max(Td, 0);

end

