#!/usr/bin/perl
use Time::HiRes qw(usleep gettimeofday);
use Math::Round;
$| =1;
my ($info,$samples,@oid)=@ARGV;
my @info=split/[:]/,$info;
my $ip=$info[0];my $port=$info[1];my $community=$info[2]; $size=@oid;
	while (1){
        $sr=gettimeofday;
	@st=`snmpget -v1 $ip:$port -c $community .1.3.6.1.2.1.1.3.0 @oid;`;        
	($substr) = $st[0] =~ /\((.*)\)/;
        $lat_val = ($substr);
        if($lat_val >$prev_val){ 
	         for($i=1;$i<=$#st;$i++){
                  @b=split/[=]/,$st[$i];
                  push @val,$b[0];
                   @c=split/[ ]/,$b[1];
                    push @d ,$c[2];}
       		 @new_val=@d;
      		 undef @d;
        	@val1= @val;
        	undef @val;
        	if(@old_val && $prev_val >0){
    		$sam=($lat_val-$prev_val)/100;## time difference 
		$sample_new= round($sam);
                $mod=($lat_val-$prev_val)%100;
		$mod = $mod/100;		
        		for ($i=0;$i<$#st;$i++){
        		$rate=$new_val[$i]-$old_val[$i];
       			$frate= $rate/$sample_new;
			$r=2**32;
        			if($frate<0){
                                $fn_rate=($rate+$r)/$sample_new;
       				 print("$val1[$i] = $fn_rate\n");
                                }
       				else {
				print("$val1[$i] = $frate\n");}
}#end of for loop
}#end of if loop
        @old_val=@new_val; 
} #end of 1st if loop  
        $prev_val =$lat_val;
        $s1=gettimeofday;
	$p = sprintf "%.2f", $s1-$sr;
	usleep (($samples-$p)*1000000);      
}# end of while loop



