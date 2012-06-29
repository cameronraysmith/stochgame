#!/usr/bin/perl

use Tie::File;

my( $file_name ) = @ARGV;

unless( open(DATAFILE, "$file_name") ) {
print "Could not open file $file_name\n";
exit;
}

# open the file with tie
tie my @file_lines, 'Tie::File', $file_name or die;

# mark that bibtex file has been processed
#shift @file_lines;
#unshift( @file_lines, '#####processed with remove_url.pl######');


# filter out lines containing 'url = {*},'
@file_lines = grep !/url\s=\s\{.*\},/, @file_lines;

# close the file with untie.
# IMPORTANT: always untie when you are done!
untie @file_lines or die "$!";
