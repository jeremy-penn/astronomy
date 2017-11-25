function vr = rel_doppler(l_o, l_r)
    %% calculates the radial velocity of an object using the relativistc doppler shift
    %
    % Jeremy Penn
    % 24/11/17
    %
    % function vr = rel_doppler()
    %
    % Inputs:   o l_o   - The observed wavelength
    %           o l_r   - The rest wavelength
    %
    % Outputs:  o vr    - The radial velocity
    %
    
    %% speed of light
    c = 2.998e8; % [m/s] speed of light in a vacuum
    
    %% calculate redshift parameter
    z = (l_o - l_r) / l_r;
    
    %% calculate the radial velocity
    vr = (c * (z + 1)^2 - 1) / ((z+1)^2 + 1);
end