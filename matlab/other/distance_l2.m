function Dl2 = distance_l2(yn,l)
    % global variables
    global M, global R,global x; 
    for i = 1:M
        Dl2(i) = norm(y - R(l,l).*x(:,i))^2;
    end
end