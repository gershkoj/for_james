T_m = 0.0005;
Fs = 20/T_m;
t = -20*T_m:1/Fs:20*T_m;

%m = -2.*sinc(t./T_m);
m = -2.*(sin(pi.*(t./T_m))./(pi.*t./T_m));
m(find(t == 0)) = -2*1;

figure;
plot(t, m);
xlabel('Time (s)')
ylabel('m(t)');
title('Message Signal in Time Domain')

% frequency domain
M_f = fftshift(fft(m)/length(m));
f = linspace(-Fs/2, Fs/2, length(m));

figure;
plot(f, abs(M_f));
xlabel('Frequency (Hz)');
ylabel('|M(f)|');
title('Message Signal in Frequency Domain');

% Modulated signal
p_mod = 0.5;
k_a = 1/max(m);
A_c = 1;
f_c = 20e3;

f_temp = 2*pi*f_c;
s_t = A_c*(1+k_a*m).*cos(2*pi*f_c*t);

figure;
plot(t, s_t);
xlabel('Time (s)');
ylabel('s(t)');
title('Modulated Signal in Time Domain');
xlim([-0.005, 0.005]);

% frequency domain
S_f = fftshift(fft(s_t)/length(s_t));
f = linspace(-Fs, Fs, length(m));

figure;
plot(f, abs(S_f));
xlabel('Frequency (Hz)');
ylabel('|S(f)|');
title('Modulated Signal in Frequency Domain');
