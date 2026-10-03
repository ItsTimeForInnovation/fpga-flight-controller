% trajectory

function [Xd, Yd, Zd, Xd_dot, Yd_dot, Zd_dot] = trajectory(t, params)

    switch params.trajectory

        case 1
            %circle 
            Xd = 2*sin(0.1*t);
            Yd = 2 - 2*cos(0.1*t);
            Zd = -10;

            Xd_dot = 0.2*cos(0.1*t);
            Yd_dot = 0.2*sin(0.1*t);
            Zd_dot = 0;

        case 2
            %conical spiral
            Xd = ((2*pi*t)/50)*sin(0.1*t);
            Yd = (2*pi*t)/50 - ((2*pi*t)/50)*cos(0.1*t);
            Zd = -0.5*t;

            Xd_dot = (2*pi/50)*sin(0.1*t) + ((2*pi*t)/50)*0.1*cos(0.1*t);

            Yd_dot = (2*pi/50)*(1 - cos(0.1*t)) ... 
                     + ((2*pi*t)/50)*0.1*sin(0.1*t);

            Zd_dot = -0.5;

        case 3
        %lemniscate

        Xd = 10*sin(0.1*pi*t);
        Yd = 10*sin(0.1*pi*t)*cos(0.1*pi*t);
        Zd = -10;

        Xd_dot = pi*cos(0.1*pi*t);
        Yd_dot = 0.5*pi*(cos(0.1*pi*t)^2 - sin(0.1*pi*t)^2);
        Zd_dot = 0;

    end

end