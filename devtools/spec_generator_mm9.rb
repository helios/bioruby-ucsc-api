#!/usr/bin/env ruby
# Mouse mm9 spec generator

SPEC_FILE = "../spec/mm9_spec.rb"
KLASS = "Bio::Ucsc::Mm9"

TABLES = %w(
NIAGene
acembly
acemblyClass
acemblyPep
affyAllExonProbes
affyExonTissues
affyExonTissuesGs
affyExonTissuesGsExps
affyExonTissuesGsMedian
affyExonTissuesGsMedianDist
affyExonTissuesGsMedianExps
affyGnf1m
affyGnfU74A
affyGnfU74ADistance
affyGnfU74B
affyGnfU74BDistance
affyGnfU74C
affyGnfU74CDistance
affyMOE430
affyU74
agilentCgh105a
agilentCgh1x1m
agilentCgh244a
agilentCgh4x180k
allMm9RS_BW
all_bacends
all_est
all_mrna
all_sts_primer
allenBrainAli
allenBrainUrl
author
bacEndPairs
#bamMmsNumtSSorted#SAM_format
bioCycMapDesc
bioCycPathway
blastHg18KG
ccdsGene
ccdsInfo
ccdsKgMap
ccdsNotes
cds
ceBlastTab
cell
cgapAlias
cgapBiocDesc
cgapBiocPathway
chainAilMel1
chainAilMel1Link
chainAnoCar1
chainAnoCar1Link
chainBosTau4
chainBosTau4Link
chainBraFlo1
chainBraFlo1Link
chainCalJac3
chainCalJac3Link
chainCanFam2
chainCanFam2Link
chainCavPor3
chainCavPor3Link
chainDanRer7
chainDanRer7Link
chainEquCab2
chainEquCab2Link
chainFelCat4
chainFelCat4Link
chainFr2
chainFr2Link
chainGalGal3
chainGalGal3Link
chainGasAcu1
chainGasAcu1Link
chainHg19
chainHg19Link
chainLoxAfr3
chainLoxAfr3Link
chainMonDom5
chainMonDom5Link
chainOrnAna1
chainOrnAna1Link
chainOryCun2
chainOryCun2Link
chainOryLat2
chainOryLat2Link
chainOviAri1
chainOviAri1Link
chainPanTro2
chainPanTro2Link
chainPanTro3
chainPanTro3Link
chainPetMar1
chainPetMar1Link
chainPonAbe2
chainPonAbe2Link
chainRheMac2
chainRheMac2Link
chainRn4
chainRn4Link
chainSusScr2
chainSusScr2Link
chainTetNig2
chainTetNig2Link
chainXenTro2
chainXenTro2Link
chromInfo
cpgIslandExt
crgMapabilityAlign100mer
crgMapabilityAlign36mer
crgMapabilityAlign40mer
crgMapabilityAlign50mer
crgMapabilityAlign75mer
ctgPos
cytoBand
cytoBandIdeo
description
development
dmBlastTab
drBlastTab
ensGene
ensGtp
ensPep
est
estOrientInfo
exoniphy
extFile
foldUtr3
foldUtr5
gap
gbCdnaInfo
gbExtFile
gbLoaded
gbMiscDiff
gbSeq
gbStatus
gbWarn
gc5Base
geneName
geneNetworkId
geneid
geneidPep
genomicSuperDups
genscan
genscanPep
genscanSubopt
gnfAtlas2
gnfAtlas2Distance
gold
grp
hgBlastTab
hgFindSpec
history
igtc
ikmc
ikmcExtra
imageClone
intronEst
jaxAllele
jaxAlleleInfo
jaxAllelePheno
jaxGeneTrap
jaxGeneTrapInfo
jaxPhenotype
jaxPhenotypeAlias
jaxQtl
jaxRepTranscript
jaxRepTranscriptAlias
keggMapDesc
keggPathway
keyword
kg4ToKg5
kgAlias
kgColor
kgProtAlias
kgProtMap2
kgSpAlias
kgTargetAli
kgTxInfo
kgXref
kgXrefOld4
knownAlt
knownBlastTab
knownCanonical
knownGene
knownGeneMrna
knownGeneOld4
knownGenePep
knownIsoforms
knownToAllenBrain
knownToEnsembl
knownToGnf1m
knownToGnfAtlas2
knownToKeggEntrez
knownToLocusLink
knownToMOE430
knownToMOE430A
knownToPfam
knownToRefSeq
knownToSuper
knownToU74
knownToVisiGene
laminB1_AC
laminB1_EF
laminB1_ES
laminB1_NP
library
metaDb
mgcFullMrna
mgcGenes
miRNA
microsat
mrna
mrnaClone
mrnaOrientInfo
multiz30way
multiz30wayFrames
multiz30waySummary
ncbiIncidentDb
netAilMel1
netAnoCar1
netBosTau4
netBraFlo1
netCalJac3
netCanFam2
netCavPor3
netDanRer7
netEquCab2
netFelCat4
netFr2
netGalGal3
netGasAcu1
netHg19
netLoxAfr3
netMonDom5
netOrnAna1
netOryCun2
netOryLat2
netOviAri1
netPanTro2
netPanTro3
netPetMar1
netPonAbe2
netRheMac2
netRn4
netSusScr2
netTetNig2
netXenTro2
nscanGene
nscanPep
numtS
numtSAssembled
numtSMitochondrion
oreganno
oregannoAttr
oregannoLink
organism
pbAnomLimit
pbResAvgStd
pbStamp
pepCCntDist
pepExonCntDist
pepHydroDist
pepIPCntDist
pepMolWtDist
pepMwAa
pepPi
pepPiDist
pepResDist
pfamDesc
phastCons30way
phastCons30wayEuarch
phastCons30wayPlacental
phastConsElements30way
phastConsElements30wayEuarch
phastConsElements30wayPlacental
phyloP30wayAll
phyloP30wayEuarch
phyloP30wayPlacental
productName
refFlat
refGene
refLink
refSeqAli
refSeqStatus
refSeqSummary
rest
rmsk
rnBlastTab
scBlastTab
scopDesc
seq
sex
sgpGene
sibTxGraph
simpleRepeat
snp128
snp128ExceptionDesc
snp128Exceptions
snp128Seq
source
spMrna
stsAlias
stsInfoMouseNew
stsMapMouseNew
tRNAs
tableDescriptions
targetScanS
tissue
trackDb
transMapAlnMRna
transMapAlnRefSeq
transMapAlnSplicedEst
transMapAlnUcscGenes
transMapInfoMRna
transMapInfoRefSeq
transMapInfoSplicedEst
transMapInfoUcscGenes
transcriptome
ucscPfam
ucscScop
vegaGene
vegaGtp
vegaPep
vegaPseudoGene
vgAllProbes
vgProbes
wgEncodeLicrHistoneBmarrowH3k4me1MAdult8wksC57bl6StdPk
wgEncodeLicrHistoneBmarrowH3k4me1MAdult8wksC57bl6StdSig
wgEncodeLicrHistoneBmarrowH3k4me3MAdult8wksC57bl6StdPk
wgEncodeLicrHistoneBmarrowH3k4me3MAdult8wksC57bl6StdSig
wgEncodeLicrHistoneBmarrowInputMAdult8wksC57bl6StdSig
wgEncodeLicrHistoneCbellumH3k4me1MAdult8wksC57bl6StdPk
wgEncodeLicrHistoneCbellumH3k4me1MAdult8wksC57bl6StdSig
wgEncodeLicrHistoneCbellumH3k4me3MAdult8wksC57bl6StdPk
wgEncodeLicrHistoneCbellumH3k4me3MAdult8wksC57bl6StdSig
wgEncodeLicrHistoneCbellumInputMAdult8wksC57bl6StdSig
wgEncodeLicrHistoneCortexH3k4me1MAdult8wksC57bl6StdPk
wgEncodeLicrHistoneCortexH3k4me1MAdult8wksC57bl6StdSig
wgEncodeLicrHistoneCortexH3k4me3MAdult8wksC57bl6StdPk
wgEncodeLicrHistoneCortexH3k4me3MAdult8wksC57bl6StdSig
wgEncodeLicrHistoneCortexInputMAdult8wksC57bl6StdSig
wgEncodeLicrHistoneEsb4H3k4me1ME0C57bl6StdPk
wgEncodeLicrHistoneEsb4H3k4me1ME0C57bl6StdSig
wgEncodeLicrHistoneEsb4H3k4me3ME0C57bl6StdPk
wgEncodeLicrHistoneEsb4H3k4me3ME0C57bl6StdSig
wgEncodeLicrHistoneEsb4InputME0C57bl6StdSig
wgEncodeLicrHistoneHeartH3k4me1MAdult8wksC57bl6StdPk
wgEncodeLicrHistoneHeartH3k4me1MAdult8wksC57bl6StdSig
wgEncodeLicrHistoneHeartH3k4me3MAdult8wksC57bl6StdPk
wgEncodeLicrHistoneHeartH3k4me3MAdult8wksC57bl6StdSig
wgEncodeLicrHistoneHeartInputMAdult8wksC57bl6StdSig
wgEncodeLicrHistoneKidneyH3k4me1MAdult8wksC57bl6StdPk
wgEncodeLicrHistoneKidneyH3k4me1MAdult8wksC57bl6StdSig
wgEncodeLicrHistoneKidneyH3k4me3MAdult8wksC57bl6StdPk
wgEncodeLicrHistoneKidneyH3k4me3MAdult8wksC57bl6StdSig
wgEncodeLicrHistoneKidneyInputMAdult8wksC57bl6StdSig
wgEncodeLicrHistoneLiverH3k4me1MAdult8wksC57bl6StdPk
wgEncodeLicrHistoneLiverH3k4me1MAdult8wksC57bl6StdSig
wgEncodeLicrHistoneLiverH3k4me3MAdult8wksC57bl6StdPk
wgEncodeLicrHistoneLiverH3k4me3MAdult8wksC57bl6StdSig
wgEncodeLicrHistoneLiverInputMAdult8wksC57bl6StdSig
wgEncodeLicrHistoneLungH3k4me1MAdult8wksC57bl6StdPk
wgEncodeLicrHistoneLungH3k4me1MAdult8wksC57bl6StdSig
wgEncodeLicrHistoneLungH3k4me3MAdult8wksC57bl6StdPk
wgEncodeLicrHistoneLungH3k4me3MAdult8wksC57bl6StdSig
wgEncodeLicrHistoneLungInputMAdult8wksC57bl6StdSig
wgEncodeLicrHistoneMefH3k4me1MAdult8wksC57bl6StdPk
wgEncodeLicrHistoneMefH3k4me1MAdult8wksC57bl6StdSig
wgEncodeLicrHistoneMefH3k4me3MAdult8wksC57bl6StdPk
wgEncodeLicrHistoneMefH3k4me3MAdult8wksC57bl6StdSig
wgEncodeLicrHistoneMefInputMAdult8wksC57bl6StdSig
wgEncodeLicrHistoneSpleenH3k4me1MAdult8wksC57bl6StdPk
wgEncodeLicrHistoneSpleenH3k4me1MAdult8wksC57bl6StdSig
wgEncodeLicrHistoneSpleenH3k4me3MAdult8wksC57bl6StdPk
wgEncodeLicrHistoneSpleenH3k4me3MAdult8wksC57bl6StdSig
wgEncodeLicrHistoneSpleenInputMAdult8wksC57bl6StdSig
wgEncodeLicrRnaSeqBmarrowCellPapMAdult8wksC57bl6AlnRep1
wgEncodeLicrRnaSeqBmarrowCellPapMAdult8wksC57bl6AlnRep2
wgEncodeLicrRnaSeqBmarrowCellPapMAdult8wksC57bl6SigRep1
wgEncodeLicrRnaSeqBmarrowCellPapMAdult8wksC57bl6SigRep2
wgEncodeLicrRnaSeqCbellumCellPapMAdult8wksC57bl6AlnRep1
wgEncodeLicrRnaSeqCbellumCellPapMAdult8wksC57bl6AlnRep2
wgEncodeLicrRnaSeqCbellumCellPapMAdult8wksC57bl6SigRep1
wgEncodeLicrRnaSeqCbellumCellPapMAdult8wksC57bl6SigRep2
wgEncodeLicrRnaSeqCortexCellPapMAdult8wksC57bl6AlnRep1
wgEncodeLicrRnaSeqCortexCellPapMAdult8wksC57bl6AlnRep2
wgEncodeLicrRnaSeqCortexCellPapMAdult8wksC57bl6SigRep1
wgEncodeLicrRnaSeqCortexCellPapMAdult8wksC57bl6SigRep2
wgEncodeLicrRnaSeqEsb4CellPapME0C57bl6AlnRep1
wgEncodeLicrRnaSeqEsb4CellPapME0C57bl6AlnRep2
wgEncodeLicrRnaSeqEsb4CellPapME0C57bl6SigRep1
wgEncodeLicrRnaSeqEsb4CellPapME0C57bl6SigRep2
wgEncodeLicrRnaSeqHeartCellPapMAdult8wksC57bl6AlnRep1
wgEncodeLicrRnaSeqHeartCellPapMAdult8wksC57bl6AlnRep2
wgEncodeLicrRnaSeqHeartCellPapMAdult8wksC57bl6SigRep1
wgEncodeLicrRnaSeqHeartCellPapMAdult8wksC57bl6SigRep2
wgEncodeLicrRnaSeqKidneyCellPapMAdult8wksC57bl6AlnRep1
wgEncodeLicrRnaSeqKidneyCellPapMAdult8wksC57bl6AlnRep2
wgEncodeLicrRnaSeqKidneyCellPapMAdult8wksC57bl6SigRep1
wgEncodeLicrRnaSeqKidneyCellPapMAdult8wksC57bl6SigRep2
wgEncodeLicrRnaSeqLiverCellPapMAdult8wksC57bl6AlnRep1
wgEncodeLicrRnaSeqLiverCellPapMAdult8wksC57bl6AlnRep2
wgEncodeLicrRnaSeqLiverCellPapMAdult8wksC57bl6SigRep1
wgEncodeLicrRnaSeqLiverCellPapMAdult8wksC57bl6SigRep2
wgEncodeLicrRnaSeqLungCellPapMAdult8wksC57bl6AlnRep1
wgEncodeLicrRnaSeqLungCellPapMAdult8wksC57bl6AlnRep2
wgEncodeLicrRnaSeqLungCellPapMAdult8wksC57bl6SigRep1
wgEncodeLicrRnaSeqLungCellPapMAdult8wksC57bl6SigRep2
wgEncodeLicrRnaSeqMefCellPapMAdult8wksC57bl6AlnRep1
wgEncodeLicrRnaSeqMefCellPapMAdult8wksC57bl6AlnRep2
wgEncodeLicrRnaSeqMefCellPapMAdult8wksC57bl6SigRep1
wgEncodeLicrRnaSeqMefCellPapMAdult8wksC57bl6SigRep2
wgEncodeLicrRnaSeqSpleenCellPapMAdult8wksC57bl6AlnRep1
wgEncodeLicrRnaSeqSpleenCellPapMAdult8wksC57bl6AlnRep2
wgEncodeLicrRnaSeqSpleenCellPapMAdult8wksC57bl6SigRep1
wgEncodeLicrRnaSeqSpleenCellPapMAdult8wksC57bl6SigRep2
wgEncodeLicrTfbsBmarrowCtcfMAdult8wksC57bl6StdPk
wgEncodeLicrTfbsBmarrowCtcfMAdult8wksC57bl6StdSig
wgEncodeLicrTfbsBmarrowInputMAdult8wksC57bl6StdSig
wgEncodeLicrTfbsBmarrowPol2MAdult8wksC57bl6StdPk
wgEncodeLicrTfbsBmarrowPol2MAdult8wksC57bl6StdSig
wgEncodeLicrTfbsCbellumCtcfMAdult8wksC57bl6StdPk
wgEncodeLicrTfbsCbellumCtcfMAdult8wksC57bl6StdSig
wgEncodeLicrTfbsCbellumInputMAdult8wksC57bl6StdSig
wgEncodeLicrTfbsCbellumPol2MAdult8wksC57bl6StdPk
wgEncodeLicrTfbsCbellumPol2MAdult8wksC57bl6StdSig
wgEncodeLicrTfbsCortexCtcfMAdult8wksC57bl6StdPk
wgEncodeLicrTfbsCortexCtcfMAdult8wksC57bl6StdSig
wgEncodeLicrTfbsCortexInputMAdult8wksC57bl6StdSig
wgEncodeLicrTfbsCortexPol2MAdult8wksC57bl6StdPk
wgEncodeLicrTfbsCortexPol2MAdult8wksC57bl6StdSig
wgEncodeLicrTfbsEsb4CtcfME0C57bl6StdPk
wgEncodeLicrTfbsEsb4CtcfME0C57bl6StdSig
wgEncodeLicrTfbsEsb4InputME0C57bl6StdSig
wgEncodeLicrTfbsEsb4P300ME0C57bl6StdPk
wgEncodeLicrTfbsEsb4P300ME0C57bl6StdSig
wgEncodeLicrTfbsEsb4Pol2ME0C57bl6StdPk
wgEncodeLicrTfbsEsb4Pol2ME0C57bl6StdSig
wgEncodeLicrTfbsHeartCtcfMAdult8wksC57bl6StdPk
wgEncodeLicrTfbsHeartCtcfMAdult8wksC57bl6StdSig
wgEncodeLicrTfbsHeartInputMAdult8wksC57bl6StdSig
wgEncodeLicrTfbsHeartP300MAdult8wksC57bl6StdPk
wgEncodeLicrTfbsHeartP300MAdult8wksC57bl6StdSig
wgEncodeLicrTfbsHeartPol2MAdult8wksC57bl6StdPk
wgEncodeLicrTfbsHeartPol2MAdult8wksC57bl6StdSig
wgEncodeLicrTfbsKidneyCtcfMAdult8wksC57bl6StdPk
wgEncodeLicrTfbsKidneyCtcfMAdult8wksC57bl6StdSig
wgEncodeLicrTfbsKidneyInputMAdult8wksC57bl6StdSig
wgEncodeLicrTfbsKidneyPol2MAdult8wksC57bl6StdPk
wgEncodeLicrTfbsKidneyPol2MAdult8wksC57bl6StdSig
wgEncodeLicrTfbsLiverCtcfMAdult8wksC57bl6StdPk
wgEncodeLicrTfbsLiverCtcfMAdult8wksC57bl6StdSig
wgEncodeLicrTfbsLiverInputMAdult8wksC57bl6StdSig
wgEncodeLicrTfbsLiverPol2MAdult8wksC57bl6StdPk
wgEncodeLicrTfbsLiverPol2MAdult8wksC57bl6StdSig
wgEncodeLicrTfbsLungCtcfMAdult8wksC57bl6StdPk
wgEncodeLicrTfbsLungCtcfMAdult8wksC57bl6StdSig
wgEncodeLicrTfbsLungInputMAdult8wksC57bl6StdSig
wgEncodeLicrTfbsLungPol2MAdult8wksC57bl6StdPk
wgEncodeLicrTfbsLungPol2MAdult8wksC57bl6StdSig
wgEncodeLicrTfbsMefCtcfMAdult8wksC57bl6StdPk
wgEncodeLicrTfbsMefCtcfMAdult8wksC57bl6StdSig
wgEncodeLicrTfbsMefInputMAdult8wksC57bl6StdSig
wgEncodeLicrTfbsMefPol2MAdult8wksC57bl6StdPk
wgEncodeLicrTfbsMefPol2MAdult8wksC57bl6StdSig
wgEncodeLicrTfbsSpleenCtcfMAdult8wksC57bl6StdPk
wgEncodeLicrTfbsSpleenCtcfMAdult8wksC57bl6StdSig
wgEncodeLicrTfbsSpleenInputMAdult8wksC57bl6StdSig
wgEncodeLicrTfbsSpleenPol2MAdult8wksC57bl6StdPk
wgEncodeLicrTfbsSpleenPol2MAdult8wksC57bl6StdSig
wgEncodeNhgriBip
wgEncodeSydhHistCh12H3k4me3IggyalePk
wgEncodeSydhHistCh12H3k4me3IggyaleSig
wgEncodeSydhHistCh12InputIggyaleSig
wgEncodeSydhHistMelH3k04me3Dm2p5dIggyalePk
wgEncodeSydhHistMelH3k04me3Dm2p5dIggyaleSig
wgEncodeSydhHistMelH3k04me3IggyalePk
wgEncodeSydhHistMelH3k4me3IggyaleSig
wgEncodeSydhHistMelInputDm2p5dIggyaleSig
wgEncodeSydhHistMelInputIggyaleSig
wgEncodeSydhTfbsMelCmybh141IggrabPk
wgEncodeSydhTfbsMelCmybh141IggrabSig
wgEncodeSydhTfbsMelCtcfDmso20IggyalePk
wgEncodeSydhTfbsMelCtcfDmso20IggyaleSig
wgEncodeSydhTfbsMelInputDmso20IggyaleSig
wgEncodeSydhTfbsMelMaxIggrabPk
wgEncodeSydhTfbsMelMaxIggrabSig
wgEncodeSydhTfbsMelNelfeIggrabPk
wgEncodeSydhTfbsMelNelfeIggrabSig
wgEncodeSydhTfbsMelP300IggrabPk
wgEncodeSydhTfbsMelP300IggrabSig
wgEncodeSydhTfbsMelRad21Dmso20IggrabPk
wgEncodeSydhTfbsMelRad21Dmso20IggrabSig
wgEncodeSydhTfbsMelRad21IggrabPk
wgEncodeSydhTfbsMelRad21IggrabSig
wgEncodeSydhTfbsMelUsf2IggmusPk
wgEncodeSydhTfbsMelUsf2IggmusSig
wgEncodeUwDnase3134RiiiMImmortalHotspotsRep1
wgEncodeUwDnase3134RiiiMImmortalHotspotsRep2
wgEncodeUwDnase3134RiiiMImmortalPkRep1
wgEncodeUwDnase3134RiiiMImmortalPkRep2
wgEncodeUwDnase3134RiiiMImmortalSigRep1
wgEncodeUwDnase3134RiiiMImmortalSigRep2
wgEncodeUwDnase416bC57bl6MAdult8wksHotspotsRep1
wgEncodeUwDnase416bC57bl6MAdult8wksHotspotsRep2
wgEncodeUwDnase416bC57bl6MAdult8wksPkRep1
wgEncodeUwDnase416bC57bl6MAdult8wksPkRep2
wgEncodeUwDnase416bC57bl6MAdult8wksSigRep1
wgEncodeUwDnase416bC57bl6MAdult8wksSigRep2
wgEncodeUwDnaseA20BalbcannMAdult8wksHotspotsRep1
wgEncodeUwDnaseA20BalbcannMAdult8wksHotspotsRep2
wgEncodeUwDnaseA20BalbcannMAdult8wksPkRep1
wgEncodeUwDnaseA20BalbcannMAdult8wksPkRep2
wgEncodeUwDnaseA20BalbcannMAdult8wksSigRep1
wgEncodeUwDnaseA20BalbcannMAdult8wksSigRep2
wgEncodeUwDnaseBcellcd19pC57bl6MAdult8wksHotspotsRep1
wgEncodeUwDnaseBcellcd19pC57bl6MAdult8wksHotspotsRep2
wgEncodeUwDnaseBcellcd19pC57bl6MAdult8wksPkRep1
wgEncodeUwDnaseBcellcd19pC57bl6MAdult8wksPkRep2
wgEncodeUwDnaseBcellcd19pC57bl6MAdult8wksSigRep1
wgEncodeUwDnaseBcellcd19pC57bl6MAdult8wksSigRep2
wgEncodeUwDnaseBcellcd43nC57bl6MAdult8wksHotspotsRep1
wgEncodeUwDnaseBcellcd43nC57bl6MAdult8wksHotspotsRep2
wgEncodeUwDnaseBcellcd43nC57bl6MAdult8wksPkRep1
wgEncodeUwDnaseBcellcd43nC57bl6MAdult8wksPkRep2
wgEncodeUwDnaseBcellcd43nC57bl6MAdult8wksSigRep1
wgEncodeUwDnaseBcellcd43nC57bl6MAdult8wksSigRep2
wgEncodeUwDnaseCbellumC57bl6MAdult8wksHotspotsRep2
wgEncodeUwDnaseCbellumC57bl6MAdult8wksPkRep2
wgEncodeUwDnaseCbellumC57bl6MAdult8wksSigRep2
wgEncodeUwDnaseCerebellumC57bl6MAdult8wksHotspotsRep1
wgEncodeUwDnaseCerebellumC57bl6MAdult8wksPkRep1
wgEncodeUwDnaseCerebellumC57bl6MAdult8wksSigRep1
wgEncodeUwDnaseCerebrumC57bl6MAdult8wksHotspotsRep1
wgEncodeUwDnaseCerebrumC57bl6MAdult8wksHotspotsRep2
wgEncodeUwDnaseCerebrumC57bl6MAdult8wksPkRep1
wgEncodeUwDnaseCerebrumC57bl6MAdult8wksPkRep2
wgEncodeUwDnaseCerebrumC57bl6MAdult8wksSigRep1
wgEncodeUwDnaseCerebrumC57bl6MAdult8wksSigRep2
wgEncodeUwDnaseEscj7S129ME0HotspotsRep1
wgEncodeUwDnaseEscj7S129ME0HotspotsRep2
wgEncodeUwDnaseEscj7S129ME0PkRep1
wgEncodeUwDnaseEscj7S129ME0PkRep2
wgEncodeUwDnaseEscj7S129ME0SigRep1
wgEncodeUwDnaseEscj7S129ME0SigRep2
wgEncodeUwDnaseFatC57bl6MAdult8wksHotspotsRep1
wgEncodeUwDnaseFatC57bl6MAdult8wksHotspotsRep2
wgEncodeUwDnaseFatC57bl6MAdult8wksPkRep1
wgEncodeUwDnaseFatC57bl6MAdult8wksPkRep2
wgEncodeUwDnaseFatC57bl6MAdult8wksSigRep1
wgEncodeUwDnaseFatC57bl6MAdult8wksSigRep2
wgEncodeUwDnaseFibroblastC57bl6MAdult8wksHotspotsRep1
wgEncodeUwDnaseFibroblastC57bl6MAdult8wksHotspotsRep2
wgEncodeUwDnaseFibroblastC57bl6MAdult8wksPkRep1
wgEncodeUwDnaseFibroblastC57bl6MAdult8wksPkRep2
wgEncodeUwDnaseFibroblastC57bl6MAdult8wksSigRep1
wgEncodeUwDnaseFibroblastC57bl6MAdult8wksSigRep2
wgEncodeUwDnaseKidneyC57bl6MAdult8wksHotspotsRep1
wgEncodeUwDnaseKidneyC57bl6MAdult8wksHotspotsRep2
wgEncodeUwDnaseKidneyC57bl6MAdult8wksPkRep1
wgEncodeUwDnaseKidneyC57bl6MAdult8wksPkRep2
wgEncodeUwDnaseKidneyC57bl6MAdult8wksSigRep1
wgEncodeUwDnaseKidneyC57bl6MAdult8wksSigRep2
wgEncodeUwDnaseLiverC57bl6MAdult8wksHotspotsRep1
wgEncodeUwDnaseLiverC57bl6MAdult8wksHotspotsRep2
wgEncodeUwDnaseLiverC57bl6MAdult8wksPkRep1
wgEncodeUwDnaseLiverC57bl6MAdult8wksPkRep2
wgEncodeUwDnaseLiverC57bl6MAdult8wksSigRep1
wgEncodeUwDnaseLiverC57bl6MAdult8wksSigRep2
wgEncodeUwDnaseLungC57bl6MAdult8wksHotspotsRep1
wgEncodeUwDnaseLungC57bl6MAdult8wksHotspotsRep2
wgEncodeUwDnaseLungC57bl6MAdult8wksPkRep1
wgEncodeUwDnaseLungC57bl6MAdult8wksPkRep2
wgEncodeUwDnaseLungC57bl6MAdult8wksSigRep1
wgEncodeUwDnaseLungC57bl6MAdult8wksSigRep2
wgEncodeUwDnaseMelC57bl6MAdult8wksHotspotsRep1
wgEncodeUwDnaseMelC57bl6MAdult8wksHotspotsRep2
wgEncodeUwDnaseMelC57bl6MAdult8wksPkRep1
wgEncodeUwDnaseMelC57bl6MAdult8wksPkRep2
wgEncodeUwDnaseMelC57bl6MAdult8wksSigRep1
wgEncodeUwDnaseMelC57bl6MAdult8wksSigRep2
wgEncodeUwDnasePatskiSpbl6MImmortalHotspotsRep1
wgEncodeUwDnasePatskiSpbl6MImmortalHotspotsRep2
wgEncodeUwDnasePatskiSpbl6MImmortalPkRep1
wgEncodeUwDnasePatskiSpbl6MImmortalPkRep2
wgEncodeUwDnasePatskiSpbl6MImmortalSigRep1
wgEncodeUwDnasePatskiSpbl6MImmortalSigRep2
wgEncodeUwDnaseTnaiveC57bl6MAdult8wksHotspotsRep1
wgEncodeUwDnaseTnaiveC57bl6MAdult8wksHotspotsRep2
wgEncodeUwDnaseTnaiveC57bl6MAdult8wksPkRep1
wgEncodeUwDnaseTnaiveC57bl6MAdult8wksPkRep2
wgEncodeUwDnaseTnaiveC57bl6MAdult8wksSigRep1
wgEncodeUwDnaseTnaiveC57bl6MAdult8wksSigRep2
wgEncodeUwDnaseWholebrainC57bl6MAdult8wksHotspotsRep1
wgEncodeUwDnaseWholebrainC57bl6MAdult8wksHotspotsRep2
wgEncodeUwDnaseWholebrainC57bl6MAdult8wksPkRep1
wgEncodeUwDnaseWholebrainC57bl6MAdult8wksPkRep2
wgEncodeUwDnaseWholebrainC57bl6MAdult8wksSigRep1
wgEncodeUwDnaseWholebrainC57bl6MAdult8wksSigRep2
wgEncodeUwDnaseWholebrainC57bl6ME14halfHotspotsRep1
wgEncodeUwDnaseWholebrainC57bl6ME14halfHotspotsRep2
wgEncodeUwDnaseWholebrainC57bl6ME14halfPkRep1
wgEncodeUwDnaseWholebrainC57bl6ME14halfPkRep2
wgEncodeUwDnaseWholebrainC57bl6ME14halfSigRep1
wgEncodeUwDnaseWholebrainC57bl6ME14halfSigRep2
wgEncodeUwDnaseZhbtc4129olaME0HotspotsRep1
wgEncodeUwDnaseZhbtc4129olaME0HotspotsRep2
wgEncodeUwDnaseZhbtc4129olaME0PkRep1
wgEncodeUwDnaseZhbtc4129olaME0PkRep2
wgEncodeUwDnaseZhbtc4129olaME0SigRep1
wgEncodeUwDnaseZhbtc4129olaME0SigRep2
xenoMrna
xenoRefFlat
xenoRefGene
xenoRefSeqAli
)

def headup(str)
  (str[0..0].upcase + str[1..-1]) 
end

open(SPEC_FILE, 'w') do |fout|
  fout.puts <<"EOS"
require "bio-ucsc"
require "pp"

describe "#{KLASS}" do

  before(:all) do
    #{KLASS}::DBConnection.connect
  end

EOS

  TABLES.each do |table|
    next if table.start_with?('#')
    fout.puts <<"EOS"
  describe "#{KLASS}::#{headup(table)}" do
    context ".first" do
      it 'returns the first records' do
        result = #{KLASS}::#{headup(table)}.first
        pp result
        result.should be_true
      end
    end
  end 

EOS
  end

  fout.puts "end"
end

