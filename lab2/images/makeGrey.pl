#! /usr/bin/perl -w
use strict;
use GD::Simple;
use Math::Random;

###############################################
my $par = setup();

# create a new image object
my $img = GD::Simple->new($par->{size}, $par->{size});
$img->bgcolor('black');
$img->fgcolor('white');
$img->penSize($par->{penSize});
$img->clear;

# Clear the img folders
my $cmd = sprintf "rm -f %s/*.png", $par->{trnPath};
system($cmd);
$cmd = sprintf "rm -f %s/*.png", $par->{tstPath};
system($cmd);

my ($nPosTrn, $nNegTrn) = makeImg($par->{trnPath}, $par->{nImgTrn}, 'Trn', 0.5);
my ($nPosTst, $nNegTst) = makeImg($par->{tstPath}, $par->{nImgTst}, 'Tst', 0.5);

print "Training data: $par->{nImgTrn}\n";
print "\tnPos = $nPosTrn, nNeg = $nNegTrn\n";
print "Test data    : $par->{nImgTrn}\n";
print "\tnPos = $nPosTst, nNeg = $nNegTst\n";

sub makeImg {
   my ($path, $nImg, $id, $prev) = @_;

   # Make the images

   my @trg;
   my ($pos, $neg) = (0,0);
   my $idx = 1;
   for (1..$nImg) {
      if (rand() < $prev) {
	 my $file = makeRectImage($par, $path, $img, $idx++);
	 push @trg, [1, $file];
	 $pos++;
      } else {
	 my $file = makeCircImage($par, $path, $img, $idx++);
	 push @trg, [0, $file];
	 $neg++;
      }
   }

   my $name = sprintf "%s_trg.csv", $id;
   open my $FH, ">", $name;
   foreach my $r (@trg) {
      print $FH "$r->[0]\t$r->[1]\n";
   }
      close $FH;

   return $pos, $neg;
   
} # End of make Img


################################################

sub setup {
   my %par;

   $par{size}       = 64;
   $par{maxRecSize} = 0.50; 
   $par{minRecSize} = 0.10; 
   $par{maxCirSize} = 0.40; 
   $par{minCirSize} = 0.10; 
   $par{penSize}    = 3;
   
   $par{nImgTrn}    = 1000;
   $par{nImgTst}    = 1000;
   $par{trnPath}    = 'imgTrn';
   $par{tstPath}    = 'imgTst';
   
   return \%par;

} # End of setup


sub makeRectImage {
   my ($par, $imgPath, $img, $idx) = @_;

   my $mi = int $par->{minRecSize} * $par->{size} + 0.5;
   my $ma = int $par->{maxRecSize} * $par->{size} + 0.5;

   # Get the size of the rectangle
   my $xlen = random_uniform_integer(1, $mi, $ma);
   my $ylen = random_uniform_integer(1, $mi, $ma);

   # Get the starting point
   my $xsMax = $par->{size} - $xlen - ($par->{penSize} + 2);
   my $ysMax = $par->{size} - $ylen - ($par->{penSize} + 2);
   my $xymin = $par->{penSize} + 1;

   my $xs = random_uniform_integer(1, $xymin, $xsMax);
   my $ys = random_uniform_integer(1, $xymin, $ysMax);
   
   $img->rectangle($xs, $ys, $xs+$xlen, $ys+$ylen);
   
   # Open file
   my $file = sprintf "%s/img_%05d.png", $imgPath, $idx;
   open my $FH, ">", $file or die "Cannot open file $!";

   # Print the file
   print $FH $img->png(0);
   close $FH;

   $img->clear;

   return $file;


} # End of makeRectImage



sub makeCircImage {
   my ($par, $imgPath, $img, $idx) = @_;

   my $mi = int $par->{minCirSize} * $par->{size} + 0.5;
   my $ma = int $par->{maxCirSize} * $par->{size} + 0.5;

   # Get the radius of the circle
   my $rlen = random_uniform_integer(1, $mi, $ma);

   # Get the starting point
   my $xyMax = $par->{size} - $rlen - ($par->{penSize} + 2);
   my $xyMin = $rlen + ($par->{penSize} + 2);

   my $xs = random_uniform_integer(1, $xyMin, $xyMax);
   my $ys = random_uniform_integer(1, $xyMin, $xyMax);

   #print "$xyMax $xyMin $xs, $ys ($rlen)\n";
   
   $img->moveTo($xs, $ys);
   $img->ellipse(2*$rlen, 2*$rlen);
   
   # Open file
   my $file = sprintf "%s/img_%05d.png", $imgPath, $idx;
   open my $FH, ">", $file or die "Cannot open file $!";

   # Print the file
   print $FH $img->png(0);
   close $FH;

   $img->clear;

   return $file;


} # End of makeCircImage


