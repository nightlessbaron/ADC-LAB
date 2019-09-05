%% window commands
clc;
close all; 
clear all;

%% parameters
fs = 2000;                              % Sampling frequency
f = 5;                                  % Signal frequency
fc = 250;                               % Carrier frequency
N = 2000;                               % Use 1 sec of data
t = (1:N)/fs;                           % Time axis for plotting

%% Generate AM signal
w = (1:N)* 2*pi*fc/fs;                  % Carrier frequency = 250 Hz
w1 = (1:N)*2*pi*f/fs;                   % Signal frequency = 5 Hz
vc = sin(w);                            % Define carrier
vsig = cos(w1);                         % Define signal

figure(1);
subplot(2,1,1)
plot(t, vc);
title('Carrier Signal');

subplot(2,1,2)
plot(t, vsig);
title('Message Signal');

figure(2);
vm = (1 + .5 * vsig) .* vc;             % Create modulated signal with a Modulation constant = 0.5
subplot(2,1,1)
plot(t,vm,'k');                         % Plot AM Signal....axis, label,title.......
title('Modulation')

%% Demodulation
wn = .02;                               % PSD lowpass filter cut - off frequency
[b,a] = butter(2,wn);                   % Design lowpass filter

vo = vm.*vc;
vo = filter(b,a,vo);
subplot(2,1,2)
plot(t,vo,'k');
title('Demodulation')