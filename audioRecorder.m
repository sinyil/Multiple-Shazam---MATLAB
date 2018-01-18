
recObj = audiorecorder(Fs, 16, 2);
recordblocking(recObj, 10);
recorded = getaudiodata(recObj);

recorded1 = recorded(:,1);
t = 0:dt:(length(recorded1)*dt)-dt;
t2 = transpose(t);
plot(t, recorded1);