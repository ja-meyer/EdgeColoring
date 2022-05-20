%% Edge Coloring for a Graph
%  Input an adjacency matrix

function [B, Set] = EdgeColor(A,delt)

B = A;

color = 1;

[n m] = size(A);

% First color the first row
    for i = 2:n
        if B(1,i) ~= 0
            B(1,i) = color;
            color = color + 1;
        end
        B(i,1) = B(1,i);
    end

for i = 2:n % Rows 2 to n
    for j = (i+1):(n) % Columns past the diagonal
        if j > n
            break
        end
        C = []; % Set up a vector for the colors
        color = 1; % Initialize color as 1
        
        for k = 1:(j-1) % Check row values before B(i,j)
            if (B(i,k) > 0) == 1
                C = [C B(i,k)]; % Add the color to the vector if it is not 0
            end
        end
        for k = 1:(i-1) % Check column values before B(i,j)
            if (B(k,j) > 0) == 1
                C = [C B(k,j)]; % Add the color to the vector 
            end
        end
        C = sort(C);
        for k = 1:length(C)
            if C(k) == color
                color = color + 1;
            end
        end
        if (B(i,j) > 0) == 1
            B(i,j) = color;
            C = [C B(i,j)];
        end
        
 % Added the following   
 num = 1;
        while (B(i,j) > (delt + 1)) && (num <= (delt + 1)) % Checking for max delta + 1 coloring
            c = find(B(i,:) == num)
            color1 = 1;
            C1 = [num];
            for k = 1:j
                if k ~= c(1)
                    if (B(i,k) > 0) == 1
                        C1 = [C1 B(i,k)]; % Add the color to the vector if it is not 0
                    end
                end
            end
            
            for k = 1:(i-1) % Check column values before B(i,j)
                if (B(k,c(1)) > 0) == 1
                    C1 = [C1 B(k,c)]; % Add the color to the vector 
                end
            end
            C1 = sort(C1);
            for k = 1:length(C1)
                if color1 == C1(k)
                    color1 = color1 + 1;
                end
            end
            B(i,c(1)) = color1;
            B(c(1),i) = B(i,c(1));
            
            color3 = 1;
            C2 = [];
            for k = 1:(i-1)
                if (B(k,j) > 0) == 1
                    C2 = [C2 B(k,j)];
                end
            end
            for k = 1:(j-1)
                if (B(i,k) > 0) == 1
                    C2 = [C2 B(i,k)];
                end
            end
            C2
            C2 = sort(C2)
            for k = 1:length(C2)
                if C2(k) == color3
                    color3 = color3 + 1;
                end
            end
            color3
            
            disp(i)
            disp(j)
            B(i,j) = color3;
            B(j,i) = B(i,j)
            num = num + 1;
        end
        B(j,i) = B(i,j);
    end
end

H = graph(B,'upper');
figure;
plot(H,'EdgeLabel',H.Edges.Weight)
title(['Edge Coloring of Random Graph with (\Delta + 1) Colors'],'FontSize',14);
%title(['Peterson Graph Coloring'],'FontSize',14)

%Set = table2array(sortrows(H.Edges,2));

end