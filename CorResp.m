a=lwdata.header.events;
for i=2:length(lwdata.header.events)-1;
    if strcmp(a(i).code,'202') & str2num(a(i+1).code)<180
        lwdata.header.events(i+1).code='180';
    elseif strcmp(a(i).code,'210') & str2num(a(i-1).code)<180
        lwdata.header.events(i-1).code='180';
    else
    end
end