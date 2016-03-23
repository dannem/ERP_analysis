a=length(lwdata.header.events);
for i=2:length(lwdata.header.events)-1;
    if str2num(a(i))==202 & str2num(a(i+1))<180
        lwdata.header.events(i+1)='180';
    elseif str2num(a(i))==210 & str2num(a(i-1))<180
        lwdata.header.events(i+1)='180';
    else
    end
end