% running ICA
numOfComps=100;
%% prepare a matrix for ICA: 
% achieve order: els,time,ims,bls
out=permute(output_same_uw_03,[1 4 2 3]);

% average two consecutive samples.
% temp1=out(:,1:2:end,:,:);
% temp2=out(:,2:2:end,:,:);
% out=mean(cat(5,temp1,temp2),5);

% take out pre time (37 sec post stimulus)
out=out(:,35:end,:,:);

%reshape to make a rectangular matrix
out=reshape(out,size(out,1)*size(out,2),size(out,3)*size(out,4));


%%run PCA
[coeff,score,latent,tsquared,explained] = pca(out);
figure()
pareto(explained)
xlabel('Principal Component')
ylabel('Variance Explained (%)')
sout=score(:,1:numOfComps);
sumExp=sum(explained(1:numOfComps,1));
output=reshape(out,1,size(output_same_uw_03,2),size(output_same_uw_03,3),numOfComps);
output=permute(output,[2 3 4 1]);
%% run ICA

out=single(sout);
% ind=1:2:32768;
% out=out(ind,:);
% comp=fastica(out,'numOfIC',numOfComps);
comp=fastica(out);
output=reshape(comp,1,numOfComps,size(output_same_uw,2),size(output_same_uw,3));
output=permute(output,[2 3 4 1]);
