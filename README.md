Real-Time DSP Filter System - STM32F446RE, MATLAB, Python
This project implements a full DSP pipeline that applies a low-pass Butterworth filter to a randomly generated multi-frequency audio signal.
Signal generation and audio playback are done through Python; filter design and frequency analysis are done in MATLAB; and the filter is implemented in real-time on an STM32F446RE microcontroller using the ARM CMSIS-DSP library.

## Full Pipeline
1. Python generates five random frequencies and plays the mixed signal through the headphone jack
2. An Analog conditioning circuit biases the signal into the 0-3.3V range for the STM32's ADC
3. The STM32 samples the signal at 1000Hz via the ADC with DMA and applies an 8th-order Butterworth filter using the CMSIS-DSP library
4. MATLAB reads the frequency data, designs a matching filter, and performs an FFT analysis for validation

## Technologies Used
- MATLAB (Signal Processing Toolbox)
- Python (NumPy and SoundDevice)
- C (STM32 HAL, ARM CMSIS-DSP)
- STM32F446RE Nucleo Board
- STM32CubeMX
- STM32CubeIDE

## How To Run
1. Run generateSignal.py to generate random frequencies and play the signal through the headphone jack
2. Run FilterAnalysis.m in MATLAB to read the frequencies, design the filter, and perform the FFT analysis
3. Connect the headphone jack output through the biasing circuit and to the PA0 pin on the STM32
4. Flash the STM32 Firmware using STM32CubeIDE
5. The STM32 filters the signal in real-time
