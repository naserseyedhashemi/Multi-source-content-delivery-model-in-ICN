%   University of Isfahan, Isfahan, Iran
%   Computer engineering faculty  
%   Author:  Seyyed Nasser Seyyed Hashemi
%                   n.s.hashemi@eng.ui.ac.ir
%                   naser_seyed_hashemi@yahoo.com
%   
% The network topology was implemented in the code below.
% each node structure:
%       {
%           id : node identifier
%           delay : round trip latency of the link prior this node
%           weight : the forwarding ratio of interest pkts to the
%           corresponding interface of this node.
%           interfaceno : # of node interface in downstream. This value is
%           zero for providers. one for the nodes on the path. Greater than one for branching nodes. 
%           interfaces : index of the next nodes 
%           bn : index of next branching node in the downstream. This field is
%           updated by the function in 'update_nodes.m'
%           cachesize : cache size of this node
%           missprobk : the requested content miss probability in the
%           repository of this node. The value of this field is calculated by
%           the function in 'update_missprob.m'
%   }
%
%   The topology is constructed by using an array. Each element of array
%   contains one node of the topology. 
%
%

function s=buildtreeCNR2()
        %clear
        %clc

        field1 = 'id';  value1 = 1; 
        field2 = 'delay';  value2 = 10.0;
        field3 = 'weight';  value3 = [1, 0, 0, 0];
        field4 = 'interfaceno';  value4 = 1; 
        field5 = 'interfaces';  value5 = [2, 0, 0, 0];
        field6 = 'bn';  value6 = 2;
        field7 = 'cachesize';  value7 = 200000;
        field8 = 'missprobk';  value8 = 1;
        s(1) = struct(field1,value1,field2,value2,field3,value3,field4,value4,field5,value5,field6,value6,field7,value7,field8,value8);

        field1 = 'id';  value1 = 3;
        field2 = 'delay';  value2 = 10.0;
        field3 = 'weight';  value3 = [0.1619, 0.5756, 0.262, 0];
        field4 = 'interfaceno';  value4 = 3;
        field5 = 'interfaces';  value5 = [3, 6, 9, 0];
        field6 = 'bn';  value6 = 0;
        field7 = 'cachesize';  value7 = 200000;
        field8 = 'missprobk';  value8 = 1;
        s(2) = struct(field1,value1,field2,value2,field3,value3,field4,value4,field5,value5,field6,value6,field7,value7,field8,value8);

        field1 = 'id';  value1 = 4;
        field2 = 'delay';  value2 = 10.0;
        field3 = 'weight';  value3 = [1, 0, 0, 0];
        field4 = 'interfaceno';  value4 = 1;
        field5 = 'interfaces';  value5 = [4, 0, 0, 0];
        field6 = 'bn';  value6 = 5;
        field7 = 'cachesize';  value7 = 200000;
        field8 = 'missprobk';  value8 = 1;
        s(3) = struct(field1,value1,field2,value2,field3,value3,field4,value4,field5,value5,field6,value6,field7,value7,field8,value8);

        field1 = 'id';  value1 = 11;
        field2 = 'delay';  value2 = 10.0;
        field3 = 'weight';  value3 = [1, 0, 0, 0];
        field4 = 'interfaceno';  value4 = 1;
        field5 = 'interfaces';  value5 = [5, 0, 0, 0];
        field6 = 'bn';  value6 = 5;
        field7 = 'cachesize';  value7 = 200000;
        field8 = 'missprobk';  value8 = 1;
        s(4) = struct(field1,value1,field2,value2,field3,value3,field4,value4,field5,value5,field6,value6,field7,value7,field8,value8);

        field1 = 'id';  value1 = 10;
        field2 = 'delay';  value2 = 10.0;
        field3 = 'weight';  value3 = [0, 0, 0, 0];
        field4 = 'interfaceno';  value4 = 0;
        field5 = 'interfaces';  value5 = [0, 0, 0, 0];
        field6 = 'bn';  value6 = 0;
        field7 = 'cachesize';  value7 = 200000;
        field8 = 'missprobk';  value8 = 1;
        s(5) = struct(field1,value1,field2,value2,field3,value3,field4,value4,field5,value5,field6,value6,field7,value7,field8,value8);

        field1 = 'id';  value1 = 5;
        field2 = 'delay';  value2 = 10.0;
        field3 = 'weight';  value3 = [0.5, 0.5, 0, 0];
        field4 = 'interfaceno';  value4 = 2;
        field5 = 'interfaces';  value5 = [7, 8, 0, 0];
        field6 = 'bn';  value6 = 0;
        field7 = 'cachesize';  value7 = 200000;
        field8 = 'missprobk';  value8 = 1;
        s(6) = struct(field1,value1,field2,value2,field3,value3,field4,value4,field5,value5,field6,value6,field7,value7,field8,value8);

        field1 = 'id';  value1 = 10;
        field2 = 'delay';  value2 = 10.0;
        field3 = 'weight';  value3 = [0, 0, 0, 0];
        field4 = 'interfaceno';  value4 = 0;
        field5 = 'interfaces';  value5 = [0, 0, 0, 0];
        field6 = 'bn';  value6 = 0;
        field7 = 'cachesize';  value7 = 200000;
        field8 = 'missprobk';  value8 = 1;
        s(7) = struct(field1,value1,field2,value2,field3,value3,field4,value4,field5,value5,field6,value6,field7,value7,field8,value8);

        field1 = 'id';  value1 = 9;
        field2 = 'delay';  value2 = 10.0;
        field3 = 'weight';  value3 = [0, 0, 0, 0];
        field4 = 'interfaceno';  value4 = 0;
        field5 = 'interfaces';  value5 = [0, 0, 0, 0];
        field6 = 'bn';  value6 = 0;
        field7 = 'cachesize';  value7 = 200000;
        field8 = 'missprobk';  value8 = 1;
        s(8) = struct(field1,value1,field2,value2,field3,value3,field4,value4,field5,value5,field6,value6,field7,value7,field8,value8);

        field1 = 'id';  value1 = 6;
        field2 = 'delay';  value2 = 10.0;
        field3 = 'weight';  value3 = [1, 0, 0, 0];
        field4 = 'interfaceno';  value4 = 1;
        field5 = 'interfaces';  value5 = [10, 0, 0, 0];
        field6 = 'bn';  value6 = 10;
        field7 = 'cachesize';  value7 = 200000;
        field8 = 'missprobk';  value8 = 1;
        s(9) = struct(field1,value1,field2,value2,field3,value3,field4,value4,field5,value5,field6,value6,field7,value7,field8,value8);

        field1 = 'id';  value1 = 7;
        field2 = 'delay';  value2 = 10.0;
        field3 = 'weight';  value3 = [0.5714, 0.2856, 0.1428, 0];
        field4 = 'interfaceno';  value4 = 3;
        field5 = 'interfaces';  value5 = [11, 13, 19, 0];
        field6 = 'bn';  value6 = 0;
        field7 = 'cachesize';  value7 = 200000;
        field8 = 'missprobk';  value8 = 1;
        s(10) = struct(field1,value1,field2,value2,field3,value3,field4,value4,field5,value5,field6,value6,field7,value7,field8,value8);

        field1 = 'id';  value1 = 8;
        field2 = 'delay';  value2 = 10.0;
        field3 = 'weight';  value3 = [1, 0, 0, 0];
        field4 = 'interfaceno';  value4 = 1;
        field5 = 'interfaces';  value5 = [12, 0, 0, 0];
        field6 = 'bn';  value6 = 12;
        field7 = 'cachesize';  value7 = 200000;
        field8 = 'missprobk';  value8 = 1;
        s(11) = struct(field1,value1,field2,value2,field3,value3,field4,value4,field5,value5,field6,value6,field7,value7,field8,value8);
        
         field1 = 'id';  value1 = 9;
        field2 = 'delay';  value2 = 10.0;
        field3 = 'weight';  value3 = [0, 0, 0, 0];
        field4 = 'interfaceno';  value4 = 0;
        field5 = 'interfaces';  value5 = [0, 0, 0, 0];
        field6 = 'bn';  value6 = 0;
        field7 = 'cachesize';  value7 = 200000;
        field8 = 'missprobk';  value8 = 1;
        s(12) = struct(field1,value1,field2,value2,field3,value3,field4,value4,field5,value5,field6,value6,field7,value7,field8,value8);
        
         field1 = 'id';  value1 = 17;
        field2 = 'delay';  value2 = 10.0;
        field3 = 'weight';  value3 = [1, 0, 0, 0];
        field4 = 'interfaceno';  value4 = 1;
        field5 = 'interfaces';  value5 = [14, 0, 0, 0];
        field6 = 'bn';  value6 = 14;
        field7 = 'cachesize';  value7 = 200000;
        field8 = 'missprobk';  value8 = 1;
        s(13) = struct(field1,value1,field2,value2,field3,value3,field4,value4,field5,value5,field6,value6,field7,value7,field8,value8);
        
         field1 = 'id';  value1 = 18;
        field2 = 'delay';  value2 = 10.0;
        field3 = 'weight';  value3 = [0.5, 0.5, 0, 0];
        field4 = 'interfaceno';  value4 = 2;
        field5 = 'interfaces';  value5 = [15, 17, 0, 0];
        field6 = 'bn';  value6 = 0;
        field7 = 'cachesize';  value7 = 200000;
        field8 = 'missprobk';  value8 = 1;
        s(14) = struct(field1,value1,field2,value2,field3,value3,field4,value4,field5,value5,field6,value6,field7,value7,field8,value8);
        
         field1 = 'id';  value1 = 19;
        field2 = 'delay';  value2 = 10.0;
        field3 = 'weight';  value3 = [1, 0, 0, 0];
        field4 = 'interfaceno';  value4 = 1;
        field5 = 'interfaces';  value5 = [16, 0, 0, 0];
        field6 = 'bn';  value6 = 16;
        field7 = 'cachesize';  value7 = 200000;
        field8 = 'missprobk';  value8 = 1;
        s(15) = struct(field1,value1,field2,value2,field3,value3,field4,value4,field5,value5,field6,value6,field7,value7,field8,value8);
        
         field1 = 'id';  value1 = 20;
        field2 = 'delay';  value2 = 10.0;
        field3 = 'weight';  value3 = [0, 0, 0, 0];
        field4 = 'interfaceno';  value4 = 0;
        field5 = 'interfaces';  value5 = [0, 0, 0, 0];
        field6 = 'bn';  value6 = 0;
        field7 = 'cachesize';  value7 = 200000;
        field8 = 'missprobk';  value8 = 1;
        s(16) = struct(field1,value1,field2,value2,field3,value3,field4,value4,field5,value5,field6,value6,field7,value7,field8,value8);
        
         field1 = 'id';  value1 = 21;
        field2 = 'delay';  value2 = 10.0;
        field3 = 'weight';  value3 = [1, 0, 0, 0];
        field4 = 'interfaceno';  value4 = 1;
        field5 = 'interfaces';  value5 = [18, 0, 0, 0];
        field6 = 'bn';  value6 = 18;
        field7 = 'cachesize';  value7 = 200000;
        field8 = 'missprobk';  value8 = 1;
        s(17) = struct(field1,value1,field2,value2,field3,value3,field4,value4,field5,value5,field6,value6,field7,value7,field8,value8);
        
         field1 = 'id';  value1 = 22;
        field2 = 'delay';  value2 = 10.0;
        field3 = 'weight';  value3 = [0, 0, 0, 0];
        field4 = 'interfaceno';  value4 = 0;
        field5 = 'interfaces';  value5 = [0, 0, 0, 0];
        field6 = 'bn';  value6 = 0;
        field7 = 'cachesize';  value7 = 200000;
        field8 = 'missprobk';  value8 = 1;
        s(18) = struct(field1,value1,field2,value2,field3,value3,field4,value4,field5,value5,field6,value6,field7,value7,field8,value8);
        
         field1 = 'id';  value1 = 23;
        field2 = 'delay';  value2 = 10.0;
        field3 = 'weight';  value3 = [1, 0, 0, 0];
        field4 = 'interfaceno';  value4 = 1;
        field5 = 'interfaces';  value5 = [20, 0, 0, 0];
        field6 = 'bn';  value6 = 22;
        field7 = 'cachesize';  value7 = 200000;
        field8 = 'missprobk';  value8 = 1;
        s(19) = struct(field1,value1,field2,value2,field3,value3,field4,value4,field5,value5,field6,value6,field7,value7,field8,value8);
        
         field1 = 'id';  value1 = 24;
        field2 = 'delay';  value2 = 10.0;
        field3 = 'weight';  value3 = [1, 0, 0, 0];
        field4 = 'interfaceno';  value4 = 1;
        field5 = 'interfaces';  value5 = [21, 0, 0, 0];
        field6 = 'bn';  value6 = 22;
        field7 = 'cachesize';  value7 = 200000;
        field8 = 'missprobk';  value8 = 1;
        s(20) = struct(field1,value1,field2,value2,field3,value3,field4,value4,field5,value5,field6,value6,field7,value7,field8,value8);
        
         field1 = 'id';  value1 = 25;
        field2 = 'delay';  value2 = 10.0;
        field3 = 'weight';  value3 = [1, 0, 0, 0];
        field4 = 'interfaceno';  value4 = 1;
        field5 = 'interfaces';  value5 = [22, 0, 0, 0];
        field6 = 'bn';  value6 = 22;
        field7 = 'cachesize';  value7 = 200000;
        field8 = 'missprobk';  value8 = 1;
        s(21) = struct(field1,value1,field2,value2,field3,value3,field4,value4,field5,value5,field6,value6,field7,value7,field8,value8);
        
         field1 = 'id';  value1 = 26;
        field2 = 'delay';  value2 = 10.0;
        field3 = 'weight';  value3 = [0, 0, 0, 0];
        field4 = 'interfaceno';  value4 = 0;
        field5 = 'interfaces';  value5 = [0, 0, 0, 0];
        field6 = 'bn';  value6 = 0;
        field7 = 'cachesize';  value7 = 200000;
        field8 = 'missprobk';  value8 = 1;
        s(22) = struct(field1,value1,field2,value2,field3,value3,field4,value4,field5,value5,field6,value6,field7,value7,field8,value8);
end