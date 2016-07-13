%% first block
a=lwdata.header.events;
for i=3:length(lwdata.header.events)-1;
    x = str2double(a(i).code);
    x1 = str2double(a(i+1).code);
    a(i).latency=a(i).latency+0.01;
    if 200<x && x<221
        a(i).code='500';
    elseif x1==250;
        a(i).code='500';
    elseif 220<x && x<240
        a(i).code=num2str(x+380);
    else
    end
end
% assign back
lwdata.header.events=a;

%% second block
a=lwdata.header.events;
for i=4:length(lwdata.header.events)-1;
    x = str2double(a(i).code);
    x1 = str2double(a(i+1).code);
    a(i).latency=a(i).latency+0.01;
    if 200<x && x<221
        a(i).code='500';
    elseif x1==250;
        a(i).code='500';
    elseif 220<x && x<240
        a(i).code=num2str(x+480);
    else
    end
end
% assign back
lwdata.header.events=a;

%% exporting events

out=[];
for i=3:length(events)
    out(i,1)=str2double(events{i,1});
%     out{i,2}=str2double(events{i,2});
%     out{i,3}=str2double(events{i,3});
end
    