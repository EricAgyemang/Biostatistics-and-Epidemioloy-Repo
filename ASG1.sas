data HMW1 ;
input Subfamily $	Pre1960	Post1960 Minimum	Maximum ;
          total=pre1960+post1960;
		  Avesize=(minimum+maximum)/2;
		  logtotal=log10(total);
		  logsize=log10(avesize);
datalines;
HYDROPOR	109	59	3	3
HYDROPOR	7	8	2.3	2.7
HYDROPOR	22	10	2.5	2.5
HYDROPOR	61	40	2	2.3
HYDROPOR	129	126	2	2.4
HYDROPOR	102	85	3	3
HYDROPOR	43	12	4.5	4.5
HYDROPOR	139	130	4	4.3
HYDROPOR	28	35	4.5	4.5
HYDROPOR	60	65	4	4
HYDROPOR	153	265	3	3
HYDROPOR	22	23	4	4
HYDROPOR	10	19	5	5
COLYMBET	149	208	7.5	8.5
COLYMBET	64	95	7	8
COLYMBET	73	74	7	7.5
COLYMBET	61	44	9	9
COLYMBET	6	4	9	9.5
COLYMBET	47	99	7	7
COLYMBET	86	81	7	8
COLYMBET	43	31	6	6
COLYMBET	3	18	8	8.5
COLYMBET	18	23	7	7
COLYMBET	13	7	7	8
COLYMBET	66	53	11.5	11.5
COLYMBET	19	61	9.5	10
COLYMBET	66	82	10.5	11.5
COLYMBET	16	45	11	11
COLYMBET	.	.	13	15
COLYMBET	.	.	10	11
LACCOPHI	75	75	4	4.5
LACCOPHI	132	158	4	4.5
LACCOPHI	6	4	3	3
HYDROPOR	19	5	2	2.5
HYDROPOR	107	154	4.5	5
HYDROPOR	44	19	2	2
HYDROPOR	10	2	1.5	1.5
HYDROPOR	13	1	2	2
HYDROPOR	10	20	2	2
HYDROPOR	165	253	3	3
HYDROPOR	29	18	4	4
HYDROPOR	67	58	4	4
HYDROPOR	73	31	3	3.5
HYDROPOR	70	96	5	5
HYDROPOR	49	22	4	4
HYDROPOR	.	.	3.2	3.5
HYDROPOR.	.	204	4.5	5.2
COLYMBET	.	.	8	8.5
COLYMBET	.	.	7.5	8
COLYMBET	.	.	6	6.5
COLYMBET	.	.	7	7
COLYMBET	.	.	16	18
HYDROPOR	.	.	3.4	11
HYDROPOR	.	.	3.8	5.2
HYDROPOR	76	244	2.8	3.3
HYDROPOR	86	185	3	3.5
HYDROPOR	0	7	3	3.8
HYDROPOR	188	420	3.7	4.5
HYDROPOR	33	47	3.5	4.2
HYDROPOR	1	9	3	3.4
HYDROPOR	159	345	3.5	4.1
HYDROPOR	67	277	3.3	3.8
HYDROPOR	31	19	3.5	4.5
HYDROPOR	61	147	3	3.5
HYDROPOR	1	3	3	3.5
HYDROPOR	62	113	3.3	3.5
HYDROPOR	11	33	2.2	2.6
HYDROPOR	135	384	2.8	3.5
HYDROPOR	119	233	2.5	3.1
HYDROPOR	41	25	3.3	4.2
HYDROPOR	228	804	3.3	3.8
HYDROPOR	145	494	4	4.6
HYDROPOR	23	25	4	5.3
HYDROPOR	5	7	1.7	2.2
HYDROPOR	81	251	3	3.4
HYDROPOR	.	388	3.4	3.8
HYDROPOR	111	280	2.8	3.3
HYDROPOR	84	254	2.5	2.9
HYDROPOR	70	119	4.5	5.5
COLYMBET	3	1	9.5	9.5
COLYMBET	111	122	9	10
COLYMBET	85	161	9	10
COLYMBET	30	35	10	11
COLYMBET	29	60	10	11
COLYMBET	81	93	10	12
DYTISCIN	22	38	13	14.5
DYTISCIN	20	14	12	13
DYTISCIN	1	9	14	16
DYTISCIN	0	1	14	16
DYTISCIN	13	29	14	16
DYTISCIN	117	184	16	18
DYTISCIN	11	28	22	25
DYTISCIN	29	19	27	32
DYTISCIN	26	41	26	32
DYTISCIN	8	18	32	38
DYTISCIN	134	291	26	32
NOTERIDA	81	141	4	5
NOTERIDA	23	39	3.5	4
;
proc univariate data=homework1 plot;
var total avesize logtotal logsize;
run;
proc gplot data=homework1;
plot total*avesize=subfamily
logtotal*logsize=subfamily;
run;
proc gchart data=homework1;
hbar total logtotal avesize logsize / levels=10;
run;
proc gchart data=homework1;
hbar total logtotal avesize logsize / levels=5;
run;
proc corr data=homework1;
var total avesize logtotal logsize;
proc sort data=homework1;
by subfamily;
proc univariate data=homework1 plot;
by subfamily;
var total avesize logtotal logsize;
run;quit;
