#!/usr/bin/perl

use NetSNMP::agent (':all');
use NetSNMP::ASN qw(ASN_OCTET_STR ASN_INTEGER);

sub hello_handler {
  my ($handler, $registration_info, $request_info, $requests) = @_;
  my $request;
  my $val;
  my @str;
  my $row;

  for($request = $requests; $request; $request = $request->next()) {
    my $oid = $request->getOID();
    if ($request_info->getMode() == MODE_GET) {
          @str = split /[.]/, $oid;
            
      if ($oid == new NetSNMP::OID(".1.3.6.1.4.1.4171.40.1")) {
        $request->setValue(ASN_INTEGER, time);
      }

      elsif ($oid > new NetSNMP::OID(".1.3.6.1.4.1.4171.40.1")) {
        @str = split /[.]/, $oid;
       $val =$str[8]-1;
       my $filename = '/usr/share/snmp/counter.conf';
       open(my $fh, '<', $filename) or die "Could not open file '$filename' $!";
       while ($row = <$fh>) {
       chomp $row;
       my @array = split /[\s]/,$row;
       my @array = split /[,]/,$array[0];
       if ($array[0]==$val)
       {$a=$array[1]* time;$a = $a & 0xffffffff;
}
}
         
       close $fh;

       $request->setValue(ASN_INTEGER, $a);

      }
    } 
     
      
      
    
  }
}

my $agent = new NetSNMP::agent();
$agent->register("hello_world", ".1.3.6.1.4.1.4171.40",
                 \&hello_handler);
