function blackbody(L0, R0)
    %% calculates the Stefan-Boltzmann equation to deteremin Te and lamda_m
    %
    % Jeremy Penn
    % 23/11/17
    %
    % function blackbody()
    %
    % Inputs:   o L0    - Luminosity [W]
    %           o R0    - Stellar radius [m]
    %
    
    %% SB constant
    sb = 5.6704e-8; % [W / m^2 K^4] Stefan-Boltzmann constant
    
    %% inputs
    if nargin < 2
        L = input('Input the luminosity [W]:\n');
        R = input('Input the stellar radius [m]:\n');
    else
        L = L0;
        R = R0;
    end
        
    %% calculate the effective temperature
    Te = ( L/(4*pi*sb*R^2) )^.25;
    
    %% calculate the surface flux
    Fs = sb*Te^4;
    
    %% calculate Wien's displacement law
    lamda_m = .002897755 / Te; % [m]
    
    %% output the results
    
    clc;
    fprintf('-------------------------------------------------\n\n')
    fprintf('Stellar properties: \n')
    fprintf('\t surface temp T   = %.0f [K]\n',Te)
    fprintf('\t surface flux F   = %.3e [W/m^2]\n',Fs)
    fprintf('\t surface temp l_m = %.3e [m]\n\n',lamda_m)
    fprintf('-------------------------------------------------\n')
end