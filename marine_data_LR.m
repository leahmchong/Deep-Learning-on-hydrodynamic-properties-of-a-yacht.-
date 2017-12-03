FileName   = 'marine_data.txt'
FolderName = '/home/suyash';
File       = fullfile(FolderName, FileName);
load(File);   

x1=marine_data(1:250,1);
x2=marine_data(1:250,2);
x3=marine_data(1:250,3);
x4=marine_data(1:250,4);
x5=marine_data(1:250,5);
x6=marine_data(1:250,6);
dataA=marine_data;


p = 0.5;     % proportion of rows to select for training

N = size(dataA,1)  % total number of rows 
tf = false(N,1)    % create logical index vector
tf(1:round(p*N)) = true     
tf = tf(randperm(N))   % randomise order
dataTraining = dataA(tf,:) 
dataTesting = dataA(~tf,:) 



X=dataTraining(:,1:6);
y=dataTraining(:,7);
X_test=dataTesting(:,1:6);
Y_test=dataTesting(:,7);
mdl = fitlm(X,y)
A=table2array(mdl.Coefficients);
B=A(1:7,1);
Y=dataTesting(:,7);
[m,n]=size(dataTesting);
bias=ones(m);
bias=bias*A(1);
X_pred=bias+X_test*B(2:7);
mse_test=immse(X_pred(:,1),Y_test);
scatter3(X(:,1),X(:,2),y)
zlabel('Y');

sqrt(mse_test)




