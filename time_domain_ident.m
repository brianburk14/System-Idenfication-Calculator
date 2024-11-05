clc; clear; close all;

%Load up the data from the time_domain_data file which was exported from
%the excel file
time_domain_data;
u = time_domain_data1(:, 1);
t = time_domain_data1(:, 2);
y = time_domain_data1(:, 3);

%To execute the system identification process, we need the time steps to be
%evenly spaced, so we'll have to perform interpolation for u, t and y
dt = t(end)/(3*length(t));
t_interp = t(1):dt:t(end);
y_interp = y(1);
[y_interp] = dataInterpolator(dt, t, y, y_interp);
t_interp = t_interp';
y_interp = y_interp';
u_interp = u(1);
[u_interp] = dataInterpolator(dt, t, u, u_interp);
u_interp = u_interp';

%Now we can perform system identification
%data will represent the data that will be plotted, and id will be the
%object that we are using for system identification (this is the transfer 
% function that we are trying to find)
data = iddata(y_interp, u_interp, dt);
zeros = 0;
poles = 2;
id = tfest(data, poles, zeros)

%We're going to compare both the data and the identified transfer function
%to see how well the model was estimated
figure(1);
compare(data, id);
legend("Data", "Sys ID");
grid on;

%This is the function that will help us interpolate the data for each of
%the variables that will be plotted with time
function [y_interp] = dataInterpolator(dt, t, y, y_interp)
    t_find = t(1)+dt;
    j = 2;
    for i = 1:length(y)
        var = 0;
        while(var == 0)
            if(t(i) == t_find)
                y_interp(j) = y(i);
                t_find = t_find + dt;
                j = j + 1;
                var = 1;
            elseif(t(i) > t_find)
                t_up = t(i);
                t_low = t(i-1);
                y_up = y(i);
                y_low = y(i-1);
                y_interp(j) = y_low + (t_find - t_low)*(y_up - y_low)/(t_up - t_low);
                t_find = t_find + dt;
                if(t(i) < t_find)
                    var = 1;
                end
                j = j + 1;
            else
                break;
            end
        end
    end
end