function precess_ra_and_dec(t, ra, dec)
    %% precess ra and dec since J2000
    %
    % Jeremy Penn
    % 23/11/17
    %
    % function precess_ra_and_dec(t, ra, dec)
    %
    % Input:    o t     - The time in fractions of year since J2000
    %           o ra    - The J2000 RA in HH:MM:SS string
    %           o dec   - The J2000 DEC in [deg, min, sec] vector form
    %
    
    %% convert hours to deg
    split = strsplit(ra,':');
    ra_vec  = [str2double(split(1)), str2double(split(2)), str2double(split(3))];
    ra  = ra_vec(1) + ra_vec(2)/60 + ra_vec(3)/3600;
    
    ra  = ra * 15;
    
    %% convert dms to deg
    dec = dms2degrees(dec);
    
    %% convert dec from -90:90 to 0:180
    if dec < 0
        dec = dec + 180;
    end 
    
    %% convert deg to radians
    rad = pi/180;
    
    ra  = ra * rad;
    dec = dec * rad;
    
    a   = 1.2812323 * rad; b = .0003879*rad; c = .0000101*rad;
    d   = .556753*rad; e = -.0001185*rad; f = -.0000116*rad;
    
    %% calculate M, N, & T
    T   =  (t - 2000) / 100;
    
    M   = a*T + b*T^2 + c*T^3;
    N   = d*T + e*T^2 + f*T^3;
    
    %% calculate change in ra and dec
    dra = M + N * sin(ra)*tan(dec);
    dde = N * cos(ra);
    
    %% new ra and dec
    n_ra  = (dra + ra)/rad;
    n_dec = (dde + dec)/rad;
    
    n_ra  = mod(n_ra, 360);
    n_dec = mod(n_dec, 180);
    
    %% output the results
    if n_dec > 90
        n_dec = n_dec - 180;
    end
    
    dms_d = degrees2dms(n_dec);
    dms_a = degrees2dms(n_ra/15);
    
    a_hr  = dms_a(1);
    a_min = dms_a(2);
    a_sec = dms_a(3);
    
    
    clc;
    fprintf('------------------------------------------------\n\n')
    fprintf('The precessed coordinates:\n')
    fprintf('\t del   = %f [deg] %f [min] %.1f [sec]\n',dms_d(1),dms_d(2),dms_d(3))
    fprintf('\t alpha = %f [hours] %f [min] %.1f [sec]\n\n',a_hr, a_min, a_sec)
    fprintf('------------------------------------------------\n')
end