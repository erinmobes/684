function t = hpfil(y,mu)

[T,q] = size(y);
U = zeros(T,T);
U(1,1) = 1 + mu;
U(1,2) = -2*mu;
U(1,3) = mu;
U(2,1) = -2*mu;
U(2,2) = 1 + 5*mu;
U(2,3) = -4*mu;
U(2,4) = mu;

for i = 3:T-2;
    U(i,i-2) = mu;
    U(i,i-1) = -4*mu;
    U(i,i) = 1 + 6*mu;
    U(i,i+1) = -4*mu;
    U(i,i+2) = mu;
end

U(T-1,T-3) = mu;
U(T-1,T-2) = -4*mu;
U(T-1,T-1) = 1 + 5*mu;
U(T-1,T) = -2*mu;
U(T,T-2) = mu;
U(T,T-1) = -2*mu;
U(T,T) = 1 + mu;

t = inv(U)*y; % This is the trend
