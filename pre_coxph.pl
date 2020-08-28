($data,$patient_info)=@ARGV;
open (IN,$data);
 $firstline=<IN>;
@sample_names=split(/\t/,$firstline);
close IN;
for (my$num = 1;$num <= 320;$num += 1) {
 $sample_names[$num]=~(/(TCGA-..-....)$/);
 $lable{$num} = $1;
}
open (FILE,"> patient.txt");
open (SECFILE,"> expr.txt");
open (IM,$patient_info);
while (<IM>) {
 chomp;
if ($_=~/^TCGA/){
 $_=~(/^(....-..-....)-01/);
 $names=$1;
 $_=~(s/LIVING/1/);
 $_=~(s/DECEASED/0/);
 $_=~(s/Stage III/1/);
 $_=~(s/Stage IV/1/);
 $_=~(s/Stage II/0/);
 $_=~(s/Stage I/0/);
 $patient{$names}=$_;
 }
else {
 print FILE"$_\n";
 }
}
$num3=1;
for (my$num2 = 1;$num2 <= 320;$num2 += 1) {
 if (exists($patient{$lable{$num2}})) {
  $hash{$num3}=$num2;
  print FILE"$patient{$lable{$num2}}\n";
  $num3+=1;
 }
 }
my $hash_num = keys%hash;
open (IN,$data);
while (<IN>) {
 chomp;
 if ($_=~(/ENSG/)) {
  @expression=split(/\t/,$_);
  print SECFILE"$expression[0]\t";
  for (my$num4 = 1;$num4 <=$hash_num;$num4 += 1) {
   if ($num4==$hash_num) {
   print SECFILE"$expression[$hash{$num4}]\n";
   }
   else {
   print SECFILE"$expression[$hash{$num4}]\t";
   }
  }
  }
 }
