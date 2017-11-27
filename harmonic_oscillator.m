function harmonic_oscillator(A, beta, w, dt, delta)
    %% calculates the simple harmonic oscillator
    %
    % Jeremy Penn
    % 27/11/17
    %
    % Inputs:   o A     - Amplitude
    %           o beta  - Damping coefficient
    %           o w     - Angular frequency
    %           o dt    - Time interval [s]
    %           o delta - Phase difference [rad]
    %
    clc;
    
    %% delta
    if nargin == 4
        d = 0;
    else
        d = delta;
    end
    
    %% determine the dampening
    if w^2 > beta^2
        w1 = sqrt(w^2 - beta^2);
        
        if beta == 0
            % no damping oscillator
            fprintf('The motion is not damped \n')
            t  = linspace(0,dt);
            x  = zeros(length(t),1);
            v  = zeros(length(t),1);
            
            for i = 1 : length(t)
                x(i) = A*exp(-beta*t(i))*cos(w1*t(i) - d);
                v(i) = -A*exp(-beta*t(i)) * ( beta*cos(w1*t(i) - d) + w1*sin(w1*t(i) - d) );
            end
        else
            
            % underdamped oscillator
            fprintf('The motion is underdamped\n')
            t  = linspace(0,dt);
            x  = zeros(length(t),1);
            v  = zeros(length(t),1);
            
            for i = 1 : length(t)
                x(i) = A*exp(-beta*t(i))*cos(w1*t(i) - d);
                v(i) = -A*exp(-beta*t(i)) * ( beta*cos(w1*t(i) - d) + w1*sin(w1*t(i) - d) );
            end
        end
        
    elseif w^2 < beta^2
        w1 = sqrt(beta^2 - w^2);
        
        % overdamped oscillator
        fprintf('The motion is overdamped\n')
        t  = linspace(0,dt);
        x  = zeros(length(t),1);
        v  = zeros(length(t),1);
        
        for i = 1 : length(t)
            x(i) = A*exp(-beta*t(i))*cos(w1*t(i) - d);
            v(i) = -A*exp(-beta*t(i)) * ( beta*cos(w1*t(i) - d) + w1*sin(w1*t(i) - d) );
        end
    elseif w^2 == beta^2
        % crtically damped oscillator
        B  = input('The motion is crtically damped. Please input amplitude B: \n');
        t  = linspace(0,dt);
        x  = zeros(length(t),1);
        v  = zeros(length(t),1);
        
        for i = 1 : length(t)
            x(i) = (A + B*t(i))*exp(-beta*t(i));
            v(i) = (B - A*beta - B * t(i) * beta)*exp(-beta*t(i));
        end
    end
    
    %% output the phase diagram & print valuable information
    period = 2*pi/w;
    
    fprintf('\n\n--------------------------------------\n\n')
    fprintf('Oscillator properties:\n')
    fprintf('\t tau = %.2f [s]\n',period)
    fprintf('\t A   = %.2f \n',A)
    fprintf('\t f   = %.2f [Hz]\n', 1/period)
    fprintf('\n\n--------------------------------------\n\n')
    
    figure(1)
    subplot(2,1,1)
    plot(x,v)
    title('Phase diagram')
    xlabel('x (m)')
    ylabel('v (m/s)')
    
    subplot(2,1,2)
    ax2 = gca;
    plot(t,x)
    title('Position vs Time')
    ax2.XAxisLocation = 'origin';
    xlabel('Time (s)')
    ylabel('Position (m)')
end