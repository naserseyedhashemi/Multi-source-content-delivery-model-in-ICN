%   University of Isfahan, Isfahan, Iran
%   Computer engineering faculty  
%   Author:  Seyyed Naser Seyyed Hashemi
%                   n.s.hashemi@eng.ui.ac.ir
%                   naser_seyed_hashemi@yahoo.com
%   
%   This function calculates VRTT for the topology stored in the array 's'.
%   
%
%

function ret = calcvrtt(n)
        global s  
        global cur_node
        vrtt = s(n).delay;
        pathmiss = s(n).missprobk;
        
        cur_node = n; 
        if (cur_node == 3)  
            cur_node = n; 
        end 
        
        if ((s(n).bn ~= n) && (s(n).interfaceno > 0))
                i=n;
                pathmiss = s(n).missprobk;
                while (i ~= s(n).bn && s(i).interfaceno ~= 0)
                    i=s(i).interfaces(1);
                    %----------------------------------------- Calc VRTT
                    %vrtt = vrtt + s(i).delay * (1-s(i).missprobk)*pathmiss;    
                    vrtt = vrtt + s(i).delay *pathmiss;    
                    pathmiss = pathmiss * s(i).missprobk;
                    %-----------------------------------------
                end
        end
        vrttsum = 0; vrtt1 = 0; vrtt2 = 0; vrtt3 = 0; vrtt4=0;
        
        if (s(n).interfaceno >0)
                n = s(n).bn;
                if (s(n).interfaceno>1)
                        if (s(n).interfaces(1) ~= 0),  vrtt1 = calcvrtt(s(n).interfaces(1));  end
                        if (s(n).interfaces(2) ~= 0),  vrtt2 = calcvrtt(s(n).interfaces(2));  end
                        if (s(n).interfaces(3) ~= 0),  vrtt3 = calcvrtt(s(n).interfaces(3));  end
                        if (s(n).interfaces(4) ~= 0),  vrtt4 = calcvrtt(s(n).interfaces(4));  end

                        vrttsum = s(n).weight(1) * vrtt1 + s(n).weight(2) * vrtt2 + s(n).weight(3) * vrtt3 + s(n).weight(4) * vrtt4;
                end
        end
        ret = vrtt + pathmiss * vrttsum;
end
