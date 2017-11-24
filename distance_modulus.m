function Mm = distance_modulus(d)
    %% calculates the distance modulus of a star of known distance
    %
    % Jeremy Penn
    % 23/11/17
    %
    % function Mn = distance_modulus(d)
    %
    % Inputs:   o d     - Distance to the star [pc]
    %
    % Outputs:  o Mn    - Distance modulus
    
    %% calculate m - M
    Mm = 5*log10(d) - 5;
end