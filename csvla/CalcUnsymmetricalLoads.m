
%% CalcUnsymmLoads 
% Script to evaluate unsymmetrical load conditions associated with aileron
% deflection.
% =========================================================================
%   DESCRIPTION
%   It is useful to remember the following airworthiness rules: 
%   +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%   CS-VLA 349 Rolling conditions 
%   The wing and wing bracing must be designed for the following loading
%   conditions:   
%   (a) Unsymmetrical wing loads. Unless the following values result in 
%       unrealistic loads, the rolling accelerations may be obtained by
%       modifying the symmetrical flight conditions in CS-VLA 333(d) as
%       follows: In condition A, assume that 100% of the semispan wing
%       airload acts on one side of the aeroplane and 70% of this load
%       acts on the other side.  
%   (b) The  loads  resulting  from  the  aileron  deflections  and  
%       speeds  specified  in  CS-VLA 455, in combination with an aero- 
%       plane load factor of at least two thirds of the positive 
%       manoeuvring load factor used for design. Unless the following 
%       values result in unrealistic loads, the effect of aileron
%       displacement on wing torsion may be accounted for by adding the 
%       following increment to  the basic aerofoil moment coefficient
%       over the aileron portion of  the span in  the critical condition 
%       determined in CS-VLA 333(d):
%       
%                      DELTA_CM = (-0.01)*DELTA_AILERON
%
%       with 
%      
%       DELTA_CM      --> Moment coefficient increment
%       DELTA_AILERON --> Down aileron deflection in degrees in the 
%                         critical condition
%       
%       NOTE: The angle at critical condition DELTA_AILERON must be given
%             in degrees. 
%   +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%   CS-VLA 455 Ailerons 
%   (a) The ailerons must be designed for the loads to which they are
%       subjected  
%       (1) In the neutral position during symmetrical flight conditions; 
%           and  
%       (2) By the following deflections (except as limited by pilot 
%           effort), during unsymmetrical flight conditions; and 
%           (i) Sudden maximum displacement of the aileron control at VA. 
%               Suitable allowance may be made for control system defl-
%               ections. 
%          (ii) Sufficient deflection at VC, where VC is more than VA, to
%               produce a rate of roll not less than obtained in sub-
%               paragraph (a)(2)(i) of this paragraph. 
%         (iii) Sufficient deflection at VD to produce a rate of roll not
%               less than one-third of that obtained in subparagraph 
%               (a)(2)(i) of this paragraph.  
%   (b) The average loading in Appendix B, B11  and figure B1  of Appendix
%       B and the distribution in figure B9 of Appendix B may be used.
%
% =========================================================================

%% Initialization 
delta_aileron      = Aircraft.Geometry.Aileron.delta_max.value;
y_inner            = Aircraft.Geometry.Aileron.y_inner.value; 
y_outer            = Aircraft.Geometry.Aileron.y_outer.value; 
half_span          = Aircraft.Geometry.Wing.half_span_stations.value; 
y_in               = Aircraft.Geometry.Aileron.y_inner.value;
y_fin              = Aircraft.Geometry.Aileron.y_outer.value;
chord_distr        = Aircraft.Geometry.Wing.chord_distribution.value;
n_stations         = length(half_span);
obj2               = ShearBendingTorsion;
tol                = 1e-1;

% Preallocation
VA_VC_ratio = ones(n_Mass, 1);
VA_VD_ratio = ones(n_Mass, 1);

% Pitching moment distributions
cmA = ones(n_stations, n_Mass);
cmC = ones(n_stations, n_Mass);
cmD = ones(n_stations, n_Mass);

% Dynamic pressures 
qA = ones(n_Mass, 1);
qC = ones(n_Mass, 1);
qD = ones(n_Mass, 1);

% POINT A 
PointA                 = 'A';
DynPressUnsymmA        = ones(n_stations, n_Mass);
cm_unsymmA             = ones(n_stations, n_Mass);
MdistrFullA            = ones(n_stations, n_Mass);
MdistrSeventyPercentA  = ones(n_stations, n_Mass);
TorsionFullA           = ones(n_stations, n_Mass);
TorsionSeventyPercentA = ones(n_stations, n_Mass);

% POINT C 
PointC                 = 'C';
DynPressUnsymmC        = ones(n_stations, n_Mass);
cm_unsymmC             = ones(n_stations, n_Mass);
MdistrFullC            = ones(n_stations, n_Mass);
MdistrSeventyPercentC  = ones(n_stations, n_Mass);
TorsionFullC           = ones(n_stations, n_Mass);
TorsionSeventyPercentC = ones(n_stations, n_Mass);

% POINT D 
PointD                 = 'D';
DynPressUnsymmD        = ones(n_stations, n_Mass);
cm_unsymmD             = ones(n_stations, n_Mass);
MdistrFullD            = ones(n_stations, n_Mass);
MdistrSeventyPercentD  = ones(n_stations, n_Mass);
TorsionFullD           = ones(n_stations, n_Mass);
TorsionSeventyPercentD = ones(n_stations, n_Mass);

% Iterating through mass vector
for i = 1:n_Mass
    
    % Airspeed 
    VA = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointA.VA.value(i,1);
    VC = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointC.VC.value(i,1);
    VD = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointD.VD.value(i,1);
    
    % Airspeed ratios for calculations 
    VA_VC_ratio(i,1) = VA / VC;
    VA_VD_ratio(i,1) = (VA / ( 3 * VD ) );
    
    % Pitching moment distributions
    cmA(:,i) = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointA.cmA.value(:,i);
    cmC(:,i) = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointC.cmC.value(:,i);
    cmD(:,i) = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointD.cmD.value(:,i);
    
    % Dynamic pressures 
    qA(i,1) = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointA.qA.value(i,1);
    qC(i,1) = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointC.qC.value(i,1);
    qD(i,1) = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointD.qD.value(i,1);
    
    % ------------------------------------------------------------------------------------------------------------------------------------------------------
    % Point A - Unsymmetrical torsion 
    [DynPressUnsymmA(:,i), cm_unsymmA(:,i), MdistrFullA(:,i), MdistrSeventyPercentA(:,i), TorsionFullA(:,i), TorsionSeventyPercentA(:,i)] = ...
                                 UnsymmetricalTorsionAileron(obj2, delta_aileron, y_in, y_fin, qA(i,1), cmA(:,i), half_span, chord_distr, 1, PointA, tol);
    % ------------------------------------------------------------------------------------------------------------------------------------------------------
    
    % ------------------------------------------------------------------------------------------------------------------------------------------------------
    % Point C - Unsymmetrical torsion 
    [DynPressUnsymmC(:,i), cm_unsymmC(:,i), MdistrFullC(:,i), MdistrSeventyPercentC(:,i), TorsionFullC(:,i), TorsionSeventyPercentC(:,i)] = ...
                    UnsymmetricalTorsionAileron(obj2, delta_aileron, y_in, y_fin, qC(i,1), cmC(:,i), half_span, chord_distr, VA_VC_ratio(i,1), PointC, tol);
    % ------------------------------------------------------------------------------------------------------------------------------------------------------                            
         
    % ------------------------------------------------------------------------------------------------------------------------------------------------------
    % Point D - Unsymmetrical torsion 
    [DynPressUnsymmD(:,i), cm_unsymmD(:,i), MdistrFullD(:,i), MdistrSeventyPercentD(:,i), TorsionFullD(:,i), TorsionSeventyPercentD(:,i)] = ...
                    UnsymmetricalTorsionAileron(obj2, delta_aileron, y_in, y_fin, qD(i,1), cmD(:,i), half_span, chord_distr, VA_VD_ratio(i,1), PointD, tol);
    % ------------------------------------------------------------------------------------------------------------------------------------------------------                            
end

%% PLOT RESULTS 
UnsymmetricalTorsionPlots

%% FILLING FIELDS OF THE AIRCRAFT VARIABLE

% STORE POINTS - POINT A
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointA.DynPressUnsymmA.value                  = DynPressUnsymmA;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointA.DynPressUnsymmA.Attributes.unit        = "N/m^2";
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointA.cm_unsymmA.value                       = cm_unsymmA;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointA.cm_unsymmA.Attributes.unit             = "Non dimensional";
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointA.MdistrFullA.value                      = MdistrFullA;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointA.MdistrFullA.Attributes.unit            = "N";
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointA.MdistrSeventyPercentA.value            = MdistrSeventyPercentA;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointA.MdistrSeventyPercentA.Attributes.unit  = "N";
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointA.TorsionFullA.value                     = TorsionFullA;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointA.TorsionFullA.Attributes.unit           = "N * m";
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointA.TorsionSeventyPercentA.value           = TorsionSeventyPercentA;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointA.TorsionSeventyPercentA.Attributes.unit = "N * m";

% STORE POINTS - POINT C
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointC.DynPressUnsymmC.value                  = DynPressUnsymmC;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointC.DynPressUnsymmC.Attributes.unit        = "N/m^2";
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointC.cm_unsymmC.value                       = cm_unsymmC;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointC.cm_unsymmC.Attributes.unit             = "Non dimensional";
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointC.MdistrFullC.value                      = MdistrFullC;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointC.MdistrFullC.Attributes.unit            = "N";
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointC.MdistrSeventyPercentC.value            = MdistrSeventyPercentC;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointC.MdistrSeventyPercentC.Attributes.unit  = "N";
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointC.TorsionFullC.value                     = TorsionFullC;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointC.TorsionFullC.Attributes.unit           = "N * m";
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointC.TorsionSeventyPercentC.value           = TorsionSeventyPercentC;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointC.TorsionSeventyPercentC.Attributes.unit = "N * m";

% STORE POINTS - POINT D
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointD.DynPressUnsymmD.value                  = DynPressUnsymmD;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointD.DynPressUnsymmD.Attributes.unit        = "N/m^2";
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointD.cm_unsymmD.value                       = cm_unsymmD;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointD.cm_unsymmD.Attributes.unit             = "Non dimensional";
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointD.MdistrFullD.value                      = MdistrFullD;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointD.MdistrFullD.Attributes.unit            = "N";
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointD.MdistrSeventyPercentD.value            = MdistrSeventyPercentD;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointD.MdistrSeventyPercentD.Attributes.unit  = "N";
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointD.TorsionFullD.value                     = TorsionFullD;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointD.TorsionFullD.Attributes.unit           = "N * m";
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointD.TorsionSeventyPercentD.value           = TorsionSeventyPercentD;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointD.TorsionSeventyPercentD.Attributes.unit = "N * m";