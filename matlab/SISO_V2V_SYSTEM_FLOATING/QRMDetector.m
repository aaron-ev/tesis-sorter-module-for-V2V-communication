function [rxData nodos] = QRMDetector(y,H,equ,flag,conste,nstd,QRM,N)

[Q R P] = mysortedqr(H,equ,nstd,flag);
yp = Q'*y;

 %[y, linearIndexesOfMaxes] = max(R(:));
  %          y
            %maxValueY = [maxValueY;y] 
[rxData nodos] = QRMSearch(yp,R,conste,nstd,QRM,P,N);
end