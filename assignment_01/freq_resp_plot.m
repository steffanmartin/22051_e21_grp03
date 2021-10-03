function freq_resp_plot(H,description)
% Function to plot the frequency response of a transfer function H

% Validate input parameter H
if ~isa(H,'zpk') 
    error('Not a zpk type!');
end

% Extract the numerator and denominator polynomials, a and b, from H
[b,a] = tfdata(H,'v');

% Frequency response of new filter transfer function
[h,w] = freqz(b,a,'whole');

% Normalize magnitude vector 
h = h / max(h);

% Plot frequency response
figure('Name',description)
title(description)
plot(w/pi,20*log10(abs(h)))
ax = gca;
ax.XTick = 0:.1:2;
ax.XLim = [0 2];
xlabel('Frequency (normalized) / (\pi rad/sample)')
ylabel('Magnitude (normalized) / (dB)')

end

