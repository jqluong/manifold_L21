%% The L2,1 proximal operator
function V_new = prox_l21(V,c)
    g = size(V,2);
    for i = 1:size(V,2)
        Z_hold = V(:,i);
        Z_hold = reshape(Z_hold,numel(Z_hold)/2,2);
        g(i) = sum(sqrt(sum(Z_hold.^2,2)));
    end

<<<<<<< HEAD
    alpha = max(0,1 - c./g);
    V_new = V*diag(alpha);
=======
    alpha = max(0,1 - c./sqrt(sum(V.^2,1)));
    V_new = V*diag(alpha);
    

>>>>>>> parent of c83211e (trying to implement l21)
end