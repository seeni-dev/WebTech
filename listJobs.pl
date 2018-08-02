#!C:\xampp\perl\bin\perl.exe
print "Content-type: text/html\n\n";
use CGI;
use CGI::Carp qw(fatalsToBrowser);
$cgi=new CGI;
read(STDIN,$FormData,$ENV{'CONTENT-LENGTH'});

$qualification=$cgi->param('qualification');


open(ifile,"<","FILES/jobs.txt");
open(ofile,">","FILES/jobs.txt.temp");

$line=<ifile>; # disgard this feed
print ofile $line;
$line=<ifile>;
print "<br /> Available Jobs for your Qualification are <br /><br />";
while($line ne ""){
    @arr=split(/ /,$line);
    $line=<ifile>;
    if(@arr[0] eq $qualification && @arr[2]!=0){
        print "Qualification: @arr[0]<br/>Location: @arr[1]<br/> Available jobs: @arr[2] <br/>";
        print "<br/><br />";
        @arr[2]=@arr[2]-1;
    }
    print ofile "@arr[0] @arr[1] @arr[2]\n";

}

close(ifile);
close(ofile);
# recopy the content of files
open(ifile,"<","FILES/jobs.txt.temp");
open(ofile,">","FILES/jobs.txt");
$line=<ifile>;
while ($line ne ""){
    print ofile $line;
}
close(ifile);
close(ofile);

