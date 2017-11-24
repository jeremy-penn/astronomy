function F = radiant_flux(L, r)
    %% calculate the radiant flux at distance r from the source
    %
    % Jeremy Penn
    % 23/11/17
    %
    % Inputs:   o L     - Stellar luminosity [W]
    %           o r     - Distance to the source [AU]
    %
    % Outputs:  o F     - The radiant flux [W / m ^2]
    %
    
    %% AU to m
    au_to_m = 1.496e11;
    
    r = r * au_to_m;
    
    %% calculate radiant flux
    F = L / (4*pi*r^2);
end