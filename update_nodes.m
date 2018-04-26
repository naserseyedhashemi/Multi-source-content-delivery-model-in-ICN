%   University of Isfahan, Isfahan, Iran
%   Computer engineering faculty  
%   Author:  Seyyed Nasser Seyyed Hashemi
%                   n.s.hashemi@eng.ui.ac.ir
%                   naser_seyed_hashemi@yahoo.com
%   
%   This function updates the value of field 'bn' in each node of topology
%   stored in 's'. 
%   
%
%

function ret = update_nodes(n)
    global s;
    
    if (s(n).interfaceno == 0)
            ret = n;
    elseif (s(n).interfaceno == 1)
            s(n).bn = update_nodes(s(n).interfaces(1));
            ret = s(n).bn;
    elseif (s(n).interfaceno >1)
            if s(n).interfaces(1) ~= 0
                s(n).bn = update_nodes(s(n).interfaces(1));
            end
            if s(n).interfaces(2)  ~= 0
                s(n).bn = update_nodes(s(n).interfaces(2));
            end
            if s(n).interfaces(3) ~= 0
                s(n).bn = update_nodes(s(n).interfaces(3));
            end
            if s(n).interfaces(4) ~= 0
                s(n).bn = update_nodes(s(n).interfaces(4));
            end
            s(n).bn = n;
            ret = n;
    end
end
