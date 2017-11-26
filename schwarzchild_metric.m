function ds = schwarzchild_metric(r, th, dphi, dr, dth, dt, M)
    %% calculate the Schwarzchild metric
    %
    % Jeremy Penn
    % 25/11/17
    %
    % function ds = schwarzchild_metric(r, th, phi, dr, dth, dt)
    %
    % Inputs:   o r     - Radius above the mass M [km]
    %           o th    - Azimuthal angle [deg]
    %           o phi   - Change in RA angle [deg]
    %           o dr    - Change in r [km]
    %           o dth   - Change in th [deg]
    %           o dt    - Change in time [s] [vector]
    %           o M     - Mass of the central body [kg]
    %
    % Output:   o ds    - The metric (squared) [vector]
    %
    
    %% constants
    G = 6.674e-20;  % [km^3 / kg s^2]
    c = 2.998e5;    % [km/s]
    
    %% convert deg to rad
    deg = pi/180;
    
    th = th*deg;
    dphi = dphi*deg;
    dth = dth*deg;
    
    %% schwarzchild metric
    ds = zeros(length(dt),1);
    
    for i = 1:length(dt)
        sq = sqrt( 1 - (2*G*M)/(r*c^2) );
        ds(i) = ( c*dt(i)*sq )^2 - ( dr/sq )^2 - ( r*dth )^2 - ( r*sin(th)*dphi )^2;
    end
end