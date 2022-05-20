%% Random Graph Generator
%  Input number of vertices and maximum degree of the graph, displays a 
%  random graph generated from these constraints.

function [A, n, delt] = RandGraph(n,delt)
    A = zeros(n);
    for i = 1:n
        for j = 1:n
                x = rand;
                if x > 0.4
                    A(i,j) = 1;
                end
        end
        for j = 1:i
            A(j,i) = A(i,j);
        end
        A(i,i) = 0;
    end
    
    if issymmetric(A)
        disp(['This matrix is symmetric'])
    end
    
    c = sum(A);
    
    while c(1) < delt
        a = find(A(1,:) == 0);
        b = 2;
        A(1,a(b)) = 1;
        A(a(b),1) = 1;
        b = b + 1;
        c = sum(A);
    end
    
    c2 = sum(A);
    
    for i = 1:length(c2)
        while c(i) > delt
            r = round(1 + (n-1).*rand(1,1));
            if A(r,i) == 1
                A(r,i) = 0;
                A(i,r) = 0;
            end
            c = sum(A);
        end
    end
    
    x = [];
    y = [];
    for i = 1:n
        for j = 1:n
            if A(i,j) == 1
                x = [x i];
                y = [y j];
            end
        end
    end
    rowsum = sum(A)
    disp(['The maximum degree is ' num2str(max(rowsum))]);
    G = graph(A,'upper');
    figure;
    plot(G)
    title(['Random Graph Generated with n = ' num2str(n) ' and \Delta = ' num2str(delt)],'FontSize',14);
    
end