function [res] = bcs(ya,yb,lambda)
  
res = [ ya(1); yb(1)-1; yb(2) ];