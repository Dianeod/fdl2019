gp:.p.import[`geopandas]

precipall:raze {flip `site_no`long`lat`elv`date`ppt!flip value each 10_("SFFFDF";enlist ",")0: 
    hsym `$"data/prism/",string[x]} each key `:data/prism

prepsite:{`${$[7=count x;"0",;]x}each string x}
nlcdtyp:("SFFFFFSFFSFSFFFFSFSSFSSFFFSFFSFF";enlist",")
nlcupd:{[y;t]
 col:`site_no`INTPTLAT`INTPTLON`Measure`REACHCODE`distance`imp`year;
 impcol:`$"imp_nlcd_",string 2000+y;
 ?[t;();0b;col!((prepsite;`SOURCE_FEA);`INTPTLAT;`INTPTLON;`Measure;`REACHCODE;`distance;impcol;y)]}
nlcdread:{nlcupd[x]nlcdtyp 0:hsym`$"data/snap_sampled_imp_nlcd_",string[2000+x],".csv"} 
nlcd:raze nlcdread each 6 11 16

gauges:update prepsite site_no from ("SSSSFFSSIFFFFFFFFSSISSSSFF";enlist ",") 0:`:data/usgs_gage_subset.csv

basin:("S",242#"F";enlist ",") 0:`:data/gages_with_basin_attr.csv

warnings:.ml.df2tab gp[`:read_file]["data/national_shapefile_obs.shp"][`:dropna][`subset pykw (`Action;`Flood;`Moderate;`Major)][`:reset_index][`drop pykw 1b]

\l t_p
peak:select from peak where date>=2009.07.01

\l ../gagesdir/gagesdir

max_ht_str:0!select max height by site_no,date from str
