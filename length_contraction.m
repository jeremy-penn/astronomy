function dL = length_contraction(L, u)
    %% calculate the length contraction
    %
    % Jeremy Penn
    % 24/11/17
    %
    % function dL = length_contraction(L, u)
    %
    % Inputs:   o L     - The length in the rest frame
    %           o u     - The velocity vector
    %
    % Outputs:  o dL    - The length contraction
    %
    
    %% constants
    c  = 2.998e8;                           % [m/s] speed of light
    g  = 1 / sqrt( 1 - (dot(u,u)/c^2) );    % gamma factor
    
    %% time dilation
    dL = L / g;
end