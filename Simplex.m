



function newMat=Simplex(mat)
% newMat=mat;
newMat=zeros(size(mat));
numRow=length(mat(:,1));
numCol=length(mat(1,:));

entryMat=mat(numRow,1:numCol-2);
[entry,P_col]=min(entryMat);

while(entry<0)               
    	a=mat(1:(numRow-1),numCol)./mat(1:(numRow-1),P_col);
    	[val,P_row]=min(a);  
        if(val<0)
           [s,indices]=sort(a);
           if(max(a)>0)
               count=1;
           while(s(count)<0)
                count=count+1;
           end
           P_row=indices(count);
           end
        end
        if(length(a)==0)
            disp('end');
            newMat=mat;
            return
        end
%         mat=pivot(mat,P_row,P_col);
        mat(P_row,:)=mat(P_row,:)./mat(P_row,P_col); 
        for r=1:length(mat(:,1))
            if(r~=P_row)
                rG=mat(P_row,:)*-mat(r,P_col);
                mat(r,:)=rG + mat(r,:);
            end    
        end
        
        entry=mat(numRow,1:numCol-2);
        [entry,P_col]=min(entry); 
end
newMat=mat;
end