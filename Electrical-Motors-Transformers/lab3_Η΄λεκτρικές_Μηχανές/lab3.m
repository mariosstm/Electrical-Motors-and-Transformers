%time
t = 0:0.01:15;
%voltage
M = [0];
for i = 0:3:24
    Mol = i*ones(150,1);
    M = [M; Mol];
end
M = [M; 26.71*ones(150,1)];
plot(t, M)