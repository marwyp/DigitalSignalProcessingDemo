# DigitalSignalProcessingDemo
This is demonstration of various digital signal processing functions and programs using Matlab.

### Covered topics
1. Transforms
   - *discreteFourierTransform()* - computes discrete Fourier transform X of given signal x
      - dft - using analysis matrix
      - rec - using recursive raddix-2 algorithm
      - fft - using raddix-2 algorithm
   - *inverseDiscreteFourierTransform()* - computes inverse discrete Fourier transform x of given spectrum X
   - *discreteCosineTransform()* - computes discrete cosine transform X of given signal x using analysis matrix
   - *inverseDiscreteCosineTransform()* - computes inverse discrete cosine transform x of given spectrum X
   - *discreteCosineTransform2D()* - computes 2D discrete cosine transform X of given matrix x
   - *inverseDiscreteCosineTransform2D()* - computes inverse 2D discrete cosine transform x of given matrix X
   - *example1* - Different ways of calculating Fourier transform compared to Matlab fft function
   - *example2* - Calculating cosine transform compared to Matlab dct function
   - *example3* - Inverse transformations and analysis matrix orthonormality
   - *example4* - Calculating dft of 2 N-point real signals using 1 N-point dft
   - *example5* - Calculating (inverse) 2D cosine transform compared to Matlab dct2 function
2. Analog filters
   - *analogFrequencyResponse()* - frequency response of analog filters
   - *zeroPole2TransferFunction()* - convert zero-pole-gain filter parameters to transfer function form
   - *analogButterworthZerosPolesLP()* - designs a lowpass analog Nth order Butterworth filter with cutoff frequency w3dB in rad/s and returns its zeros and poles
   - *example1* - designing a band-pass filter with pole-zero matching method
   - *example2* - Butterworth lowpass analog filter characteristic
3. Digital IIR filters - TODO
4. Digital FIR filters - TODO
5. Modulations
   - *hilbertResponse()* - impulse response of Hilbert Filter
   - *hilbertFilter()* - filters given signal x using Hilbert Filter impulse response
   - *modulatorAM()* - modulates given signal x using given carrier frequency fc of amplitude Ac and sampling frequency fs
   - *demodulatorAM()* - demodulates given signal y
   - *example1* - Hilbert filter compared to Matlab hilbert function
   - *example2* - Amplitude modulation and demodulation
6. Audio coding - TODO
7. Image processing
   - *triangleMaskLP()* - designs triangle lowpass mask for image filtering
   - *example1* - frequency domain image filtering
