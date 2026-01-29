# eds240-nri-acs-viz
Visualizing FEMA NRI Data 

 ## Overview
  
This repository contains  code and resources for visualizing the FEMA National Risk Index (NRI) data using ACS (American Community Survey) data. The visualizations aim to provide insights into various risk factors and vulnerabilities across different regions.

---
  
  ## Repository Structure
  
  * `data/` – Contains **Contains processed FEMA National Risk Index (NRI) and American Community Survey (ACS) datasets used for visualization and analysis.**
  * `eds240-nri-acs-viz.Rproj` – RStudio project file for this repository.
  * `hw2.qmd` – Quarto document containing the analysis and visualization workflow.
  * `hw2.pdf` – Rendered PDF output of the Quarto document.
  * `README.md` – This file.

---
  
  ## Data Access
  
  * **Processed data:** `data/[filename].csv` is **[included in the repository / held in .gitignore / available upon request]**.
If access is restricted, please contact **[email or contact info]**.
* **Raw data:** **[Description of raw data]** are **[not included / partially included]** to reduce repository size. They can be accessed or re-downloaded from **[data source + link]**.
* **Spatial data / boundaries:** Located in `data/[folder or filename]` and publicly available at **[link]**, with metadata available at **[link]**.

---
  
  ## Data Citation
  
  1. **NRI Dataset**
  
  Federal Emergency Management Agency (FEMA), National Risk Index Dataset: National Risk Index County_National Risk Index_Rating_Composite - v1.20. Retrieved from https://fema.maps.arcgis.com/home/item.html?id=5771b821a2124413b2ee590a73ca338d on December 13, 2025, 12:34 PM EST. This product uses the FEMA National Risk Index dataset API or downloadable datasets but is not endorsed by FEMA. The Federal Government or FEMA cannot vouch for the data or analyses derived from these data after the data have been retrieved from the Agency's website(s).
  
  ---
  
  ## Data Processing for Community Resilience Scores 
  1. Read raw county-level NRI data into R using read_csv().
  2. Filtered and aggregated to separate California counties from the rest of the U.S.
  3. Calculated population-weighted mean resilience scores for each group.

  The resulting dataset contains 3,100+ county observations across 3 key variables and is geometry-free / tabular for visualization and comparative analysis.
    
      
      ## Usage
      
      You can load the processed dataset in **R**:
      
      ```r
    library(readr)
    data <- read_csv("data/nri_counties.csv")
    ```
    
    ---
      
      ## Contact
      
      **Sarayu Ramnath**
      **sramnath@bren.ucsb.edu**
      
      ---
      
