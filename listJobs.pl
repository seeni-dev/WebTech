#!C:\xampp\perl\bin\perl.exe
print "Content-type: text/html\n\n";
use CGI;
use CGI::Carp qw(fatalsToBrowser);
$cgi=new CGI;
read(STDIN,$FormData,$ENV{'CONTENT-LENGTH'});

$qualification=$cgi->param('qualification');


open(ifile,"<","FILES/jobs.txt");

$line=<ifile>; # disgard this feed
$line=<ifile>;
while($line ne ""){
    @arr=split(/ /,$line);
    $line=<ifile>;
    if(@arr[0] eq $qualification && @arr[2]!=0){
        print @arr;
    }
    print "<br />";
}


close(ifile);
