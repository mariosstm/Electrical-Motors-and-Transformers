%time
t = 0:0.01:30;
%voltage
V = [0];
for i = 0:20:200
    Vol = i*ones(250,1);
    V = [V; Vol];
end
V = [V; 210*ones(250,1)];
plot(t, V)