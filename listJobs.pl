#!C:\xampp\perl\bin\perl.exe
print "Content-type: text/html\n\n";
use CGI;
use CGI::Carp qw(fatalsToBrowser);
$cgi=new CGI;
read(STDIN,$FormData,$ENV{'CONTENT-LENGTH'});

$qualification=$cgi->param('qualification');

#Windows-based Perl/DBI/MS Access example
use DBI;

my @drivers = DBI->available_drivers;
print join(", ", @drivers), "\n";





my $dbh = DBI->connect('dbi:ODBC:driver=Microsoft Access Driver (*.mdb, *.accdb);dbq=C:\Users\Seeni\Documents\JobKar.accdb', 'root','') or 
  die "$DBI::errstr\n";

print "Connected";