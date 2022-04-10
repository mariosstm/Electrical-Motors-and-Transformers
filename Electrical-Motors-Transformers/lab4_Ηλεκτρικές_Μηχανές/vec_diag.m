%vec diag 77
USN = 230.94;
US_anigm = 1;
ISN = 11.69;
IS_anigm = 0.7;
fn = 30.68341711*(pi/180); % in rad
Rs = (ISN/USN)*1.62;
Xsc = 1.422199;
Xhd = 34.117696;
Xhq = 16.257742;
Xd = Xhd + Xsc;
Xq = Xhq + Xsc;
xsc = (ISN/USN)*Xsc 
xd = (ISN/USN)*Xd; %USN is phase
xq = (ISN/USN)*Xq;

cla
%US'
US_V = US_anigm;
quiver(0, 0, 0, US_V, 'off');
hold on
%IS'
IS_U = IS_anigm*sin(fn);
IS_V = -IS_anigm*cos(fn);
quiver(0, 0, IS_U, IS_V, 'off')
%-IS
qIS = quiver(0,0, -IS_U, -IS_V, 'off', '--k')
qIS.ShowArrowHead = 'off';
%RSIS
RS_U = Rs*IS_U;
RS_V = Rs*IS_V;
quiver(-RS_U, -RS_V + US_V, RS_U , RS_V, 'off')
%j*xqIS
XQS_X = -RS_U;
XQS_Y = US_V-RS_V;
XQS_U = xq*IS_anigm*(cos(fn));
XQS_V = xq*IS_anigm*(sin(fn));
quiver(XQS_X - XQS_U, XQS_Y - XQS_V, XQS_U, XQS_V, 'off')
%jxscIS
XSC_U = xsc*IS_anigm*(cos(fn));
XSC_V = xsc*IS_anigm*(sin(fn));
quiver(XQS_X - XSC_U, XQS_Y - XSC_V, XSC_U, XSC_V, 'off')
%Uep
Uep_X = XQS_X - XSC_U;
Uep_Y = XQS_Y - XSC_V;
quiver(0, 0, Uep_X, Uep_Y, 'off')
%theta
A_X = XQS_X - XQS_U;
A_Y = XQS_Y - XQS_V;
thetan = atan(-A_X/A_Y); %37.9002 deg
%quiver(0, 0, A_X, A_Y, 'off')
psin = (thetan-fn); %7.2167 deg
IQ = IS_anigm*cos(psin);
ID = IS_anigm*sin(psin);
%IQ
IQ_U = IQ*cos(pi/2 - thetan);
IQ_V = -IQ*sin(pi/2 - thetan); 
quiver(0, 0, IQ_U, IQ_V, 'off')
%ID
ID_U = -ID*cos(thetan);
ID_V = -ID*sin(thetan);
qID = quiver(0, 0, ID_U, ID_V, 'off')
set(qID,'MaxHeadSize',5)
% %jXDID
XD_U = xd*ID*sin(thetan);
XD_V = -xd*ID*cos(thetan);
quiver(-XD_U + XQS_X, -XD_V + XQS_Y, XD_U, XD_V, 'off')
% %jXQIQ
XQ_X = -XD_U + XQS_X;
XQ_Y = -XD_V + XQS_Y;
XQ_U = xq*IQ*cos(thetan);
XQ_V = xq*IQ*sin(thetan);
quiver(XQ_X - XQ_U, XQ_Y - XQ_V, XQ_U, XQ_V, 'off')
%E
E_X = XQ_X - XQ_U;
E_Y = XQ_Y - XQ_V;
quiver(0, 0, E_X, E_Y, 'off')
% ( Uep_X^2 + Uep_Y^2 )^(1/2) = 1.0262
% ( E_X^2 + E_Y^2 )^(1/2) = 1.0042
title('Διανυσματικό Διάγραμμα Γεννήτριας με επαγωγικό ΣΙ')
axis equal
legend('US', 'IS', '-IS', 'RS*IS', 'jXq*IS', 'j*Xsc*IS','Uep', 'IQ', 'ID', 'jXdID', 'jXqIQ', 'Ep')