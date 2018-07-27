#!C:\xampp\perl\bin\perl.exe
print "Content-type: text/html\n\n";
use CGI;
use CGI::Carp qw(fatalsToBrowser);
$cgi=new CGI;
read(STDIN,$FormData,$ENV{'CONTENT-LENGTH'});

$name=$cgi->param("name");
$password=$cgi->param("password");

open(file,">","FILES/users.txt");
print "NAME:$name<br>";
print file "NAME:$name\n";

print "PASSWORD:$password<br>";
print file "PASSWORD:$password\n";
