(* Sea Organ parametric acoustic/environmental model.
   All numeric physical inputs are estimates pending measurement, not fabrication authority. *)

ClearAll["Global`*"];

seaOrganMetadata = <|
   "instrument" -> "Sea Organ",
   "packet" -> "V5 L1 concept packet",
   "modelName" -> "Parametric wave-air / pipe-resonance relationship model",
   "authority" -> "reference_only",
   "measurementStatus" -> "all physical inputs are estimates pending site and acoustic measurement"
   |>;

speedOfSoundInterceptEstimate = 331.3; (* estimate — pending measurement, not fabrication authority *)
kelvinOffsetEstimate = 273.15; (* estimate — pending measurement, not fabrication authority *)
airTemperatureEstimate = 15; (* estimate — pending measurement, not fabrication authority *)
airTemperatureMinEstimate = 0; (* estimate — pending measurement, not fabrication authority *)
airTemperatureMaxEstimate = 35; (* estimate — pending measurement, not fabrication authority *)
waterDensityEstimate = 1025; (* estimate — pending measurement, not fabrication authority *)
airDensityEstimate = 1.225; (* estimate — pending measurement, not fabrication authority *)
gravityEstimate = 9.81; (* estimate — pending measurement, not fabrication authority *)
waveHeightEstimate = 0.3; (* estimate — pending measurement, not fabrication authority *)
waveHeightMinEstimate = 0.02; (* estimate — pending measurement, not fabrication authority *)
waveHeightMaxEstimate = 1.5; (* estimate — pending measurement, not fabrication authority *)
wavePeriodEstimate = 4; (* estimate — pending measurement, not fabrication authority *)
wavePeriodMinEstimate = 1; (* estimate — pending measurement, not fabrication authority *)
wavePeriodMaxEstimate = 12; (* estimate — pending measurement, not fabrication authority *)
captureAreaEstimate = 0.08; (* estimate — pending measurement, not fabrication authority *)
captureAreaMinEstimate = 0.005; (* estimate — pending measurement, not fabrication authority *)
captureAreaMaxEstimate = 0.5; (* estimate — pending measurement, not fabrication authority *)
ductDiameterEstimate = 0.04; (* estimate — pending measurement, not fabrication authority *)
ductDiameterMinEstimate = 0.01; (* estimate — pending measurement, not fabrication authority *)
ductDiameterMaxEstimate = 0.15; (* estimate — pending measurement, not fabrication authority *)
ductDischargeCoefficientEstimate = 0.6; (* estimate — pending measurement, not fabrication authority *)
pipeLengthEstimate = 1.2; (* estimate — pending measurement, not fabrication authority *)
pipeLengthMinEstimate = 0.2; (* estimate — pending measurement, not fabrication authority *)
pipeLengthMaxEstimate = 5; (* estimate — pending measurement, not fabrication authority *)
pipeRadiusEstimate = 0.035; (* estimate — pending measurement, not fabrication authority *)
pipeRadiusMinEstimate = 0.005; (* estimate — pending measurement, not fabrication authority *)
pipeRadiusMaxEstimate = 0.12; (* estimate — pending measurement, not fabrication authority *)
endCorrectionCoefficientEstimate = 0.6; (* estimate — pending measurement, not fabrication authority *)
chamberVolumeEstimate = 0.12; (* estimate — pending measurement, not fabrication authority *)
chamberVolumeMinEstimate = 0.01; (* estimate — pending measurement, not fabrication authority *)
chamberVolumeMaxEstimate = 2; (* estimate — pending measurement, not fabrication authority *)
modeIndexEstimate = 1; (* estimate — pending measurement, not fabrication authority *)
modeIndexMinEstimate = 1; (* estimate — pending measurement, not fabrication authority *)
modeIndexMaxEstimate = 5; (* estimate — pending measurement, not fabrication authority *)

speedOfSoundAir[temperatureC_] :=
  speedOfSoundInterceptEstimate Sqrt[1 + temperatureC/kelvinOffsetEstimate];

circleArea[diameterM_] := Pi (diameterM/2)^2;

hydrostaticWavePressure[fluidDensityKgM3_, gravityMS2_, waveHeightM_] :=
  fluidDensityKgM3 gravityMS2 waveHeightM;

waveDisplacedVolume[captureAreaM2_, waveHeightM_] :=
  captureAreaM2 waveHeightM;

waveDisplacedAirflow[captureAreaM2_, waveHeightM_, wavePeriodS_] :=
  waveDisplacedVolume[captureAreaM2, waveHeightM]/(wavePeriodS/2);

orificeAirflow[ductDiameterM_, pressurePa_, dischargeCoefficient_, airDensityKgM3_] :=
  dischargeCoefficient circleArea[ductDiameterM] Sqrt[2 pressurePa/airDensityKgM3];

openOpenEffectiveLength[pipeLengthM_, pipeRadiusM_, endCorrectionCoefficient_] :=
  pipeLengthM + 2 endCorrectionCoefficient pipeRadiusM;

closedOpenEffectiveLength[pipeLengthM_, pipeRadiusM_, endCorrectionCoefficient_] :=
  pipeLengthM + endCorrectionCoefficient pipeRadiusM;

openOpenPipeFrequency[modeIndex_, soundSpeedMS_, pipeLengthM_, pipeRadiusM_,
   endCorrectionCoefficient_] :=
  modeIndex soundSpeedMS/(2 openOpenEffectiveLength[pipeLengthM, pipeRadiusM,
      endCorrectionCoefficient]);

closedOpenPipeFrequency[modeIndex_, soundSpeedMS_, pipeLengthM_, pipeRadiusM_,
   endCorrectionCoefficient_] :=
  ((2 modeIndex - 1) soundSpeedMS)/(4 closedOpenEffectiveLength[pipeLengthM,
      pipeRadiusM, endCorrectionCoefficient]);

chamberAirExchangeRate[airflowM3S_, chamberVolumeM3_] :=
  airflowM3S/chamberVolumeM3;

seaOrganSnapshot[airTemperatureC_, waveHeightM_, wavePeriodS_, captureAreaM2_,
   ductDiameterM_, pipeLengthM_, pipeRadiusM_, chamberVolumeM3_, modeIndex_] :=
 Module[{soundSpeed, pressure, displacedFlow, orificeFlow, governingFlow,
   openOpenFrequency, closedOpenFrequency, exchangeRate},
  soundSpeed = speedOfSoundAir[airTemperatureC];
  pressure = hydrostaticWavePressure[waterDensityEstimate, gravityEstimate, waveHeightM];
  displacedFlow = waveDisplacedAirflow[captureAreaM2, waveHeightM, wavePeriodS];
  orificeFlow = orificeAirflow[ductDiameterM, pressure, ductDischargeCoefficientEstimate,
    airDensityEstimate];
  governingFlow = Min[displacedFlow, orificeFlow];
  openOpenFrequency = openOpenPipeFrequency[modeIndex, soundSpeed, pipeLengthM,
    pipeRadiusM, endCorrectionCoefficientEstimate];
  closedOpenFrequency = closedOpenPipeFrequency[modeIndex, soundSpeed, pipeLengthM,
    pipeRadiusM, endCorrectionCoefficientEstimate];
  exchangeRate = chamberAirExchangeRate[governingFlow, chamberVolumeM3];
  <|
   "wavePressure_Pa" -> pressure,
   "waveDisplacedAirflow_m3_per_s" -> displacedFlow,
   "ductLimitedAirflow_m3_per_s" -> orificeFlow,
   "relationshipAirflow_m3_per_s" -> governingFlow,
   "airExchangeRate_per_s" -> exchangeRate,
   "openOpenPipeFrequency_Hz" -> openOpenFrequency,
   "closedOpenPipeFrequency_Hz" -> closedOpenFrequency,
   "airflowToOpenOpenRatio" -> governingFlow/openOpenFrequency,
   "airflowToClosedOpenRatio" -> governingFlow/closedOpenFrequency
   |>
  ];

seaOrganModelSummary =
  seaOrganSnapshot[airTemperatureEstimate, waveHeightEstimate, wavePeriodEstimate,
   captureAreaEstimate, ductDiameterEstimate, pipeLengthEstimate, pipeRadiusEstimate,
   chamberVolumeEstimate, modeIndexEstimate];

Manipulate[
 Module[{snapshot = seaOrganSnapshot[airTemperatureC, waveHeightM, wavePeriodS,
     captureAreaM2, ductDiameterM, pipeLengthM, pipeRadiusM, chamberVolumeM3,
     modeIndex]},
  Grid[
   {
    {"Sea Organ model authority", seaOrganMetadata["authority"]},
    {"Wave pressure estimate (Pa)", NumberForm[snapshot["wavePressure_Pa"], {9, 2}]},
    {"Wave-displaced airflow (m^3/s)",
     ScientificForm[snapshot["waveDisplacedAirflow_m3_per_s"], 4]},
    {"Duct-limited airflow (m^3/s)",
     ScientificForm[snapshot["ductLimitedAirflow_m3_per_s"], 4]},
    {"Relationship airflow (m^3/s)",
     ScientificForm[snapshot["relationshipAirflow_m3_per_s"], 4]},
    {"Chamber air exchange rate (1/s)",
     NumberForm[snapshot["airExchangeRate_per_s"], {8, 3}]},
    {"Open-open pipe frequency (Hz)",
     NumberForm[snapshot["openOpenPipeFrequency_Hz"], {8, 2}]},
    {"Closed-open pipe frequency (Hz)",
     NumberForm[snapshot["closedOpenPipeFrequency_Hz"], {8, 2}]},
    {"Airflow/open-open ratio",
     ScientificForm[snapshot["airflowToOpenOpenRatio"], 4]},
    {"Airflow/closed-open ratio",
     ScientificForm[snapshot["airflowToClosedOpenRatio"], 4]}
    },
   Alignment -> Left
   ]
  ],
 {{airTemperatureC, airTemperatureEstimate, "air temperature (C)"}, airTemperatureMinEstimate,
  airTemperatureMaxEstimate},
 {{waveHeightM, waveHeightEstimate, "wave height proxy (m)"}, waveHeightMinEstimate,
  waveHeightMaxEstimate},
 {{wavePeriodS, wavePeriodEstimate, "wave period proxy (s)"}, wavePeriodMinEstimate,
  wavePeriodMaxEstimate},
 {{captureAreaM2, captureAreaEstimate, "capture area proxy (m^2)"}, captureAreaMinEstimate,
  captureAreaMaxEstimate},
 {{ductDiameterM, ductDiameterEstimate, "duct diameter proxy (m)"}, ductDiameterMinEstimate,
  ductDiameterMaxEstimate},
 {{pipeLengthM, pipeLengthEstimate, "pipe length proxy (m)"}, pipeLengthMinEstimate,
  pipeLengthMaxEstimate},
 {{pipeRadiusM, pipeRadiusEstimate, "pipe radius proxy (m)"}, pipeRadiusMinEstimate,
  pipeRadiusMaxEstimate},
 {{chamberVolumeM3, chamberVolumeEstimate, "chamber volume proxy (m^3)"},
  chamberVolumeMinEstimate, chamberVolumeMaxEstimate},
 {{modeIndex, modeIndexEstimate, "pipe mode index"}, modeIndexMinEstimate,
  modeIndexMaxEstimate, 1},
 ControlPlacement -> Left,
 SaveDefinitions -> True
 ]
