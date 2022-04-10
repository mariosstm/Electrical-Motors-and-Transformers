%time
t = 0:0.01:45;
%res
Ri = [15 10 5 0.1];
R = [15];
for i=0:1:8
    R1 = Ri(1)*ones(100, 1);
    R2 = Ri(2)*ones(100, 1);
    R3 = Ri(3)*ones(100, 1);
    R4 = Ri(4)*ones(200, 1);
    Rmet = [R1; R2; R3; R4];
    R = [R; Rmet];
end
plot(t, R)