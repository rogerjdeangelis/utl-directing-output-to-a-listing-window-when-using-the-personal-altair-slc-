/* Adapted from rogerjdeangelis/utl-directing-output-to-a-listing-window-...
   Section "2 using _init_ macro variable" - the reusable macro-variable
   form of the author's fix for forcing LISTING (not HTML) output under
   the Personal Altair SLC. Exercised here against a small sample dataset
   so the resulting PROC PRINT/PROC MEANS output lands in the .lst listing
   exactly as the author intended. */

%global _init_;
%let _init_= %nrstr(
ods html close;
ods listing;
options ls=255 ps=65  nofmterr nocenter nodate
nonumber noquotelenmax validvarname=upcase
 compress=no FORMCHAR='|----|+|---+=|-/\<>*';
);

&_init_;

data work.have;
   length city $12 state $2;
   input city $ state $ pop_thousands mm dd yy;
   datalines;
Baltimore MD 585 6 15 24
Columbia MD 104 7 2 24
Frederick MD 78 7 20 24
Rockville MD 68 8 1 24
Annapolis MD 40 8 12 24
Bethesda MD 62 8 22 24
;
run;

proc print data=work.have noobs;
   title 'Listing window output - not HTML - per the _init_ macro pattern';
   var city state pop_thousands;
run;

proc means data=work.have n mean min max;
   var pop_thousands;
   title 'Summary of population (thousands) - confirms listing capture';
run;
