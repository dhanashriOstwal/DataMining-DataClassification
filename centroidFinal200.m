data = dlmread('C:\Users\Dhanashri\Documents\Sem II\Data Mining\ATNT200\trainDataXY.txt');
test = dlmread('C:\Users\Dhanashri\Documents\Sem II\Data Mining\ATNT200\testDataX.txt');
test = test';
group = data(1,1:end);
x = data';
[uv,~,idx] = unique(x(:,1));
nu = numel(uv);
x_sum = zeros(nu,size(x,2));
for ii = 1:nu
  x_sum(ii,:) = (x(idx==ii,:));
end
x_sum = x_sum(1:end,2:end);
x_div = x_sum/9;
dist = pdist2(test,x_div);
[~, class] = min(dist,[],2);
output = uv(class);
output = output';   
disp(output);