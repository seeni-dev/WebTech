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


my $DSN = 'driver=Microsoft Access Driver(*.mdb,*.accdb);dbq=C:\Users\Seeni\Documents\JobKar.accdb'; 
my $dbh = DBI->connect("dbi:ODBC:$DSN", 'root','') or 
  die "$DBI::errstr\n";

 
 #prepare and execute SQL statement
 $sth = $dbh->prepare('SELECT * FROM [TestCasesOutput]');
 $sth->execute || 
       die "Could not execute SQL statement ... maybe invalid?";
print "Error 4\n";
 #output database results
 while (@row=$sth->fetchrow_array)
  { print "@row\n" }