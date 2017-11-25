function [rp, tp] = lorentz(r, t, u)
    %% calculate the lorentz transformation
    %
    % Jeremy Penn
    % 24/11/17
    %
    % function [rp, tp] = lorentz(x, y, z, t, u)
    %
    % Inputs:   o r     - The position vector
    %           o t     - The time coordinate
    %           o u     - The relative velocity vector
    %
    % Outputs:  o xp    - The transform x coordinate
    %           o yp    - The transform y coordinate
    %           o zp    - The transform z coordinate
    %           o tp    - The transform time coordinate
    %
    
    %% constants
    c  = 2.998e8;                           % [m/s] speed of light
    g  = 1 / sqrt( 1 - (dot(u,u)/c^2) );    % gamma factor
    
    n  = u/norm(u);
    
    %% lorentz transform
    tp = g*( t - dot(u,r)/c^2 );
    rp = r + (g - 1)*dot(r,n)*n - g*t*u;
end