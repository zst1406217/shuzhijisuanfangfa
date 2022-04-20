function out = v(t)
u=1800;m0=160000;q=2500;g=9.8;
out=u.*log(m0./(m0-q.*t))-g.*t;
end

