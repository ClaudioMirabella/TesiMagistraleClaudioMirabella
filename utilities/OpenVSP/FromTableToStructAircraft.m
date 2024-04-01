%% OPENVsp Aero Analysis Output into AIRCRAFT DATA STRUCTURE
% In this script we use the Open VSP output to obtain the lift and drag
% coefficient distribution along the main wing span, in correspondence to a
% resultant lift coefficient equal to one.

%integral coefficients
Aircraft.OpenVSP.output.CL.value              = res.CL;
Aircraft.OpenVSP.output.CL.Attributes.unit    = "Non dimensional";
Aircraft.OpenVSP.output.CDo.value             = res.CDo;
Aircraft.OpenVSP.output.CDo.Attributes.unit   = "Non dimensional";
Aircraft.OpenVSP.output.CDi.value             = res.CDi;
Aircraft.OpenVSP.output.CDi.Attributes.unit   = "Non dimensional";
Aircraft.OpenVSP.output.CDtot.value           = res.CDtot;
Aircraft.OpenVSP.output.CDtot.Attributes.unit = "Non dimensional";
Aircraft.OpenVSP.output.CS.value              = res.CS;
Aircraft.OpenVSP.output.CS.Attributes.unit    = "Non dimensional";
Aircraft.OpenVSP.output.E.value               = res.E;
Aircraft.OpenVSP.output.E.Attributes.unit     = "Non dimensional";
Aircraft.OpenVSP.output.e.value               = res.e;
Aircraft.OpenVSP.output.e.Attributes.unit     = "Non dimensional";
Aircraft.OpenVSP.output.CFx.value             = res.CFx;
Aircraft.OpenVSP.output.CFx.Attributes.unit   = "Non dimensional";
Aircraft.OpenVSP.output.CFy.value             = res.CFy;
Aircraft.OpenVSP.output.CFy.Attributes.unit   = "Non dimensional";
Aircraft.OpenVSP.output.CFz.value             = res.CFz;
Aircraft.OpenVSP.output.CFz.Attributes.unit   = "Non dimensional";
Aircraft.OpenVSP.output.CMx.value             = res.CMx;
Aircraft.OpenVSP.output.CMx.Attributes.unit   = "Non dimensional";
Aircraft.OpenVSP.output.CMy.value             = res.CMy;
Aircraft.OpenVSP.output.CMy.Attributes.unit   = "Non dimensional";
Aircraft.OpenVSP.output.CMz.value             = res.CMz;
Aircraft.OpenVSP.output.CMz.Attributes.unit   = "Non dimensional";
Aircraft.OpenVSP.output.CMl.value             = res.CMl;
Aircraft.OpenVSP.output.CMl.Attributes.unit   = "Non dimensional";
Aircraft.OpenVSP.output.CMm.value             = res.CMm;
Aircraft.OpenVSP.output.CMm.Attributes.unit   = "Non dimensional";
Aircraft.OpenVSP.output.CMn.value             = res.CMn;
Aircraft.OpenVSP.output.CMn.Attributes.unit   = "Non dimensional";
% 
%loads
Aircraft.OpenVSP.output.Yavg.value           = res.Yavg';
Aircraft.OpenVSP.output.Yavg.Attributes.unit = "m";
Aircraft.OpenVSP.output.Cl.value             = res.Cl';
Aircraft.OpenVSP.output.Cl.Attributes.unit   = "Non dimensional";
Aircraft.OpenVSP.output.Cd.value             = res.Cd';
Aircraft.OpenVSP.output.Cd.Attributes.unit   = "Non dimensional";
Aircraft.OpenVSP.output.Cmy.value            = res.Cmy';
Aircraft.OpenVSP.output.Cmy.Attributes.unit  = "Non dimensional";

% Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.OpenVSP.CL.value    = res.CL;
% Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.OpenVSP.CDo.value   = res.CDo;
% Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.OpenVSP.CDi.value   = res.CDi;
% Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.OpenVSP.CDtot.value = res.CDtot;
% Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.OpenVSP.CS.value    = res.CS;
% Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.OpenVSP.E.value     = res.E;
% Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.OpenVSP.e.value     = res.e;
% Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.OpenVSP.CFx.value   = res.CFx;
% Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.OpenVSP.CFy.value   = res.CFy;
% Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.OpenVSP.CFz.value   = res.CFz;
% Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.OpenVSP.CMx.value   = res.CMx;
% Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.OpenVSP.CMy.value   = res.CMy;
% Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.OpenVSP.CMz.value   = res.CMz;
% Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.OpenVSP.CMl.value   = res.CMl;
% Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.OpenVSP.CMm.value   = res.CMm;
% Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.OpenVSP.CMn.value   = res.CMn;
% 
% %loads
% Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.OpenVSP.Yavg.value    = res.Yavg;
% Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.OpenVSP.Cl.value      = res.Cl;
% Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.OpenVSP.Cd.value      = res.Cd;
% Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.OpenVSP.Cmy.value     = res.Cmy;



