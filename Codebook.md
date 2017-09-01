

# Variable Names

#### The run_analysis.R script generates two data tables.

1. Data Table: dtHARnet
    
    | Variable Names  | Description |
    | ----------------|:---------------------------------------------------------------------------:|
    | activityLabel   | Activity type a subject performed. The possible values are listed in the R Script section of this document  |
    | subjID          | Anonymous ID (1 through 30) assigned to the volunteers who participated in the experiments |
    | measurementType | Measurement type. Reference features_info.txt and readme.txt delivered with the dataset     |
    | statType        | Either mean or standard deviation   |
    | axis            | Signal direction (X or Y or Z) if applicable    |
    | measurement     | Measurement of activities of daily living while carrying a waist-mounted smartphone  |
    | domainType      | Time or Frequency domain     |
    | sensor Type     | Accelerometer (Acc) or Gyroscope (Gyro)    |
   
    
2. Data Table: dtActMean

| Variable Names  | Description  |
|---|---|
| subjID  | Anonymous ID (1 through 30) assigned to the volunteers who participated in the experiments    |
| activityLabel  | Activity type a subject performed. The possible values are listed in the R Script section of this document  |
| avg | Average of each activity measurement for a given subject  |
          
     
