clear
clc
close all


load spectra
X = NIR;
y = octane;



% Reduce the mean 
x_mean = mean(X);
X = X - x_mean;
y_mean = mean(y);
y = y - y_mean;
%% LS
B  = (X'*X)\X'*y;
y_pre_ls = X* B;
%plot(y_pre_ls)
%hold on
%plot(y,'X')

%% PLS





[XL,yl,XS,YS,beta,PCTVAR] = plsregress(X,y,10);


figure
plot(1:10,cumsum(100*PCTVAR(2,:)),'-bo');
xlabel('Number of PLS components');
ylabel('Percent Variance Explained in y');

figure
yfit = [ones(size(X,1),1) X]*beta;
residuals = y - yfit;
stem(residuals)
xlabel('Observation');
ylabel('Residual');

figure
plot(y)
hold on
plot(yfit)
