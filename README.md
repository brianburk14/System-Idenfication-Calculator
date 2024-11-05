# System Idenfication Calculator (Time-Domain)
## Overview
The System Identification Calculator is a MATLAB-based tool that estimates the transfer function of an unknown dynamic system from time-domain data. By analyzing input data (control) and output data (system state), this program calculates a transfer function that represents the system dynamics, based on a specified order (number of poles and zeros).

The tool operates in the time domain and uses MATLAB’s System Identification Toolbox. To handle unevenly spaced time data, a custom interpolation function is included, ensuring that data is evenly spaced before identification. Along with the MATLAB program comes with an additional file that will be needed for this application, which contains the measured data. The data file will be the only input needed for this scenario. I recommend initially having the data in an excel file and copy and paste the data into the data file.

When running this program, please allow around five seconds for the plots to load due to its computational intensity. MATLAB should return the identified transfer function for the system, as well as a plot that contains a plot for the measured data and a plot for the identified transfer function. This should ensure an acceptable model for the system that you are trying to find.

## Requirements
MATLAB (tested on version R2023a)
