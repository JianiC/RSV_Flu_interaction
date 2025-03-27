# RSV_Flu_interaction_2022
This repository contains the data and code used to analyze RSV and Flu interaction in the United States.

## Data

* FluView Data: accesed July 8, 2021
source: https://gis.cdc.gov/grasp/fluview/fluportaldashboard.html
* RSV data request from NREVSS team
* Sequence data was obtained from GISAID.
* See also [here](Genetic_analysis/README.md).

## Prerequisites
* R, and the R packages listed [here](./src/libraries.R).


## Instructions
* In each folder:
    - scripts to generate the figures each sections was name as main figure
    - This figure.R contains all figures used in manuscript.
Fig1: 1_cortest.R was used to generated: Fig.1A Fig.1B, Fig.S1 and Table S1
    2_timelag_cortest.R was used to generated Fig.1C
    The Demographic data can be donwload as described in the method section or contact the authors
Fig2:  1_time_slice_pact_est.R was used to generated Fig.1 A
2_genetic_effective_size was used to generated Fig.1 C, Fig.S3 and Fig.S4
3_genetoc_corre was used to generated Table 1
Beast folder contains the script for Bayeian phylogentic analysis
Fig3: 1_1_dynamics simulation.R was used to generated Fig.3 A 
1_2_point_simulate.R was used to generate to Fig.3B
The parameters that are used for simulation was save under sim_data directory
Fig4. contains the code that are use to fit the two-pathogen transmission model with HHS regional surveliance data.
Fig5.



