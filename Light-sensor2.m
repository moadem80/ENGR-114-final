%% Open serial port

Port = '/dev/cu.usbserial-DN02SM2R';    % Port the Arduino is connected to
delete(instrfindall);                   % deletes any connected ports
a = serial(Port);                       % connect to the Arduino in order to read information 
fopen(a);                               % opens the serial port
pause(1);                               % pause() for 1 second to make sure a connection is made
out = instrfind('Port',Port);           % see if the port you specified is open
disp('Serial Port is Open')

% Ask how long they want to record data for 
t = input('How long do you want to record data: ');
%% Plot how often 

figure
h = animatedline;
title('Motion Sensor');
xlabel('Time');
ylabel('If motion is detected');
ax = gca;
ax.YGrid = 'on';                         % get current axis
x = linspace(1,100,100);                 % Line spacing 
start = datetime('now');                 % Array that represents points in time 
finish = datenum(clock + [0 0 0 0 t 0]); % Convert data and time 


%%

while datenum(clock) <= finish
i=1:length(x);
A_data = fscanf(a, '%f'); % Data from the arduino code
 % Get current time
   t =  datetime('now') - startTime;
addpoints(h,datenum(t),data);
 % Update axes
   ax.XLim = datenum([t-seconds(15) t]);

   datetick('x','keeplimits')
   drawnow update
end



%% Close the serial port
fclose ( a ) ;
delete ( a ) ;
clear a ;
disp (' Serial Port is closed ')


