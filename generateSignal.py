import sounddevice as sd
import numpy as np

sampleRate = 1000
timeVector = np.arange(0, 1, 1/sampleRate)
freqx = np.random.randint(10, 490, 5)
np.savetxt('frequencies.csv', freqx, delimiter=',', fmt='%d')
mixedSignal = np.zeros(sampleRate)

for freq in freqx:
    mixedSignal += np.sin(2*np.pi*freq*timeVector)

while True:
    sd.play(mixedSignal, sampleRate)
    sd.wait()