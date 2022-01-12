y = [40 35 30 25 20 18 16 14 12 10 9 8 6.5 6 5.5 4 3.5];
x = [0.3 0.35 0.45 0.55 0.65 0.75 0.8 0.9 1.05 1.3 1.4 1.55 1.75 2 2.3 2.7 3];

x_extra= [3.05 0];
y_extra = [3 0];

a = flip(x);
b = flip(y);

ax = a;
ax_extra = x_extra;
ay = b./1000;
disp(length(a));
disp(length(b));
% disp(a);
% disp(b);

format long
p = polyfit(a, b, 6)
p_extra = polyfit(x_extra, y_extra, 1)
%pp = polyfit(x, y, 4);
% disp(p);
% disp(p);

hold on
plot(ax, polyval(p, ax))
scatter(ax, b)
plot(x_extra, polyval(p_extra, x_extra));
scatter(ax_extra, y_extra);
grid on