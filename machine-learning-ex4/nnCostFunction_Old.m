X = [ones(m, 1) X];

z2 = X * Theta1'

a2 = sigmoid(z2)

a2 = [ones(size(a2, 1), 1) a2]

z3 = a2 * Theta2'

a3 = sigmoid(z3)

h = a3;



%Recode the labels as vectors
I = eye(num_labels);
Y = zeros(m, num_labels);
for i=1:m
	Y(i, :) = I(y(i), :);
end



%j = 0;
%for i=1:m
%	for k=1:num_labels
%		j = j + (-(Y(i, k))* log(h(i, k)) - (1 - Y(i, k))* log(1-h(i, k)));
%	end
%end
%j = j/m;

p = sum(sum(Theta1(:, 2:end).^2, 2))+sum(sum(Theta2(:, 2:end).^2, 2));


J =  sum(sum((-Y).*log(h) - (1-Y).*log(1-h), 2))/m + lambda*p/(2*m);


for t=1:m

	% dummie pass-by-pass
	% forward propag

	a1 = X(t,:); % X already have bias
	z2 = Theta1 * a1';

	a2 = sigmoid(z2);
	a2 = [1 ; a2]; % add bias

	z3 = Theta2 * a2;

	a3 = sigmoid(z3); % final activation layer a3 == h(theta)

	
	% back propag (god bless me)	
	
	z2=[1; z2]; % bias


	delta_3 = a3 - Y(t,:); 

disp("i am here");
	delta_2 = (Theta2 * delta_3) .* sigmoidGradient(z2);

	% skipping sigma2(0) 
	delta_2 = delta_2(2:end); 

	Theta2_grad = Theta2_grad + delta_3 * a2';
	Theta1_grad = Theta1_grad + delta_2 * a1;	
	
end




Theta1_grad(:,1) = Theta1_grad(:,1)./m;
Theta2_grad(:,1) = Theta2_grad(:,1)./m;


Theta1_grad(:,2:end) = Theta1_grad(:,2:end)./m + ( (lambda/m) * Theta1(:,2:end) );
Theta2_grad(:,2:end) = Theta2_grad(:,2:end)./m + ( (lambda/m) * Theta2(:,2:end) );


