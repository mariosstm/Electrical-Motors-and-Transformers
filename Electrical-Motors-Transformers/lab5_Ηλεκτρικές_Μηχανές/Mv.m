%time
t = 0:0.01:45;
%moment
M = [0];
for i=0:2.5:20
    Mol = i*ones(500,1);
    M = [M; Mol];
end
plot(t, M)