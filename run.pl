#!/usr/bin/perl

use strict;
use warnings;
use feature qw|say|;

use FindBin;
use lib "$FindBin::Bin/lib";

package Class;
use Data::Dumper;

sub new {
	my $class = shift;
	my %params = @_; # || die "named arguments required";
	return bless {params => \%params}, $class;
}

package Members;
use base 'Class';

# Update this hash if any names change as they appear on the votesheet.
# The keys are the country "codes." The values are the names as they appear on the votesheet.
# The script will fail if any names as they appear on the votesheet aren't in this hash. 
# If a name is supposed to appear in Horizon differently than it appears on the votesheet,
# then the value has to be an array where the first val is the votesheet name, and the second 
# val is the Horizon name.

use constant MEMBERS => {
	'AFG' => 'AFGHANISTAN',
	'ALB' => 'ALBANIA',
	'DZA' => 'ALGERIA',
	'AND' => 'ANDORRA',
	'AGO' => 'ANGOLA',
	'ATG' => 'ANTIGUA AND BARBUDA',
	'ARG' => 'ARGENTINA',
	'ARM' => 'ARMENIA',
	'AUS' => 'AUSTRALIA',
	'AUT' => 'AUSTRIA',
	'AZE' => 'AZERBAIJAN',
	'BHS' => 'BAHAMAS',
	'BHR' => 'BAHRAIN',
	'BGD' => 'BANGLADESH',
	'BRB' => 'BARBADOS',
	'BLR' => 'BELARUS',
	'BEL' => 'BELGIUM',
	'BLZ' => 'BELIZE',
	'BEN' => 'BENIN',
	'BTN' => 'BHUTAN',
	'BOL' => ['BOLIVIA', 'BOLIVIA (PLURINATIONAL STATE OF)'],
	'BIH' => 'BOSNIA AND HERZEGOVINA',
	'BWA' => 'BOTSWANA',
	'BRA' => 'BRAZIL',
	'BRN' => 'BRUNEI DARUSSALAM',
	'BGR' => 'BULGARIA',
	'BFA' => 'BURKINA FASO',
	'BDI' => 'BURUNDI',
	'CPV' => 'CABO VERDE',
	'KHM' => 'CAMBODIA',
	'CMR' => 'CAMEROON',
	'CAN' => 'CANADA',
	'CAF' => 'CENTRAL AFRICAN REPUBLIC',
	'TCD' => 'CHAD',
	'CHL' => 'CHILE',
	'CHN' => 'CHINA',
	'COL' => 'COLOMBIA',
	'COM' => 'COMOROS',
	'COG' => 'CONGO',
	'CRI' => 'COSTA RICA',
	'CIV' => 'COTE D\'IVOIRE',
	'HRV' => 'CROATIA',
	'CUB' => 'CUBA',
	'CYP' => 'CYPRUS',
	'CZE' => ['CZECH REPUBLIC', 'CZECHIA'],
	'PRK' => 'DEMOCRATIC PEOPLE\'S REPUBLIC OF KOREA',
	'COD' => 'DEMOCRATIC REPUBLIC OF THE CONGO',
	'DNK' => 'DENMARK',
	'DJI' => 'DJIBOUTI',
	'DMA' => 'DOMINICA',
	'DOM' => 'DOMINICAN REPUBLIC',
	'ECU' => 'ECUADOR',
	'EGY' => 'EGYPT',
	'SLV' => 'EL SALVADOR',
	'GNQ' => 'EQUATORIAL GUINEA',
	'ERI' => 'ERITREA',
	'EST' => 'ESTONIA',
	'ETH' => 'ETHIOPIA',
	'FJI' => 'FIJI',
	'FIN' => 'FINLAND',
	'FRA' => 'FRANCE',
	'GAB' => 'GABON',
	'GMB' => 'GAMBIA',
	'GEO' => 'GEORGIA',
	'DEU' => 'GERMANY',
	'GHA' => 'GHANA',
	'GRC' => 'GREECE',
	'GRD' => 'GRENADA',
	'GTM' => 'GUATEMALA',
	'GIN' => 'GUINEA',
	'GNB' => 'GUINEA-BISSAU',
	'GUY' => 'GUYANA',
	'HTI' => 'HAITI',
	'HND' => 'HONDURAS',
	'HUN' => 'HUNGARY',
	'ISL' => 'ICELAND',
	'IND' => 'INDIA',
	'IDN' => 'INDONESIA',
	'IRN' => 'IRAN (ISLAMIC REPUBLIC OF)',
	'IRQ' => 'IRAQ',
	'IRL' => 'IRELAND',
	'ISR' => 'ISRAEL',
	'ITA' => 'ITALY',
	'JAM' => 'JAMAICA',
	'JPN' => 'JAPAN',
	'JOR' => 'JORDAN',
	'KAZ' => 'KAZAKHSTAN',
	'KEN' => 'KENYA',
	'KIR' => 'KIRIBATI',
	'KWT' => 'KUWAIT',
	'KGZ' => 'KYRGYZSTAN',
	'LAO' => 'LAO PEOPLE\'S DEMOCRATIC REPUBLIC',
	'LVA' => 'LATVIA',
	'LBN' => 'LEBANON',
	'LSO' => 'LESOTHO',
	'LBR' => 'LIBERIA',
	'LBY' => 'LIBYA',
	'LIE' => 'LIECHTENSTEIN',
	'LTU' => 'LITHUANIA',
	'LUX' => 'LUXEMBOURG',
	'MDG' => 'MADAGASCAR',
	'MWI' => 'MALAWI',
	'MYS' => 'MALAYSIA',
	'MDV' => 'MALDIVES',
	'MLI' => 'MALI',
	'MLT' => 'MALTA',
	'MHL' => 'MARSHALL ISLANDS',
	'MRT' => 'MAURITANIA',
	'MUS' => 'MAURITIUS',
	'MEX' => 'MEXICO',
	'FSM' => 'MICRONESIA (FEDERATED STATES OF)',
	'MCO' => 'MONACO',
	'MNG' => 'MONGOLIA',
	'MNE' => 'MONTENEGRO',
	'MAR' => 'MOROCCO',
	'MOZ' => 'MOZAMBIQUE',
	'MMR' => 'MYANMAR',
	'NAM' => 'NAMIBIA',
	'NRU' => 'NAURU',
	'NPL' => 'NEPAL',
	'NLD' => 'NETHERLANDS',
	'NZL' => 'NEW ZEALAND',
	'NIC' => 'NICARAGUA',
	'NER' => 'NIGER',
	'NGA' => 'NIGERIA',
	'NOR' => 'NORWAY',
	'OMN' => 'OMAN',
	'PAK' => 'PAKISTAN',
	'PLW' => 'PALAU',
	'PAN' => 'PANAMA',
	'PNG' => 'PAPUA NEW GUINEA',
	'PRY' => 'PARAGUAY',
	'PER' => 'PERU',
	'PHL' => 'PHILIPPINES',
	'POL' => 'POLAND',
	'PRT' => 'PORTUGAL',
	'QAT' => 'QATAR',
	'KOR' => 'REPUBLIC OF KOREA',
	'MDA' => 'REPUBLIC OF MOLDOVA',
	'ROU' => 'ROMANIA',
	'RUS' => 'RUSSIAN FEDERATION',
	'RWA' => 'RWANDA',
	'KNA' => 'SAINT KITTS AND NEVIS',
	'LCA' => 'SAINT LUCIA',
	'VCT' => 'SAINT VINCENT AND THE GRENADINES',
	'WSM' => 'SAMOA',
	'SMR' => 'SAN MARINO',
	'STP' => 'SAO TOME AND PRINCIPE',
	'SAU' => 'SAUDI ARABIA',
	'SEN' => 'SENEGAL',
	'SRB' => 'SERBIA',
	'SYC' => 'SEYCHELLES',
	'SLE' => 'SIERRA LEONE',
	'SGP' => 'SINGAPORE',
	'SVK' => 'SLOVAKIA',
	'SVN' => 'SLOVENIA',
	'SLB' => 'SOLOMON ISLANDS',
	'SOM' => 'SOMALIA',
	'ZAF' => 'SOUTH AFRICA',
	'SSD' => 'SOUTH SUDAN',
	'ESP' => 'SPAIN',
	'LKA' => 'SRI LANKA',
	'SDN' => 'SUDAN',
	'SUR' => 'SURINAME',
	'SWZ' => 'ESWATINI',
	'SWE' => 'SWEDEN',
	'CHE' => 'SWITZERLAND',
	'SYR' => 'SYRIAN ARAB REPUBLIC',
	'TJK' => 'TAJIKISTAN',
	'THA' => 'THAILAND',
	'MKD' => 'NORTH MACEDONIA',
	'TLS' => 'TIMOR-LESTE',
	'TGO' => 'TOGO',
	'TON' => 'TONGA',
	'TTO' => 'TRINIDAD AND TOBAGO',
	'TUN' => 'TUNISIA',
	'TUR' => 'TURKEY',
	'TKM' => 'TURKMENISTAN',
	'TUV' => 'TUVALU',
	'UGA' => 'UGANDA',
	'UKR' => 'UKRAINE',
	'ARE' => 'UNITED ARAB EMIRATES',
	'GBR' => 'UNITED KINGDOM',
	'TZA' => 'UNITED REPUBLIC OF TANZANIA',
	'USA' => 'UNITED STATES',
	'URY' => 'URUGUAY',
	'UZB' => 'UZBEKISTAN',
	'VUT' => 'VANUATU',
	'VEN' => ['VENEZUELA','VENEZUELA (BOLIVARIAN REPUBLIC OF)'],
	'VNM' => 'VIET NAM',
	'YEM' => 'YEMEN',
	'ZMB' => 'ZAMBIA',
	'ZWE' => 'ZIMBABWE',
};

sub short_names {
	my $self = shift;
	return $self->{short_names} if $self->{short_names};
	
	my %shortnames;
	while (my ($k,$v) = each %{&MEMBERS}) {
		my $name = ref $v eq 'ARRAY' ? $v->[0] : $v;
		my $short = substr($name,0,14);
		$shortnames{$short} = $name;
	}
	$self->{short_names} = \%shortnames;
	
	return $self->{short_names};
}

sub codes {
	my $self = shift;
	
	my %codes;
	for (keys %{&MEMBERS}) {
		my $name = ref MEMBERS->{$_} eq 'ARRAY' ? MEMBERS->{$_}->[0] : MEMBERS->{$_};
		$codes{$name} = $_;
	}
	
	return \%codes;
}

sub hzn_name {
	my ($self,$name) = @_;
	
	my %hzn_names;
	while (my ($k, $v) = each %{&MEMBERS}) {
		if (ref $v eq 'ARRAY') {
			$hzn_names{$v->[0]} = $v->[1] 
		} 
	}
	
	return \%hzn_names;
}


package PDF::Text;
use base 'Class';
#use PDF::API2;

sub text {
	my $self = shift;
	my $file = $self->{params}->{file};
	return $self->{text} if $self->{text};
	die "pdf not found" if ! -e $file;
	chmod 0777, $file; 
	$file = qq/"$file"/;
	$self->{text} = qx|s:/Bin_new/pdftotext -layout -enc UTF-8 $file -| 
		or die qq|Check connection to the S: drive (access to executable "S:\\Bin_new\\pdftotext.exe" is required)\n|;
	return $self->{text};
}

sub chunks {
	my $self = shift;
	return $self->{chunks} if $self->{chunks};
	my @split = map {s/\s+$//r} split(/\s{2,}|\n/, $self->text);
	$self->{chunks} = \@split;
}

package main;
use Data::Dumper;
$Data::Dumper::Indent = 1;
use Getopt::Std;
use List::Util qw/sum first none uniq/;
use Time::Piece;
use Cwd;
use Win32::GUI;
use MARC;

INIT {}

RUN: {
	MAIN(options());
}

sub options {
	my @opts = (
		['h' => 'help'],
		['i:' => 'input file (path)']
	);
	getopts (join('',map {$_->[0]} @opts), \my %opts);
	#if (! %opts || $opts{h}) {
	#	say join ' - ', @$_ for @opts;
	#	exit; 
	#}
	$opts{$_} || die "required opt $_ missing\n" for qw||;
	-e $opts{$_} || die qq|"$opts{$_}" is an invalid path\n| for qw||;
	return \%opts;
}

sub MAIN {
	my $opts = shift;
		
	my @chosen = Win32::GUI::GetOpenFileName(-multisel => 100, -filter => ['PDFs' => '*.pdf']);
	
	my @paths;
	if (@chosen == 1) {
		unless ($chosen[0]) {
			die "No files chosen\n";
		}
		push @paths, shift @chosen;
	} elsif (@chosen > 1) {
		my $dir = shift @chosen;
		push @paths, $_ for map {$dir."/$_"} @chosen;
	} 
	
	my ($ofn,$ofh);
	IO: {
		my @fns = 
			sort 
			map {s/[^\w]/_/gr} 
			map {s/.*\\(.*)\.pdf/$1/r} 
			map {/([^\/]+)$/} 
		@paths;
		@fns = @fns[0,-1] unless @fns == 1;
		$ofn = 'results/'.join('...',@fns).'.mrc';
		
		if (! -e 'results') {
			mkdir 'results' or die $!;
		}
		open $ofh, '>', $ofn or die $!;
	}
	
	FILES: while (my $file = shift @paths) {
		say qq|\nOK. processing "$file"\n|;
		#system qq|start "C:\\Program Files (x86)\\Google\\Chrome\\Application" "$file"|;
	
		print "Please enter the resolution symbol: ";
		my $symbol = <STDIN>;
		chomp $symbol;
		
		convert($file,$symbol,$ofh);
		
		if (@paths > 0) {
			say scalar(@paths).' files remaining. press Enter to continue or Q to quit.';
			my $a = <STDIN>;
			last FILES if $a =~ /^[Qq]/;
		}
	}
	
	$ofn = join('/',getcwd(),$ofn) =~ s|/|\\|gr;
	
	system qq{echo $ofn | clip};
	say qq|The output file path:\n"$ofn"\n...has been automatically copied to your clipboard :D|;
}

sub convert {
	my ($in,$symbol,$ofh) = @_;
	
	my $pdf = PDF::Text->new(file => $in);
	my $members = Members->new;
	my $record = MARC::Record->new;
	my $chunks = $pdf->chunks;
	my (@name,$session);
	
	$record->add_field(MARC::Field->new(tag => '791')->set_sub('a',$symbol));
	
	DRAFT: {
		my $rx = qr/(A\/(\d+)\/(L?)[^\s]+)/;
		my $chunk = first {/$rx/} @$chunks or next;
		$chunk =~ $rx;
		$session = $2;
		my $inds = $3 ? '2 ' : '3 ';
		$record->add_field(MARC::Field->new(tag => '993', inds => $inds)->set_sub('a',$1));
	}
	
	MEETING: {
		my $rx = qr/(\d+)[snrt][tdh] Plenary/i;
		my $chunk = first {/$rx/} @$chunks or next;
		$chunk =~ $rx;
		my $sym = 'A/'.$session.'/PV.'.$1;
		$record->add_field(MARC::Field->new(tag => '952')->set_sub('a',$sym));
	}
	
	RESOLUTION: {
		my $rx = qr/Resolution (\d+)\/(\d+)/;
		my $chunk = first {/$rx/} @$chunks or next; 
		$chunk =~ $rx;
		$record->add_field(MARC::Field->new(tag => '791')->set_sub('a',$1));
	}
	
	DATE: {
		my $rx = qr/Vote Time: ([^\s]+)/; 
		my $chunk = first {/$rx/} @$chunks or next;
		$chunk =~ $rx;
		my $date = $1;
		my @parts = split '/', $date;
		$_ = sprintf '%02d', $_ for @parts;
		$record->add_field(MARC::Field->new(tag => '269')->set_sub('a',join '', @parts[2,0,1]));
	}
	
	TITLE: { 
		for (@$chunks) {
			my $i;
			push @name, $_ if ($i = /Vote Name/ .. /(Yes|No|Abstain)/) && $i > 1 && substr($i,-2) ne 'E0';
		}
		$record->add_field(MARC::Field->new(tag => '245')->set_sub('a',join ' ', @name));
	}
	
	DEFAULTS: {
		my %check = (
			791 => ['','a','RESOLUTION SYMBOL'],
			993 => ['2 ','a','DRAFT SYMBOL'],
			952 => ['','a','MEETING SYMBOL'],
			269 => ['','a','DATE'],
			245 => ['','a','TITLE']
		);
		for my $tag (keys %check) {
			next if $record->has_tag($tag);
			my ($inds,$sub,$field) = @{$check{$tag}};
			warn "> $field not found\n";
			die "The resolution symbol is required\n" if $tag eq "791";
		}
		$record->add_field(MARC::Field->new(tag => '039')->set_sub('a','VOT'));
		$record->add_field(MARC::Field->new(tag => '040')->set_sub('a','NNUN'));
		$record->add_field(MARC::Field->new(tag => '089')->set_sub('a','Voting record')->set_sub('b','B23'));
		$record->add_field(MARC::Field->new(tag => '591')->set_sub('a','RECORDED - No machine generated vote'));
		if (my $field = $record->get_field('791')) {
			$field->set_sub('b','A/')->set_sub('c',$session);
		}
		$record->add_field(MARC::Field->new(tag => '793')->set_sub('a','PLENARY MEETING'));
		$record->add_field(MARC::Field->new(tag => '930')->set_sub('a','VOT'));
		my $date = first {$_} $record->get_values('269','a');
		$record->add_field(MARC::Field->new(tag => '992')->set_sub('a',$date));
		# 000
		$record->record_status('n');
		$record->type_of_record('a');
		$record->bibliographic_level('m');
		$record->encoding_level('#');
		$record->descriptive_cataloging_form('a');
		$record->multipart_resource_record_level(' ');
		# 008
		$record->date_entered_on_file(substr $date,2);
		$record->date_1(substr $date,0,4);
		$record->date_2(' ' x 4);
		$record->place_of_publication_production_or_execution('usa');
		$record->illustrations(' ' x 4);
		$record->nature_of_contents(' ' x 4);
		$record->target_audience('#');
		$record->form_of_item('r');
		$record->government_publication(' ');
		$record->biography(' ');
		$record->language('eng');
		$record->modified_record(' ');
		$record->type_of_date_publication_status('s');
		$record->cataloging_source('d');
	}
	
	my %results;
	VOTES: {
		my (%seen,$memcount);
		CHUNKS: for my $chunk (sort {$a =~ s/[YNA] //r cmp $b =~ s/[YNA] //r} @{$pdf->chunks}) {
			my ($vote,$text);
			if ($chunk =~ /^([YNA]) /) {
				$vote = $1;
				$text = substr $chunk,2;
			} else {
				$vote = 'X';
				$text = $chunk;
			}
			my $short_name = substr $text,0,14;
			my $member = $members->short_names->{$short_name};		
			
			if ($member) {
				{
					# this handles false-positive strings REPUBLIC OF KOREA and CONGO.
					# it only works because in both cases their second appearance is the false one
					next CHUNKS if $seen{$member}; 
					$seen{$member} = 1;
				}
				$memcount++;
				my $tag;
				if ( $record->tag_count('967') < 65 ) {
					$tag = '967';
				} elsif ( $record->tag_count('968') < 65 ) {
					$tag = '968';
				} else  {
					$tag = '969';
				}
				my $field = MARC::Field->new(tag => $tag);
				$field->set_sub('a',$memcount);
				$field->set_sub('c',$members->codes->{$member});
				$field->set_sub('d',$vote) unless $vote eq 'X';
				$field->set_sub('e',$members->hzn_name->{$member} // $member);
				$record->add_field($field);
				$results{$vote}++;
				
			} else {
				#say $chunk;
			}
		}	
		my @unseen;
		for my $mem (sort values %{$members->short_names}) {
			push @unseen, $mem if none {$_ eq $mem} keys %seen;
		}
		if (@unseen) {
			die join "\n", 'Did not find:', @unseen, 'The name on the voting sheet may have changed. Please inform the script maintainer.';
		}
	}
	
	RESULTS : {
		$results{$_} //= '0' for qw|Y N A X|;
		my $_996 = MARC::Field->new(tag => '996');
		$_996->set_sub('b',$results{Y});
		$_996->set_sub('c',$results{N});
		$_996->set_sub('d',$results{A});
		$_996->set_sub('e',$results{X});
		$_996->set_sub('f',sum(values %results));
		$record->add_field($_996);
	}
	
	print {$ofh} $record->to_marc21;
	say $record->to_mrk;
}

sub clean_fn {
	# scrub unstable filename characters 
	my $fn = shift;

	$fn =~ s/\//_/g;
	$fn =~ s/\s//g;
	$fn =~ tr/[];/^^&/;
	
	say $fn;
	
	return $fn;
}

END {}

__DATA__
