#!C:\xampp\perl\bin\perl.exe
print "Content-type: text/html\n\n";
use CGI;
use CGI::Carp qw(fatalsToBrowser);
$cgi=new CGI;
read(STDIN,$FormData,$ENV{'CONTENT-LENGTH'});

$qualification=$cgi->param('qualification');

use DBI;

$DSN="driver=Microsoft Access Driver (*.mdb, *.accdb);dbq=C:\\Users\\Seeni\\Documents\\JobKar.accdb";

my $dbh = DBI->connect("dbi:ODBC:$DSN") or 
  die "$DBI::errstr\n";

print("Connection Sucessful<br />");

$sth=$dbh->prepare("Select * from Jobs;");

$sth->execute();

while(my @row  = $sth->fetchrow_array()){
  ($qual,$location,$noa)=@row;
  if($qual eq $qualification){
    print "@row[0] @row[1] @row[2] <br />";
    if($noa > 0){
      $noa-=1;
      $q="Update Jobs set noa=? where qual=? and location=?;";
      $upq=$dbh->prepare($q);
      $upq->execute($noa,$qual,$location) or die "$DBI::errstr<br />"; 
    }
    else{
      $q="Delete from Jobs  where qual=? and location=? and noa=? ;";
      print($q);
      $dq=$dbh->prepare($q);
      $dq->execute($qual,$location,$noa) or die "$DBI::errstr<br />";   
    }
  }
}

