% main.m 
% Calculates the Fourier series through symbolic cacluations 
 
clear all 
 
% numerical Trig Fourier Series 
syms t; 
 
tau = 1; 
T0 = 5; 
k_max = 3; 
 
% !!!IMPORTANT!!!: the signal definition must cover [0 to T0] 
% the signal is defined over [-T0, 2T0], which covers [0, T0] 
xt = heaviside(t+tau/2)-heaviside(t-tau/2) + heaviside(t-(T0-tau/2))- ...
heaviside(t-(T0+tau/2)); 
[a0, ai, bi, w] = TrigFourierSeries(xt, T0, k_max)

t = linspace(0,T0,1000);
signal = a0/2
for k=1:k_max
    signal = signal + ai(k)*cos(w(k)*t) + bi(k)*sin(w(k)*t)
end
plot(t,signal)
 
% plot the results from Matlab calculation 
%stem(w,abs(Xw), 'o-'); 
%hold on; 
 
% the results based on manual calculation (slides # 16) 
%Xw_manual = tau/T0*sinc(k_vec*tau/T0); 
%stem(w, abs(Xw_manual), 'r--'); 
 
%legend('Matlab calculation', 'Manual calculation'); 
%xlabel('\omega (rad/sec)'); 
%ylabel('|c_k|'); 
