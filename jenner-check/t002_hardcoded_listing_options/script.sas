/* Adapted from rogerjdeangelis/utl-directing-output-to-a-listing-window-...
   Section "1 hardcoding" - the author's "paste this in front of all your
   submissions" fix: options noerrorabend, ods html close / ods listing,
   and the ls/ps/nofmterr/nocenter/validvarname/FORMCHAR options block,
   applied directly (no macro variable wrapper) ahead of a small report
   to confirm the listing window actually receives the output. */

options noerrorabend; /*-- some of the altair personal slc create errors when they should not? */
ods html close;
ods listing;
options ls=255 ps=65  nofmterr nocenter
nodate nonumber noquotelenmax
validvarname=upcase
compress=no FORMCHAR='|----|+|---+=|-/\<>*';

data work.orders;
   length product $14 region $8;
   input product $ region $ qty amt;
   datalines;
Widget East 120 2400.50
Widget West 95 1900.00
Gadget East 60 1800.75
Gadget West 45 1350.25
Sprocket East 200 3000.00
Sprocket West 150 2250.00
;
run;

proc sort data=work.orders out=work.orders_sorted;
   by region product;
run;

proc print data=work.orders_sorted noobs;
   title 'Hardcoded listing-window options - sorted order report';
   var region product qty amt;
run;

proc freq data=work.orders;
   tables region / nocum;
   title 'Region frequency - confirms listing capture (option 1: hardcoding)';
run;
