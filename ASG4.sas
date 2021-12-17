data example;
	input   treat  $   y;
	datalines;
CONTROL 	45
CONTROL 	51
CONTROL 	46
CONTROL 	53
CONTROL 	48
CONTROL 	43
CONTROL 	51
CONTROL 	47
Boron 	58
Boron 	62
Boron 	61
Boron 	59
Boron 	63
Boron 	55
Boron 	66
Boron 	57
Copper 	52
Copper 	49
Copper 	47
Copper 	55
Copper 	55
Copper 	45
Copper 	50
Copper 	53
Potassium 	54
Potassium 	52
Potassium 	53
Potassium 	60
Potassium 	50
Potassium 	53
Potassium 	53
Potassium 	60
Phosphorus 	56
Phosphorus 	64
Phosphorus 	57
Phosphorus 	59
Phosphorus 	62
Phosphorus 	59
Phosphorus 	61
Phosphorus 	56
;
PROC GLM DATA=AOVEX001;	        
     CLASS TREAT;                                   
     MODEL Y = TREAT;
     MEANS TREAT / REGWQ TUKEY  
             HOVTEST=BF;
	output out=resdata r=resid  p=predict;
     
     estimate 'control vs treat' treat 4 -1 1 1 1;
     estimate 'macro vs micro' treat 0 0.5 0.5 -0.5 -0.5;
	 estimate 'Boron vs copper' treat 0.5 0 0.5 0 0;
	 estimate 'Potassium vs Phosphorous' treat 0 0 0 0.5 0.5;

		
proc univariate data=resdata plot normal;
     var resid;
proc gplot data=resdata;
     plot resid*predict;
RUN;

