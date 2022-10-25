function [TempA, Tempb] = TempConstraint (I1, I2, s1)
    [h,w,~] = size(I2);
    N = h * w;
    u = estimate_flow_interface(I2, I1, 'classic+nl-fastp');
    u = round(u);
    Tempb = zeros(N, 1);
    a = ones(N,1);
    for i=1:w
        for j=1:h
            m = (i-1)*h + j;
            if j + u(j,i,2) <=h & j + u(j,i,2)>=1
                y = j + u(j,i,2);
            else
                y = j;
            end
            if i + u(j,i,1) <=w & i + u(j,i,1)>=1
                x = i + u(j,i,1);
            else
                x = i;
            end
%             if u(j,i,1) || u(j,i,2)
%                 Tempb(m,1) = s1(y,x) + I2(j,i) - I1(y,x);
%             end
            Tempb(m,1) = s1(y,x) + I2(j,i) - I1(y,x);
        end
    end
    TempA = sparse(1:N, 1:N, a, N, N);
 end
