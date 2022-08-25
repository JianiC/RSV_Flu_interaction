# Interaction model
This repository contains the data and code used to test interaction hypothesis with two-pathogen transmission model
<img width="862" alt="Screen Shot 2022-08-25 at 4 04 42 PM" src="https://user-images.githubusercontent.com/47227610/186758259-ee71beaa-a7e3-408d-b024-8b89b3dacdb3.png">

## Data

* Data used to fit the model was prepared from [here](Data_prep/) folder
* Data are loaded from setup.R

## Prerequisites
* R, and the R packages listed [here](model/setup.R).


## Instructions
* 1_1_dynamic_simulate.R; 1_2_point_simulate.R
	- Simulation study with constructed model
		
* 2_hhs_arsv_coinfect_script.R
	- to test the hypothesis with different region, change parameter'HHS_region'
	- to test different interaction hypothesis, change parameter param_constraints option from param_constraints.R
	- Deoptim was used to find the MLE under each hypothesis and parameters estimates are saved
	
* 3_1_res_arsv_analysis.R;3_2_res_brsv_analysis.R
	- post analysis after model fitting
	- AIC and RMSE are used to compared different hypothesis
	- Parameter optimization was done on a cluster, results are saved as .rds
	- all results are loaded from scripts 
	- Due to the limit memory usage scripts Sys.setenv('R_MAX_NUM_DLL'=1000) was added
	
* 4_1_best_hypothisis_fit.R;4_2_all_hypothesis_fit.R
	- examine the trajectory fitting under different hypothesis
	
* 5_CI_est_loglik.R
	- 95 CI estimate for parameter with interest
	- Simulation approach was use with 20 points estimation
	
## Additional Details

* Customized functions that are used in this scripts are list at the bottom.
* model are defined in `pomp_model.R`
* Parameter estimation for statistical model was conducted in R on a cluster due to computational time considerations. For conveneience, this step can be by-passed and all the plots can be built from pre-computed R objects (located in `model/results`).
