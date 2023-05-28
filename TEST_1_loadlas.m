
% The commands you can see here provides a way to "reset" MATLAB, so that
% you can have a fresh start.

clear all,  % this clears your workspace.
close all,  % this closes all figures.
clc,        % this clears the command window.

%%  Loading the .las file.

[datastr,data,colnames,header]=loadingLasFile('ABC.las');
col_1 = data(10846:17407, 1);   % Depth in feet         
col_2 = data(10846:17407, 2);   % Caliper log (.in)         
col_3 = data(10846:17407, 3);           
col_4 = data(10846:17407, 4);            
col_5 = data(10846:17407, 5);           
col_6 = data(10846:17407, 6);           
col_7 = data(10846:17407, 7);           
col_8 = data(10846:17407, 8);          
col_9 = data(10846:17407, 9);           
col_10 = data(10846:17407, 10);         
col_11 = data(10846:17407, 11);         
col_12 = data(10846:17407, 12);         
col_13 = data(10846:17407, 13);         
col_14 = data(10846:17407, 14);        
col_15 = data(10846:17407, 15);         

%%  Mnemonics for data

Depth=col_1 ;           
CALD=col_2;           
CALS=col_3;          
DEPTH=col_4;           
DRHO=col_5;         
DT=col_6;           
GRD=col_7;           
GRS=col_8;           
ILD=col_9;           
ILM=col_10;           
LL8=col_11;         
NPHILS=col_12;         
NPHISS=col_13;          
RHOB=col_14;          
SP=col_15; 

%%  Few important factors for properties conversion

div_mill = 1/1000000;           % factor used to divide by million
feetpms2feetps = 1000000;       % foot per microsecond = 1 000 000 feet per second
fs2kms =   0.000305;            % factor for ft/s to km/s conversion
kms2fs =   3280.84;             % factor for km/s to ft/s conversion % Check your conversion from meter to feet
fs2ms=     0.305;               % factor for ft to meters conversion   
ms2fs=     3.28083;             % factor for m/s to ft/s  conversion
ms2kms = 0.001; 	            % meter per second to kilometers per second conversion
fttom = 1/3.28;                 % Feet to meter conversion

%%

DEPTH_m = Depth*fttom;     % Depth in meters

VP = 1./DT*feetpms2feetps*fs2kms;   % P wave velocity in km/sec
VS = (VP-1.36)/1.16;  % S wave velocity in km/sec (by using Castagna's Eq)
       

%%
% Displaying Well log curves

figure (1),

subplot(1,6,1);
stairs(CALD,DEPTH_m,'r','linewidth', 1.0)
xlabel('CALD (in)')
ylabel('Depth (m)')
set(gca, 'ydir', 'reverse');
ylim([2300 2800])
yticks([2300:100:2800])

subplot(1,6,2);
stairs(SP,DEPTH_m,'b')
xlabel('SP (mV)')
yticks([])
set(gca, 'ydir', 'reverse');
ylim([2300 2800])

subplot(1,6,3);
stairs(GRD,DEPTH_m,'k')
xlabel('GRD (API)')
yticks([])
set(gca, 'ydir', 'reverse');
ylim([2300 2800])

subplot(1,6,4);
stairs(RHOB,DEPTH_m,'g')
xlabel('RHOB (gm/cc)')
yticks([])
set(gca, 'ydir', 'reverse');
ylim([2300 2800])

subplot(1,6,5);
stairs(NPHISS,DEPTH_m,'m')
xlabel('NPHI (.fac)')
yticks([])
set(gca, 'ydir', 'reverse');
ylim([2300 2800])
%
subplot(1,6,6);
stairs(DT,DEPTH_m,'c')
xlabel('DT (ms/ft)')
yticks([])
set(gca, 'ydir', 'reverse');
ylim([2300 2800])

figure (2),

subplot(1,2,1);
stairs(VP,DEPTH_m,'r','linewidth', 1.0)
xlabel('VP (km/sec)')
ylabel('Depth (m)')
set(gca, 'ydir', 'reverse');
ylim([2300 2800])
yticks([2300:100:2800])

subplot(1,2,2);
stairs(VS,DEPTH_m,'b')
xlabel('VS (km/sec)')
yticks([])
set(gca, 'ydir', 'reverse');
ylim([2300 2800])

