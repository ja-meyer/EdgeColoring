%% Inputs for functions, uses RandGraph.m, EdgeColor.m
% Specify the number of vertices and maximum degree desired for a random
% graph in RandGraph below. This will display a random graph, the results
% will be inputs for EdgeColor below which will display the colored graph
% and finally those results are input into EdgeTester which will check to
% see if there is a proper (Delta+1) coloring.

[A, n, delt] = RandGraph(12,5);

[B] = EdgeColor(A,delt);

answ = EdgeTester(B,n,delt);
disp(answ)

%% Peterson Graph construction, edge coloring and color tester

% Adjacency Matrix for Peterson Graph 
Pet = [0 1 0 0 1 0 1 0 0 0; 
       1 0 1 0 0 0 0 1 0 0; 
       0 1 0 1 0 0 0 0 1 0; 
       0 0 1 0 1 0 0 0 0 1; 
       1 0 0 1 0 1 0 0 0 0; 
       0 0 0 0 1 0 0 1 1 0; 
       1 0 0 0 0 0 0 0 1 1; 
       0 1 0 0 0 1 0 0 0 1; 
       0 0 1 0 0 1 1 0 0 0; 
       0 0 0 1 0 0 1 1 0 0];
   
G = graph(Pet,'upper');
figure;
plot(G)
title(['Peterson Graph'],'FontSize',14)
[B] = EdgeColor(Pet);

answ = EdgeTester(B,n,delt);
disp(answ)

%% Test Matrix
%  An edge coloring created to demonstrate that the EdgeTester will correctly
%  state if an edge coloring is greater than (Delta + 1)

B = [0 1 2 0 0 3 5;
     1 0 3 0 0 4 6;
     2 3 0 1 4 0 5;
     0 0 1 0 2 5 3;
     0 0 4 2 0 1 0
     3 4 0 5 1 0 8
     5 5 6 3 0 8 0];
 
 n = size(B);
 
 answ = EdgeTester(B,n(1),5);
 disp(answ)

%% Function to check if the coloring is proper

function answer = EdgeTester(B,n,delt)
    maxcol = delt + 1;
    c = max(B);
    num = max(c);
    
    if num > maxcol
        answer = ['Coloring is greater than a (Delta + 1)-coloring'];
    else
        answer = ['Coloring is a proper (Delta + 1)-coloring'];
    end
    
    figure;
    hist(B(:,:),unique(B(:,:)))
    title(['Frequency Histogram of Edge Coloring'],'FontSize',14);
    
end


