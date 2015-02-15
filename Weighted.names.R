
#US federal agencies, available at http://www2.gwu.edu/~nsarchiv/NSAEBB/NSAEBB216/app1.pdf
Agencies <- c("AID AMBC AMTRAK APHIS ATF BBG BIA BLM BOP CBFO CBP CCR CDC CEQ CFTC CIA CMS CNS CO CPSC CRIM CRT CSB CSOSA DA DEA DHS DIA DNFSB DOC DOD DOE DOI DOJ DOL DOS DOT EBSA ED EEOC EIB EOIR EOUSA EPA ESA ETA FAA FBI FCA FCC FCSIC FDA FDIC FEC FEMA FERC FHFB FLETC FLRA FMC FMCSA FMSHRC FOMC FRB FS FSA FSIS FTC FWS GSA HHS HUD IAF ICE IMLS IRS ITC JMD JWOD LSC MCC MSHA MSPB NARA NASA NCOC NEA NEH NIGC NIH NLRB NMB NOAA NPS NRC NSA NSF NTSB OA OCC ODNI OFHEO OGE OMB ONDCP OPIC OPM ORO OSC OSHA OSHRC OSTP OTS PC PRC PBGC RD EMCBC RRB SBA SEC SSA SSS STB TDA TRE TSA TVA USAF USCG USDA USMC USMS USN USPC USPS USSS USTR VA")

Agencies.frequency <- table(strsplit(Agencies, "")[[1]])
Agencies.frequency.perc = Agencies.frequency[-1] / sum(Agencies.frequency)
Probs <- as.vector(Agencies.frequency.perc)
Letters <- dimnames(Agencies.frequency.perc)
Letters.unlist <- unlist(Letters)

#Set to produce three-character agency names
Example <- sample(Letters.unlist,3, replace=TRUE, prob=Probs) 
