# RSV_Flu_interaction_2022

This repository contains the data and code used to analyze RSV and Flu interaction in the United States.

## Data

* FluView Data: accessed July 8, 2021  
  Source: https://gis.cdc.gov/grasp/fluview/fluportaldashboard.html  
* RSV data requested from the NREVSS team  
* Sequence data was obtained from GISAID. The accession numbers are provided.

## Prerequisites

* R, and the R packages listed in [./src/libraries.R](./src/libraries.R)

## Instructions

Each folder contains scripts used to generate figures for the manuscript. Scripts are grouped by figure number.

---

### Fig1: Demographic and correlation analysis

* The demographic data needed for this analysis can be downloaded as described in the Methods section or by contacting the authors.
* `1_cortest.R` was used to generate: Fig.1A, Fig.1B, Fig.S1, and Table S1  
* `2_timelag_cortest.R` was used to generate: Fig.1C

---

### Fig2: Bayesian phylogenetic analysis (BEAST results)

Folder: `Beast/`

* `1_time_slice_pact_est.R` was used to generate: Fig.2A  
* `2_genetic_effective_size.R` was used to generate: Fig.2C, Fig.S3, and Fig.S4  
* `3_genetoc_corre.R` was used to generate: Table 1

---

### Fig3: Simulation of two-pathogen transmission model

The parameters used for simulation are saved under the `sim_data` directory.

* `1_1_dynamics simulation.R` was used to generate: Fig.3A  
* `1_2_point_simulate.R` was used to generate: Fig.3B

---

### Fig4: Model fitting with HHS regional surveillance data

A detail explaination of the code structure are provided in the Readme.md

* Scripts named `1_X` contain code to fit HHS regional surveillance data under 4 different hypotheses. Output is saved under the `resultfolder`.  
* Scripts named `2_X` contain code to analyze the results.  
* `3_1` is used to generate trajectories with predicted parameters under different hypotheses: Fig.4 and Fig.S6  
* `3_2` is used to generate: Fig.S7

---

### Fig5: Log-likelihood estimation

* Contains the code used to estimate log-likelihoods shown in Fig.5 and Fig.S8
