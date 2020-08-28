($expr,$pval,$gene_info)=@ARGV;
open (FILE,"> genenames_pval.txt");
open (IN,$gene_info);
while (<IN>) {
	chomp;
	$_=~/gene_id\s(".*");\sgene_type.*gene_name\s"(.*)";\slevel/;
	$ginfo{$1}=$2;
 }
$num=1;
open (IM,$expr);
while (<IM>) {
	chomp;
	@arr=split(/\t/,$_);
	$combine_info{$num1}="$arr[0]\t$ginfo{$arr[0]}";
	$num1+=1;
}
$num2=1;
open (PVAL,$pval);
while (<PVAL>) {
	chomp;
	print FILE"$combine_info{$num2}\t$_\n";
	$num2+=1;
}
    