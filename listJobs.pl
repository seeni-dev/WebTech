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
chomp($line);
print ofile $line;
$line=<ifile>;
chomp($line);
print "<br /> Available Jobs for your Qualification are <br /><br />";
while($line ne ""){
    print ofile "\n";
    @arr=split(/ /,$line);
    $line=<ifile>;
    chomp($line);
    if(@arr[0] eq $qualification && @arr[2]!=0){
        print "Qualification: @arr[0]<br/>Location: @arr[1]<br/> Available jobs: @arr[2] <br/>";
        print "<br/><br />";
        @arr[2]=@arr[2]-1;
    }
    print ofile "@arr[0] @arr[1] @arr[2]";
}

close(ifile);
close(ofile);
# recopy the content of files
open(ifile,"<","FILES/jobs.txt.temp");
open(ofile,">","FILES/jobs.txt");
$line=<ifile>;
while ($line ne ""){
    print ofile $line;
    $line=<ifile>;
}
close(ifile);
close(ofile);

