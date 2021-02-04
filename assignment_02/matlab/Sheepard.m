
R = [[0 1 0];
    [1 0 0];
    [0 0 -1]];
[theta,k] = getAngleAxis(R)
function[theta,k]=getAngleAxis(R)
    r11=R(1,1);
    r22=R(2,2);
    r33=R(3,3);
    r00=r11+r22+r33;
    [rii,i]=max([r00, r11, r22, r33]); 
    i = i-1;
    if i==0
        z0=sqrt(1+2*rii-r00);
        z(1)=(R(3,2) - R(2,3))/z0;
        z(2)=(R(1,3) - R(3,1))/z0;
        z(3)=(R(2,1) - R(1,2))/z0;
    elseif i==1
        z(1)=sqrt(1+2*rii-r00);
        z0=(R(3,2) - R(2,3))/z(1);
        z(2)=(R(2,1) + R(1,2))/z(1);
        z(3)=(R(1,3) + R(3,1))/z(1);
    elseif i==2
        z(2)=sqrt(1+2*rii-r00);
        z0=(R(1,3) - R(3,1))/z(2);
        z(1)=(R(2,1) + R(1,2))/z(2);
        z(3)=(R(3,2) + R(2,3))/z(2);
    elseif i==3
        z(3)=sqrt(1+2*rii-r00);
        z0=(R(2,1) - R(1,2))/z(3);
        z(1)=(R(1,3) + R(3,1))/z(3);
        z(2)=(R(3,2) + R(2,3))/z(3);
    end
    %Eulerparameters
    eta=z0/2;
    epsilon=[z(1);z(2);z(3)]/2;
    %Angleaxis
    theta=2*acos(eta);
    k=epsilon/(sin(theta/2));
end