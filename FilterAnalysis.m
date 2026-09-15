
%Variables 
sampleRate = 1000;
timeVector = 0:1/sampleRate:(1-1/sampleRate);

rng(42, 'twister');
min_val = 10;
max_val = 490;

freqx = readmatrix('frequencies.csv');

mixedSignal = zeros(1, sampleRate);

for i = 1:length(freqx)
    mixedSignal = mixedSignal + sin(2*pi*freqx(i)*timeVector);
end

% Mixed Signal Time Graph
figure;
plot(timeVector, mixedSignal);
xlim([0 0.1]);
title('Mixed Signal Time Graph')
xlabel('Time (s)')
ylabel("Amplitude")

%% Frequency Spectrum

% FFT and Frequency Vector
mixedSignalFFT = fft(mixedSignal);
freq_vector = (0:length(mixedSignal)-1) * sampleRate/length(mixedSignal);

% Frequency Spectrum
figure;
plot(freq_vector, abs(mixedSignalFFT)/(length(mixedSignal)/2));
xlim([0 sampleRate/2]);
title('Frequency Spectrum');
xlabel('Frequency (Hz)');
ylabel('Magnitude');

%% Filter Design
sortedFreq = sort(freqx);
midFreq = (sortedFreq(4) + sortedFreq(5))/2;
[b, a] = butter(8, midFreq/500);
filteredSignal = filter(b, a, mixedSignal);

% FFT and Frequency Vector
filteredSignalFFT = fft(filteredSignal);
freq_vector_filtered = (0:length(filteredSignal)-1) * sampleRate/length(filteredSignal);

% Frequency Spectrum
figure;
plot(freq_vector_filtered, abs(filteredSignalFFT)/(length(filteredSignal)/2));
xlim([0 sampleRate/2]);
title('Frequency Spectrum of Filtered Signal');
xlabel('Frequency (Hz)');
ylabel('Magnitude');








