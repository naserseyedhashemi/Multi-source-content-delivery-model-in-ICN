%   University of Isfahan, Isfahan, Iran
%   Computer engineering faculty  
%   Author:  Seyyed Naser Seyyed Hashemi
%                   n.s.hashemi@eng.ui.ac.ir
%                   naser_seyed_hashemi@yahoo.com
%   

clc;
clear;
%---------------------------------------------------------
global M; M = 20000; %20000
global K; K = 400;
global m; m = M/K;
global chunk_size; chunk_size = 10*1024; % KB
global sigma; sigma = 690; % Chunk no in content item
global landa; landa = 40; % content / sec
global alpha; alpha = 2;
global cur_node; cur_node = 1;
%---------------------------------------------------------
global s; 
s = buildtreeCNR1;
%s = buildtreeCNR2;

update_nodes(1);
%--------------------------------------------------------

%sizes = [500000 800000 1000000 1200000 1500000 2000000]
%for size = sizes 
for i=1:length(s)
    s(i).cachesize = 2000000;
end

for i=1:length(s)
    s(i).delay= 20;
end
s(1).delay = 0;

for alpha=1.4:0.2:2.4
    vrtt =zeros(100,1)'; 

        for k=1:100
            update_missprob(1,k);
            vrtt(k) = sigma*calcvrtt(1);
        end

       hold all
       plot(vrtt);
end
legend('Alpha = 1.4', 'Alpha = 1.6', 'Alpha = 1.8', 'Alpha = 2', 'Alpha = 2.2', 'Alpha = 2.4');
%-------------plot miss probabilites for content rank k in nodes
% for i=1:length(s)
%      miss(i) = s(i).missprobk; 
%  end
%  hold all
%  plot(miss)

%-------------plot nodes delay
% for i=1:length(s)
%     delay(i) = s(i).delay; 
% end
% plot(delay)
