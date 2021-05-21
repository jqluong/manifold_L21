%% The L2,1 proximal operator
function V_new = prox_l21(V,c)
    g = size(V,2);
    for i = 1:size(V,2)
        Z_hold = V(:,i);
        Z_hold = reshape(Z_hold,numel(Z_hold)/2,2);
        g(i) = sum(sqrt(sum(Z_hold.^2,2)));
    end

    alpha = max(0,1 - c./g);
    V_new = V*diag(alpha);
end