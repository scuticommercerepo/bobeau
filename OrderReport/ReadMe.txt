A) Running OrderReport on Review 

1) Login to sftp.aws.marketlive.com

2) Drop command file "revv161-orderReport-command.xml"

/bobeau-batch-review/input/command_files

3) Drop Control file "bis-bobeau-revv161-orderReport-control.xml"

/bobeau-batch-review/input/control_files

4) Wait for 5-10 based on number of days for which we are running the report.  
   Default is last 24 hours which should run within 5 mins.

5) Go to /bobeau-batch-review/working/encrypt

Download OrderReport.xls from this folder

======================================================================================

B) Running OrderReport on Production

1) Login to sftp.aws.marketlive.com

2) Drop command file "prdv161-orderReport-command.xml"

/bobeau-batch-production/input/command_files

3) Drop Control file "bis-bobeau-prdv161-orderReport-control.xml"

/bobeau-batch-production/input/control_files

4) Wait for 5-10 based on number of days for which we are running the report.  
   Default is last 24 hours which should run within 5 mins.

5) Go to /bobeau-batch-production/working/encrypt

Download OrderReport.xls from this folder


======================================================================================

c) Updating command file to run report for more than last 24 hours

Edit file  

revv161-orderReport-command.xml For Review

or

prdv161-orderReport-command.xml For Production


Change sysdate - 1 to sysdate - 10 (This will run for last 10 days)  

