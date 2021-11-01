function N = tumor_growth(t, N0, Ninf, hbar, tbar, r, k)
% tumor_growth: computes number of cancer cells at discrete times
% N = tumor_growth(t, N0, Ninf, hbar, tbar, r, k)
% input: 
%   t = times (days) (vector)
%   N0 = initial number of cancer cells (scalar)
%   Ninf = Carrying capacity or maximum number of cancer cells (scalar)
%   hbar = drug amount (g) (scalar)
%   tbar = time after which drug is removed (days) (scalar)
%   r = tumor growth rate (1/days) (scalar)
%   k = kill rate (1/g/days) (scalar)
% output:
%   N = number of cancer cells (vector)

n = length(t);
dt = t(2) - t(1);
N = [N0];
for i=2:n
    ht = 0;
    if t(i) < tbar
        ht = hbar;
    else
        ht = 0.1 * hbar;
    end
    
    N(i) = N(i-1) + dt * (r * N(i-1) * log(Ninf / N(i-1)) - k * ht * N(i-1));
end
