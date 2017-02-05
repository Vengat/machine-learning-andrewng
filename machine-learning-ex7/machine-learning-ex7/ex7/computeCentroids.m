function centroids = computeCentroids(X, idx, K)
%COMPUTECENTROIDS returns the new centroids by computing the means of the 
%data points assigned to each centroid.
%   centroids = COMPUTECENTROIDS(X, idx, K) returns the new centroids by 
%   computing the means of the data points assigned to each centroid. It is
%   given a dataset X where each row is a single data point, a vector
%   idx of centroid assignments (i.e. each entry in range [1..K]) for each
%   example, and K, the number of centroids. You should return a matrix
%   centroids, where each row of centroids is the mean of the data points
%   assigned to it.
%

% Useful variables
[m n] = size(X);

% You need to return the following variables correctly.
centroids = zeros(K, n);


% ====================== YOUR CODE HERE ======================
% Instructions: Go over every centroid and compute mean of all points that
%               belong to it. Concretely, the row vector centroids(i, :)
%               should contain the mean of the data points assigned to
%               centroid i.
%
% Note: You can use a for-loop over the centroids to compute this.
%
disp("X***************")
disp(X);
disp("X***************")
number_of_centroids = size(centroids, 1)
for i=1:K
	new_centroid = zeros(1, n);
	prev_X_sum = zeros(1, n);
	%centroids_count is a bad name. Instead it should be total number of points for a given centroid
	centroids_count = 0;
	for j=1:size(idx, 1)
		if(idx(j) == i)
			prev_X_sum = prev_X_sum + X(j, :)
			centroids_count = centroids_count + 1
		end
	end
	new_centroid = prev_X_sum/centroids_count
	disp(centroids);
	disp(new_centroid);
	centroids(i, :) = new_centroid
end







% =============================================================


end

