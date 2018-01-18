function [recordMap] = MapRecord(recorded1)
    L = 44100;
    Fs = 44100;
    fSignal1 = zeros(300,L/30);
    recordMap = zeros(300,5);

    for i = 1:300
        fSignal1(i,:) = fft(recorded1(1470*(i-1)+1:1470*i));

        P2 = abs(fSignal1(i,:)/L);
        P1 = P2(1:L/60+1);
        P1(2:end-1) = 2*P1(2:end-1);

        [value, index] = max(P1(1:39));
        recordMap(i,1) = index;
        [value, index] = max(P1(40:79));
        recordMap(i,2) = index + 40;
        [value, index] = max(P1(80:119));
        recordMap(i,3) = index + 80;
        [value, index] = max(P1(120:179));
        recordMap(i,4) = index + 120;
        [value, index] = max(P1(180:299));
        recordMap(i,5) = index + 180;
    end
end

