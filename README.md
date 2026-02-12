# eds240-nri-acs-viz
Visualizing FEMA NRI Data 

 ## Overview
  
This repository contains  code and resources for visualizing the FEMA National Risk Index (NRI) data using ACS (American Community Survey) data. The visualizations aim to provide insights into various risk factors and vulnerabilities across different regions, including analysis by race and ethnicity within California.

---
  
  ## Repository Structure
  
  * `data/` – Contains **Contains processed FEMA National Risk Index (NRI) and American Community Survey (ACS) datasets used for visualization and analysis, including race/ethnicity-specific datasets.**
  * `eds240-nri-acs-viz.Rproj` – RStudio project file for this repository.
  * `hw2.qmd` – Quarto document containing the analysis and visualization workflow.
  * `hw3.qmd` – Quarto document containing the analysis and visualization workflow of race and ethnicity climate risk exposure.
  * `hw2.pdf` – Rendered PDF output of the Quarto document.
  * `hw3.pdf` – Saved to PDF output (print) of the Quarto document.
  * `README.md` – This file.

---
  
  ## Data Access
  
  * **Processed data:** `data/nri_counties.csv` 
  `data/nri_counties.csv` (county-level NRI data)
  `data/nri_ca_race_tidy.csv` (tidied California county-level NRI data joined with race/ethnicity populations)
  `data/nri_race_summary.csv` (statewide cumulative, population-weighted NRI by race/ethnicity)
  * **Processed data:** **held in .gitignore / available upon request]**.
  **Raw data:** **of NRI dataset** are **[not included through .gitignore** to reduce repository size. They can be accessed or re-downloaded from **Fema.gov : https://www.fema.gov/flood-maps/products-tools/national-risk-index**.

---
  
  ## Data Citation
  
  **NRI Dataset**
  
  Federal Emergency Management Agency (FEMA), National Risk Index Dataset: National Risk Index County_National Risk Index_Rating_Composite - v1.20. Retrieved from https://fema.maps.arcgis.com/home/item.html?id=5771b821a2124413b2ee590a73ca338d on December 13, 2025, 12:34 PM EST. This product uses the FEMA National Risk Index dataset API or downloadable datasets but is not endorsed by FEMA. The Federal Government or FEMA cannot vouch for the data or analyses derived from these data after the data have been retrieved from the Agency's website(s).
  
  ---
  
  ## Data Processing for Community Resilience Scores 
  1. Read raw county-level NRI data into R using read_csv().
  2. Filtered and aggregated to separate California counties from the rest of the U.S.
  3. Calculated population-weighted mean resilience scores for each group.

  The resulting datasets contain:

  nri_ca_race_tidy.csv: County-level NRI with race/ethnicity populations and weighted NRI values

  nri_race_summary.csv: Aggregated statewide population-weighted NRI by race/ethnicity
  These datasets are geometry-free/tabular and ready for visualization or comparative analysis
    
 ---
  
  ## Usage
      
      You can load the processed dataset in **R**:
      
      ```r
    library(readr)
    data <- read_csv("data/nri_counties.csv")
    
    #State level NRI data (CA)
    nri_ca_race_raw <- read_csv("data/nri_ca_race_raw.csv")
    
    # County-level race/ethnicity NRI
    nri_ca_race_tidy <- read_csv("data/nri_ca_race_tidy.csv")

      # Statewide summary by race/ethnicity
    nri_race_summary <- read_csv("data/nri_race_summary.csv")
    ```
    
 ---
  
  ## Contact 
      
      **Sarayu Ramnath**
      **sramnath@bren.ucsb.edu**
      
      ---
      
