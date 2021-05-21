%% The L2,1 proximal operator
function V_new = prox_l21(V,c)

    alpha = max(0,1 - c./sqrt(sum(V.^2,2)));
    V_new = diag(alpha)*V;
    

end