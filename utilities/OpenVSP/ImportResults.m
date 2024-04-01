function [res] = ImportResults(ac)

% Imports results.
%
% name: aircraft name

%% global coefficients from polar file

polar     = importdata([ac.name '_DegenGeom.polar']);

res.CL    = polar.data(:,5);
res.CDo   = polar.data(:,6);
res.CDi   = polar.data(:,7);
res.CDtot = polar.data(:,8);
res.CS    = polar.data(:,9);
res.E     = polar.data(:,10);
res.e     = polar.data(:,11);
res.CFx   = polar.data(:,12);
res.CFy   = polar.data(:,13);
res.CFz   = polar.data(:,14);
res.CMx   = polar.data(:,15);
res.CMy   = polar.data(:,16);
res.CMz   = polar.data(:,17);
res.CMl   = polar.data(:,18);
res.CMm   = polar.data(:,19);
res.CMn   = polar.data(:,20);

%% local coefficients from lod file
% extract wing only aerodynamic loads for each angle of attack

% number of rows to read for each angle of attack
% Same switch case of MakeVspscript
switch ac.config                                   % writing vspecript file
    case 'W'                                    % depending on configuration
        nRows = sum(ac.wing.utess)-length(ac.wing.utess);
        
    case 'WP'                                    % depending on configuration
        nRows = sum(ac.wing.utess)-length(ac.wing.utess);
        
    case 'WB'
        nRows = sum(ac.wing.utess)-length(ac.wing.utess);
        
    case 'WH'
        nRows = sum(ac.wing.utess)-length(ac.wing.utess) + ...
            sum(ac.hor.utess)-length(ac.hor.utess);
    case 'WV'
        % VSPAERO fails VTAIL loads when Vtail is in plane of simmetry
        if ac.ver.yloc > 0.0
            nRows = sum(ac.wing.utess)-length(ac.wing.utess) + ...
                sum(ac.ver.utess)-length(ac.ver.utess);
        else
            nRows = sum(ac.wing.utess)-length(ac.wing.utess);
        end
    case 'WHP'
        nRows = sum(ac.wing.utess)-length(ac.wing.utess) + ...
            sum(ac.hor.utess)-length(ac.hor.utess);
    case 'WHF'
        nRows = sum(ac.wing.utess)-length(ac.wing.utess) + ...
            sum(ac.hor.utess)-length(ac.hor.utess);
    case 'WVP'
        % VSPAERO fails VTAIL loads when Vtail is in plane of simmetry
        if ac.ver.yloc > 0.0
            nRows = sum(ac.wing.utess)-length(ac.wing.utess) + ...
                sum(ac.ver.utess)-length(ac.ver.utess);
        else
            nRows = sum(ac.wing.utess)-length(ac.wing.utess);
        end
    case 'WVF'
        % VSPAERO fails VTAIL loads when Vtail is in plane of simmetry
        if ac.ver.yloc > 0.0
            nRows = sum(ac.wing.utess)-length(ac.wing.utess) + ...
                sum(ac.ver.utess)-length(ac.ver.utess);
        else
            nRows = sum(ac.wing.utess)-length(ac.wing.utess);
        end
    case 'WBH'
        nRows = sum(ac.wing.utess)-length(ac.wing.utess) + ...
            sum(ac.hor.utess)-length(ac.hor.utess);
    case 'WBV'
        % VSPAERO fails VTAIL loads when Vtail is in plane of simmetry
        if ac.ver.yloc > 0.0
            nRows = sum(ac.wing.utess)-length(ac.wing.utess) + ...
                sum(ac.ver.utess)-length(ac.ver.utess);
        else
            nRows = sum(ac.wing.utess)-length(ac.wing.utess);
        end 
            case 'WBHP'
                nRows = sum(ac.wing.utess)-length(ac.wing.utess) + ...
                    sum(ac.hor.utess)-length(ac.hor.utess);
    case 'WBHF'
        nRows = sum(ac.wing.utess)-length(ac.wing.utess) + ...
            sum(ac.hor.utess)-length(ac.hor.utess);
    case 'WBVP'
        % VSPAERO fails VTAIL loads when Vtail is in plane of simmetry
        if ac.ver.yloc > 0.0
            nRows = sum(ac.wing.utess)-length(ac.wing.utess) + ...
                sum(ac.ver.utess)-length(ac.ver.utess);
        else
            nRows = sum(ac.wing.utess)-length(ac.wing.utess);
        end
    case 'WBVF'
        % VSPAERO fails VTAIL loads when Vtail is in plane of simmetry
        if ac.ver.yloc > 0.0
            nRows = sum(ac.wing.utess)-length(ac.wing.utess) + ...
                sum(ac.ver.utess)-length(ac.ver.utess);
        else
            nRows = sum(ac.wing.utess)-length(ac.wing.utess);
        end
    case 'WBHV'
        % VSPAERO fails VTAIL loads when Vtail is in plane of simmetry
        if ac.ver.yloc > 0.0
            nRows = sum(ac.wing.utess)-length(ac.wing.utess) + ...
                sum(ac.hor.utess)-length(ac.hor.utess)+...
                sum(ac.ver.utess)-length(ac.ver.utess);
        else
            nRows = sum(ac.wing.utess)-length(ac.wing.utess) + ...
                sum(ac.hor.utess)-length(ac.hor.utess);
        end
    case 'WBHVP'
        % VSPAERO fails VTAIL loads when Vtail is in plane of simmetry
        if ac.ver.yloc > 0.0
            nRows = sum(ac.wing.utess)-length(ac.wing.utess) + ...
                sum(ac.hor.utess)-length(ac.hor.utess)+...
                sum(ac.ver.utess)-length(ac.ver.utess);
        else
            nRows = sum(ac.wing.utess)-length(ac.wing.utess) + ...
                sum(ac.hor.utess)-length(ac.hor.utess);
        end
    case 'WBHVF'
        % VSPAERO fails VTAIL loads when Vtail is in plane of simmetry
        if ac.ver.yloc > 0.0
            nRows = sum(ac.wing.utess)-length(ac.wing.utess) + ...
                sum(ac.hor.utess)-length(ac.hor.utess)+...
                sum(ac.ver.utess)-length(ac.ver.utess);
        else
            nRows = sum(ac.wing.utess)-length(ac.wing.utess) + ...
                sum(ac.hor.utess)-length(ac.hor.utess);
        end
end

% if isfield(ac,'hor') % if horizontal tail exist
%     nRows = sum(ac.wing.utess)-length(ac.wing.utess) + ...
%         sum(ac.hor.utess)-length(ac.hor.utess);
% else % otherwise consider only wing
%     nRows = sum(ac.wing.utess)-length(ac.wing.utess);
% end

%nRows

% number of lines to skip depending on the number of components
% (for some reason PodGeom are duplicates in addition to symmetry - at least in v3.19)
nomi = fieldnames(ac);
nWing = 0;
nFuse = 0;
nPod = 0;
for ii = 1:length(nomi)
    if isstruct(ac.(nomi{ii}))
        vspID = ac.(nomi{ii}).id;
        if (~isempty(strfind(ac.config,'W')) && strcmp(vspID,'wing')) || ...
                (~isempty(strfind(ac.config,'H')) && strcmp(vspID,'horizontal')) || ...
                (~isempty(strfind(ac.config,'V')) && strcmp(vspID,'vertical'))&& ac.ver.yloc > 0.0
            
            nWing = nWing + 1;
        end
        if ~isempty(strfind(ac.config,'B')) && strcmp(vspID,'fuselage')
            nFuse = nFuse + 1;
        end
        if ~isempty(strfind(ac.config,'P')) && strcmp(vspID,'pod')
            nPod = nPod + length(ac.(nomi{ii}).yloc) * 4; % yes they are added 4 times, don't know why
        end
    end
end

% nRows
% nWing
% nFuse
% nPod

nLines = 18  + nRows+ nWing + nFuse + nPod;

if length(res.CL) > 1
    startRow = [18, 18+(1:(length(res.CL)-1))*nLines];
    %    startRow = [18, 125, 232];
else
    startRow = 18; % it should start from 18
end
endRow = startRow + nRows -1;

lod = ReadLODfile([ac.name '_DegenGeom.lod'],startRow,endRow);

for ii = 1:length(res.CL)
    loads = lod(1+nRows*(ii-1):nRows*ii,:);
    for jj = 1:sum(ac.wing.utess)-length(ac.wing.utess) % only wing 1
        res.Yavg(ii,jj) = loads(jj,3);
        res.Cl(ii,jj)   = loads(jj,6);
        res.Cd(ii,jj)   = loads(jj,7); %
        res.Cmy(ii,jj)   = loads(jj,13); %
    end
end

end

