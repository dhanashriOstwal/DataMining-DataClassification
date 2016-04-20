data = dlmread('C:\Users\Dhanashri\Documents\Sem II\Data Mining\ATNT50\trainDataXY.txt');
Xtest = dlmread('C:\Users\Dhanashri\Documents\Sem II\Data Mining\ATNT50\testDataX.txt');
Xtrain = data(2:end,1:end);
group = data(1,1:end);
x = data';
[uv,~,idx] = unique(x(:,1));
nu = numel(uv);
X = zeros(nu,size(x,1));
[a,~]=hist(idx,unique(idx));
start = 1;
final = a;
for rows = 1:nu
    for columns = start:final(rows)
        X(rows,columns)=1;
    end
    start = final(rows) + 1;
    final = final + a(rows);
end

Ytrain = X;

B = (pinv(Xtrain')) *  double(Ytrain')  ; % (XX')^{-1} X  * Y'
Ytrain1 = B' * Xtrain;
Ytest1 = B' * Xtest;

[Ytest2value,  Ytest2]= max(Ytest1,[],1);
[Ytrain2value,  Ytrain2]= max(Ytrain1,[],1);
output = Ytest2;
disp(output);