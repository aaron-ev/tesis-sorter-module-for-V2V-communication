function [rxData nodos] = QRMDetector(y,H,equ,flag,conste,nstd,QRM,N)


[Q R P ] = mysortedqr(H,equ,nstd,flag);
yp = Q'*y;
R = cast(R,'like',yp);
[rxData nodos] = QRMSearch(yp,R,conste,nstd,QRM,P,N);

end