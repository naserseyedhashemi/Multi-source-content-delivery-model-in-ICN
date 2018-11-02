%   University of Isfahan, Isfahan, Iran
%   Computer engineering faculty  
%   Author:  Seyyed Naser Seyyed Hashemi
%                   n.s.hashemi@eng.ui.ac.ir
%                   naser_seyed_hashemi@yahoo.com
%   
%   This function calculates the field 'missprobk' in each node of topology.
%   
%
%

function update_missprob(n, k, prevn, pk1, probk,w)
    global s alpha 
    
    if (nargin < 6)
        prevn = 0;
        probk = 1;
        pk1 = 1;
        w=1;
    end
    
 %w=1;
    
    if (n == 1)
            pk1 = calc_pk1(k, n);
            s(n).missprobk = probk * pk1; 
            pk1 = (pk1); 
            update_missprob(s(n).interfaces(1), k, n, pk1, pk1,w*s(n).weight(1));
            %update_missprob(s(n).interfaces(1), k, n, pk1, pk1,s(n).weight(1));
    else
            tmpprobk = probk*((s(n).cachesize/s(prevn).cachesize)^alpha);
            tmpprobk2 = pk1^(tmpprobk*w);
            %tmpprobk2 = pk1^(tmpprobk);
            s(n).missprobk = tmpprobk2;
            tmpprobk = tmpprobk*tmpprobk2;
           
            if s(n).interfaceno >= 1, 
                update_missprob(s(n).interfaces(1), k, n, pk1, tmpprobk, w*s(n).weight(1));
                %update_missprob(s(n).interfaces(1), k, n, pk1, tmpprobk, s(n).weight(1));
            end
            if s(n).interfaceno >= 2, 
                update_missprob(s(n).interfaces(2), k, n, pk1, tmpprobk, w*s(n).weight(2));
                %update_missprob(s(n).interfaces(2), k, n, pk1, tmpprobk, s(n).weight(2));
            end
            if s(n).interfaceno >= 3, 
                update_missprob(s(n).interfaces(3), k, n, pk1, tmpprobk, w*s(n).weight(3)); 
                %update_missprob(s(n).interfaces(3), k, n, pk1, tmpprobk, s(n).weight(3)); 
            end
            if s(n).interfaceno == 4, 
                update_missprob(s(n).interfaces(4), k, n, pk1, tmpprobk, w*s(n).weight(4)); 
                %update_missprob(s(n).interfaces(4), k, n, pk1, tmpprobk, s(n).weight(4)); 
            end
    end
end

function pk1 = calc_pk1(k, n)
        global landa sigma m alpha s
        c = calc_c();
        
        g = landa*c*(sigma^alpha)*(m^(alpha-1))*((gamma(1-(1/alpha)))^alpha);
        %g = landa*c*(sigma^alpha)*(m^(alpha-1))*((gamma(1-(1/alpha))));
        g = 1/g;
        q = popularity(k);
        
        pk1 = exp((-landa/m)*q*g*(s(n).cachesize^alpha));
end

function q = popularity(k)
        global alpha
        
        t = 1 / (k.^alpha);
        c = calc_c();
        
        q = t / c;
end

function c = calc_c()
        global K alpha
        s = 0;
        for i=1:K
                s = s + (1 / (i^alpha));
        end
        c = s;
end
