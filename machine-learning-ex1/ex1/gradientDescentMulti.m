function [theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters)
%GRADIENTDESCENTMULTI Performs gradient descent to learn theta
%   theta = GRADIENTDESCENTMULTI(x, y, theta, alpha, num_iters) updates theta by
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y);% number of training examples
J_history = zeros(num_iters, 1);
[col raw] = size(X);
for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCostMulti) and gradient here.
    %
    h = X*theta;
    sum = zeros(raw,1);
for z = 1:raw 

    for i = 1 : m 

        sum(z,1) = sum(z,1) + ( h(i,1) - y(i,1))*(X(i,z));

    end
  
        temp(z,1) = theta(z,1) - (alpha / m )* sum(z,1);
      
end
for v = 1:raw 
        theta(v,1) = temp(v,1);
end

    % ============================================================

    % Save the cost J in every iteration    
    J_history(iter) = computeCostMulti(X, y, theta);



end
