# Variables:
TrainX ,  TrianY,  TestX,  TestY,  TrainSubject  and  TestSubject contain the data from the downloaded files.
features contains the column names of the TrainX and TestX
ActivityType contains the column names for the Activity label and Activity names.

In Step 4, we clean up the column names of the extracted data. Changes are:
old features | cleaned up features
------------ | -------------
() | ""


1) delete all the ();
2) replace -std with StdDev;
3) replace -mean with Mean;
4) replace the beginning letter "t" with "Time";
5) replace the beginning letter "f" with "Freq";
6) replace gravity with Gravity;
7) replace bodybody or body with Body;
8) replace gyro with Gyro;
9) replace AccMag with AccMagnitude;
10) replace [Bb]odyaccjerkmag with BodyAccJerkMagnitude;
11) replace JerkMag with JerkMagnitude;
12) replace GyroMag with GyroMagnitude;
