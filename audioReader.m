[signal, Fs] = audioread('Beethoven - Moonlight Sonata');

signal1 = signal(:,1);
length1 = length(signal1);
dt = 1/Fs;
t = 0:dt:(length(signal1)*dt)-dt;
plot(t, signal1);