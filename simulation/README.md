{\rtf1\ansi\ansicpg1252\cocoartf2870
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\froman\fcharset0 Times-Bold;\f1\froman\fcharset0 Times-Roman;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\deftab720
\pard\pardeftab720\partightenfactor0

\f0\b\fs24 \cf0 \expnd0\expndtw0\kerning0
Single-Axis Attitude Simulation\
\pard\pardeftab720\partightenfactor0

\f1\b0 \cf0 \
A simplified rotational model used to develop and understand the baseline PID attitude controller before extending the model to a full quadcopter.\
\
Used reference angle as 30\'b0, current angle as 10\'b0, found the error between them \'97> PID\
PID gives the torque, and by using I*alpha = Torque, we find Alpha = Torque/I\
\
Subsequently, we used Euler Integration and found Omega and corresponding Theta.\
\
Introduced disturbance test to check system stability by increasing Omega abruptly by 0.5.\
\
\pard\pardeftab720\partightenfactor0

\f0\b \cf0 ## Tests Performed\
\
### Setpoint Tracking
\f1\b0 \
\
The system was initialized at 10\'b0 with a reference angle of 30\'b0. The controller successfully reached and stabilized around the reference.\
\

\f0\b ### Disturbance Rejection
\f1\b0 \
\
A disturbance torque of 0.5 N\'b7m was applied from 10.0 s to 10.5 s. The controller rejected the disturbance and returned the system to the reference angle.\
\

\f0\b ## Baseline Performance
\f1\b0 \
\
For the initial tracking response:\
\
| Metric | Result |\
| Maximum overshoot  \'97\'97 0.512\'b0 \
| Percentage overshoot \'97 \'97  2.56% \
| Settling time (2% criterion) \'97 \'97  7.722 s \
| Pre-disturbance steady-state error \'97 \'97 -0.277\'b0 \
| Peak control torque \'97 \'97  0.262 N\'b7m \
\
These results serve as the initial PID baseline for future controller and plant-model comparisons.\
\
## Current Limitations\
\
The current model uses simplified and arbitrary physical parameters and represents only one rotational axis. Future versions will introduce physically meaningful vehicle parameters and more realistic dynamics.}