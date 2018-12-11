%% Clc, clear, close all
clc
clear
close all


%% Connect to the arduino 

Port = '/dev/cu.usbserial-DN02SM2R';     % Port the Arduino is connected to
delete(instrfindall);                    % deletes any connected ports
board = serial(Port);                    % connect to the Arduino in order to read information 
fopen(board);                            % opens the serial port
pause(1);                                % pause() for 1 second to make sure a connection is made
out = instrfind('Port',Port);            % see if the port you specified is open
disp('Serial Port is Open')
in = input('Enter the time(in minutes)for which data will record: ');


%% Plot received data

figure,
h = animatedline;
title('PIR sensor condition');
xlabel('time (minutes)');
ylabel('Voltage');

ax = gca;
ax.YGrid = 'on';                         % get current axis
x = linspace(1,100,100);                 % Line spacing 
st = datetime('now');                    % Array that represents points in time 
fin = datenum(clock + [0 0 0 0 in 0]);   % Convert data and time 

 while datenum(clock) <= fin
     i = 1:length(x);
     val = fscanf(board, '%f');          % Data from arduino 
     in = datetime('now') - st;          % Get current time 
     addpoints(h,datenum(in),val);
     axi.XLim = datenum([in - seconds(15) in]);
     datetick('x','keeplimits');
     drawnow update;
 end
 
 
 %% Close connection 
 
 
 fclose(board);
 delete(board);
 clear board;
 disp('Serial port is closed');
 
 
 

