clc
clear all

format rat

x=2^52;     % x = 4503599627370496
x=x+1      % x+1 = 4503599627370497
y=x;
y=y+0.5     % x+0.5 = 4503599627370497.5
            % viene arrotondato a ...98

