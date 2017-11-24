function dt = time_dilation(t, u)
    %% calculate the time dilation
    %
    % Jeremy Penn
    % 24/11/17
    %
    % function dt = time_dilation(t, u)
    %
    % Inputs:   o t     - The time in the rest frame
    %           o u     - The velocity vector
    %
    % Outputs:  o dt    - The time dilation
    %
    
    %% constants
    c  = 2.988e8;                           % [m/s] speed of light
    g  = 1 / sqrt( 1 - (dot(u,u)/c^2) );    % gamma factor
    
    %% time dilation
    dt = g * t;
end