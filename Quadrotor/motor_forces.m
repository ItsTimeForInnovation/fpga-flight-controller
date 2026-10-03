% % motor_forces

% here, T1 = b(omega1)^2
% T2 = b(omega2)^2 and so on. 
% using X orientation configuration
% let T = total thrust force

function [T1, T2, T3, T4, T, L, M, N] = motor_forces(omega1, omega2, ...
                                     omega3, omega4, params)
    T1 = params.b*(omega1)^2;
    T2 = params.b*(omega2)^2;
    T3 = params.b*(omega3)^2;
    T4 = params.b*(omega4)^2;
    
    T = T1 + T2 + T3 + T4;
    L = params.l*params.b*(omega1^2 - omega2^2 - omega3^2 + omega4^2)/sqrt(2);
    M = params.l*params.b*(omega1^2 + omega2^2 - omega3^2 - omega4^2)/sqrt(2);
    N = params.d*(omega1^2 - omega2^2 + omega3^2 - omega4^2);

end
