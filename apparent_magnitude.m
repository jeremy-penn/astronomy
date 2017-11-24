function m = apparent_magnitude(L)
    %% calculate the apparent magnitude of a star
    %
    % Jeremy Penn
    % 23/11/17
    %
    % function m = apparent_magnitude(F)
    %
    % Inputs:   o L     - The stellar luminosity [W]
    %
    % Outputs:  o m     - The apparent magnitude
    %
    
    %% constants
    Msun = 4.74;
    Lsun = 3.839e26;
    
    %% calculate the apparent mag
    m = Msun - 2.5*log10(L/Lsun);
    
end