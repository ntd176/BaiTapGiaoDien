function [nghiem] = Gauss_Jordan(A, bc2)
    voNghiem = 0;
    voSoNghiem = 0;
    Ab = [A bc2]; % ma tran mo rong
    for n = 1:(length(Ab)-1)
        % Step 1: chia hang cho he so theo xi
         row = Ab(n,:);
         if (row(n) == 0)
            voNghiem = 1;
            break
         end
         row = row/row(n);
         Ab(n,:) = row;
        % Step 2: triệt tiêu xi ở hàng ~=i
         for k = 1:(length(Ab)-1)
             if k~=n
                Ab(k,:) = Ab(k,:)-1*Ab(k,n)*Ab(n,:);
             end
         end
    end
    % Kiểm tra vô số nghiệm: nếu tất cả phần tử của hàng = 0
    if any(all(Ab == 0, 2))
        voSoNghiem = 1;
        voNghiem = 0;
    end
    if (voSoNghiem)
        nghiem = 'Vô số nghiệm';
    elseif (voNghiem)
        nghiem = 'Vô nghiệm';
    else
        nghiem = Ab(:,length(Ab));
    end
end