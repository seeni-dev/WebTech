#!C:\xampp\perl\bin\perl.exe
print "Content-type: text/html\n\n";
use CGI;
use CGI::Carp qw(fatalsToBrowser);
$cgi=new CGI;
read(STDIN,$FormData,$ENV{'CONTENT-LENGTH'});

$name=$cgi->param('name');
$password=$cgi->param("password");
$gender = $cgi -> param("gender");
$dob=$cgi->param("dob");
$email=$cgi->param("email");
$phno=$cgi->param("phno");

open(file,">>","FILES/users.txt");
print file "\n";
print "NAME:$name<br>";
print file "NAME:$name\n";


print "PASSWORD:$password<br>";
print file "PASSWORD:$password\n";

print "GENDER:$gender<br>";
print file "GENDER:$gender\n";

print "DOB:$dob<br>";
print file "DOB:$dob\n";

print "EMAIL:$email<br>";
print file "EMAIL:$email\n";

print "PHNO:$phno<br>";
print file "PHNO:$phno\n";

close(file)