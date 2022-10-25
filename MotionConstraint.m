function [MotA,Motb] = MotionConstraint (mask)
    [h,w] = size(mask);
    N = h * w;
    ind_id = find(mask==1);
    Motb = zeros(N,1);
    Motb(ind_id(:)) = 1;
    MotA = sparse(1:N, 1:N, Motb, N, N);
 end
