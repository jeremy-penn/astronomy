function P = kepler3(m1, m2, a)
    %% calculate the period of an orbit using kepler's third law
    %
    % Jeremy Penn
    % 23/11/17
    %
    % function P = kepler3(m1, m2, a)
    %
    % Inputs:   o m1    - The mass of the first object [kg]
    %           o m2    - The mass of the second object [kg]
    %           o a     - The semimajor axis of the orbit [km]
    %
    % Outputs:  o P     - The period of the orbit [s]
    %
    
    % gravitational constant
    G = 6.674e-20; %[km^3/kg s^2]
    
    P = sqrt( (a*4*pi^2) / (G * (m1 + m2)) );
    
end