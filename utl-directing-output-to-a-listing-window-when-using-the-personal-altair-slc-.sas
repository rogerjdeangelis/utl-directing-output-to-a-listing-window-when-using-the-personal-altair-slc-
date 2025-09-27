%let pgm=utl-directing-output-to-a-listing-window-when-using-the-personal-altair-slc;

Directing-output-to-a-listing-window-when-using-the-personal-altair-slc

Too long to post here, see github

github
https://tinyurl.com/bddx38kc
https://github.com/rogerjdeangelis/utl-directing-output-to-a-listing-window-when-using-the-personal-altair-slc-

  CONTENTS

    1 hardcoding
    2 using _init_ macro variable

community.altair
https://tinyurl.com/3234jn7b
https://community.altair.com/discussion/60516/where-is-the-print-output-sent-by-altair-slc-communicate-by-default?tab=accepted&utm_source=community-search&utm_medium=organic-search&utm_term=slc

/*   _                   _                 _ _
/ | | |__   __ _ _ __ __| |   ___ ___   __| (_)_ __   __ _
| | | `_ \ / _` | `__/ _` |  / __/ _ \ / _` | | `_ \ / _` |
| | | | | | (_| | | | (_| | | (_| (_) | (_| | | | | | (_| |
|_| |_| |_|\__,_|_|  \__,_|  \___\___/ \__,_|_|_| |_|\__, |
                                                     |___/
*/

Just paste this in front of all your submissions.
Seems to be an issue when you put this in your autoexec, options are not always retained?

options noerrorabend; /*-- some of the altair personal slc create errors when they should not? */
ods html close;
ods listing;
options ls=255 ps=65  nofmterr nocenter
nodate nonumber noquotelenmax
validvarname=upcase
compress=no FORMCHAR='|----|+|---+=|-/\<>*'

/*--- With the above we still get HTML output, still looking for the setting to change this ---*/

/*___         _       _ _
|___ \       (_)_ __ (_) |_        _ __ ___   __ _  ___ _ __ ___  __   ____ _ _ __
  __) |      | | `_ \| | __|      | `_ ` _ \ / _` |/ __| `__/ _ \ \ \ / / _` | `__|
 / __/       | | | | | | |_       | | | | | | (_| | (__| | | (_) | \ V / (_| | |
|_____|  ____|_|_| |_|_|\__|____  |_| |_| |_|\__,_|\___|_|  \___/   \_/ \__,_|_|
        |_____|           |_____|
*/

2 Editing your config and using my eclipse metadata

If you add these lines to your autoexec

C:\Program Files\Altair\SLC\2025\altairslc.cfg
or wherever you installed program files

-set SASAUTOS ('!wpshome\sasmacro' 'c:/wpsoto')
-SASAUTOS (SASAUTOS)
-SASUSER 'd:/wpsusr'
-WORK 'd:\wpswrk'
-WORKINIT

-AUTOEXEC 'c:/wpsoto/autoexec.sas'

and add this line to c:/wpsoto/autoexec.sas

Add these lines
%global _init_;
%let _init_= %nrstr(ods html close;
ods listing;
options ls=255 ps=65  nofmterr nocenter nodate
nonumber noquotelenmax validvarname=upcase
 compress=no FORMCHAR='|----|+|---+=|-/\<>*');

Then precede all your programs with

&_init_;
proc options;
run;quit;

If you want to use my layout

d:/wpsa  template eclipse workspace (has the layout)
         The location for the workspace is chosen when starting
         Altair SLC Workbench for the first time
         go to file>switch workspace>wpsa (or where ever you put the workspce folder i used folder d:/wpsa)


If you replace your metadata with

d:/wpsa/.metadata.zip

Related repos repos
------------------------------------------------------------------------------------------------------------------------------------
https://github.com/rogerjdeangelis/setup-personal-edition-altair-slc-eclipse-workspace-config-sasautos-sasuser-saswork-autoexec
https://github.com/rogerjdeangelis/utl-altair-slc-to-fill-gaps-in-proc-sql-select-third-place-in-the-daily-double-r-python-solutions
https://github.com/rogerjdeangelis/utl-calling-python-from-personal-altair-slc-and-integrating-python-with-sql
https://github.com/rogerjdeangelis/utl-calling-r-from-personal-altair-slc-and-integrating-r-with-sql
https://github.com/rogerjdeangelis/utl-dropping-down-to-powershell-from-personal-altair-slc
https://github.com/rogerjdeangelis/utl-how-to-create-a-sas-dataset-from-python-panda-dataframe-using-the-personal-altair-slc
https://github.com/rogerjdeangelis/utl-how-to-create-a-sas-dataset-from-r-dataframe-using-the-personal-altair-slc

/*              _
  ___ _ __   __| |
 / _ \ `_ \ / _` |
|  __/ | | | (_| |
 \___|_| |_|\__,_|

*/
