function R=coordinate(d,x1,y1, x2,y2)
%Computes the coordinate as a result from a defined distance between 2
%points

%J Joints
%R result
%d distance from joint
%i1,i2,i3 index from joints i1,i2 and result i3



dx = x2-x1;
dy = y2-y1;
ang = atan(dy/dx);
if( (dx<0 && dy>=0) || (dx<0 && dy<0))
    ang = ang+pi;
end   

if(ang<0)
    ang = ang+2*pi;
end

if(ang>2*pi)
    ang = ang-2*pi;
end

x3 = d*cos(ang);
y3 = d*sin(ang);

R = [x3 y3];

end

