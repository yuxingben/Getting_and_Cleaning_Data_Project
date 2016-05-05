# Variables:
TrainX ,  TrianY,  TestX,  TestY,  TrainSubject  and  TestSubject contain the data from the downloaded files.
features contains the column names of the TrainX and TestX
ActivityType contains the column names for the Activity label and Activity names.

In Step 4, we clean up the column names of the extracted data. Changes are:

old features | cleaned up features
------------ | -------------
() | ""
 -std | StdDev;
-mean | Mean;
the beginning letter "t" | Time
the beginning letter "f" | Freq
gravity | Gravity;
bodybody or body | Body;
gyro | Gyro
AccMag | AccMagnitude
[Bb]odyaccjerkmag | BodyAccJerkMagnitude
replace JerkMag | JerkMagnitude
replace GyroMag | GyroMagnitude
