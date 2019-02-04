function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples
[z n] = size(X);
% You need to return the following variables correctly 
J = 0;

h = sigmoid(X*theta);
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

for i = 1 : m 
J = J + (1/m)*(-y(i)*log(h(i)) - (1-y(i))*log(1-h(i)));
grad(1,1) = grad(1,1) + (1/m)*(h(i)-y(i)) ;
end 
J = J + (lambda/(2*m)) * sum(theta(2:end).^2) ;

for j = 2 : n 
    for i = 1 : m 
        grad(j,1) = grad(j,1) + (1/m)*(h(i)-y(i))*X(i,j);
    end 
    grad(j,1) = grad(j,1) + (lambda/m)*theta(j);
end 

% =============================================================

end
