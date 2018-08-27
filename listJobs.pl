#!C:\xampp\perl\bin\perl.exe
print "Content-type: text/html\n\n";
use CGI;
use CGI::Carp qw(fatalsToBrowser);
$cgi=new CGI;
read(STDIN,$FormData,$ENV{'CONTENT-LENGTH'});

$qualification=$cgi->param('qualification');

use DBI;

my $dbh = DBI->connect('dbi:ODBC:driver=Microsoft Access Driver (*.mdb, *.accdb);dbq=C:\Users\Seeni\Documents\JobKar.accdb', 'root','') or 
  die "$DBI::errstr\n";

print("Connection Sucessful<br />");

$sth=$dbh->prepare("Select * from Jobs;");

$sth->execute();

while(my @row  = $sth->fetchrow_array()){
  print "@row[0] @row[1] @row[2] <br />";
  if(@row[0] eq $qualification){
    print("qual is equal <br />");
  }
}

print "Connected";


print( "DEBUG<br />");
$DSN = 'driver=Microsoft Access Driver(*.mdb,*.accdb);dbq=C:\Users\Seeni\Documents\JobKar.accdb';
print("dbi:ODBC:$DSN");