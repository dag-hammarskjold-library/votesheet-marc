#!/usr/bin/perl

use strict;
use warnings;
use feature qw|say|;
use Cwd;
use lib '../modules';

package Class;
use Data::Dumper;

sub new {
	my $class = shift;
	my %params = @_; # || die "named arguments required";
	return bless {params => \%params}, $class;
}

package Members;
use base 'Class';

use constant MEMBERS => {
	'AFGHANISTAN' => 'AFG',
	'ALBANIA' => 'ALB',
	'ALGERIA' => 'DZA',
	'ANDORRA' => 'AND',
	'ANGOLA' => 'AGO',
	'ANTIGUA AND BARBUDA' => 'ATG',
	'ARGENTINA' => 'ARG',
	'ARMENIA' => 'ARM',
	'AUSTRALIA' => 'AUS',
	'AUSTRIA' => 'AUT',
	'AZERBAIJAN' => 'AZE',
	'BAHAMAS' => 'BHS',
	'BAHRAIN' => 'BHR',
	'BANGLADESH' => 'BGD',
	'BARBADOS' => 'BRB',
	'BELARUS' => 'BLR',
	'BELGIUM' => 'BEL',
	'BELIZE' => 'BLZ',
	'BENIN' => 'BEN',
	'BHUTAN' => 'BTN',
	'BOLIVIA (PLURINATIONAL STATE OF)' => 'BOL',
	'BOSNIA AND HERZEGOVINA' => 'BIH',
	'BOTSWANA' => 'BWA',
	'BRAZIL' => 'BRA',
	'BRUNEI DARUSSALAM' => 'BRN',
	'BULGARIA' => 'BGR',
	'BURKINA FASO' => 'BFA',
	'BURUNDI' => 'BDI',
	'CABO VERDE' => 'CPV',
	'CAMBODIA' => 'KHM',
	'CAMEROON' => 'CMR',
	'CANADA' => 'CAN',
	'CENTRAL AFRICAN REPUBLIC' => 'CAF',
	'CHAD' => 'TCD',
	'CHILE' => 'CHL',
	'CHINA' => 'CHN',
	'COLOMBIA' => 'COL',
	'COMOROS' => 'COM',
	'CONGO' => 'COG',
	'COSTA RICA' => 'CRI',
	'COTE D\'IVOIRE' => 'CIV',
	'CROATIA' => 'HRV',
	'CUBA' => 'CUB',
	'CYPRUS' => 'CYP',
	'CZECH REPUBLIC' => 'CZE',
	'DEMOCRATIC PEOPLE\'S REPUBLIC OF KOREA' => 'PRK',
	'DEMOCRATIC REPUBLIC OF THE CONGO' => 'COD',
	'DENMARK' => 'DNK',
	'DJIBOUTI' => 'DJI',
	'DOMINICA' => 'DMA',
	'DOMINICAN REPUBLIC' => 'DOM',
	'ECUADOR' => 'ECU',
	'EGYPT' => 'EGY',
	'EL SALVADOR' => 'SLV',
	'EQUATORIAL GUINEA' => 'GNQ',
	'ERITREA' => 'ERI',
	'ESTONIA' => 'EST',
	'ETHIOPIA' => 'ETH',
	'FIJI' => 'FJI',
	'FINLAND' => 'FIN',
	'FRANCE' => 'FRA',
	'GABON' => 'GAB',
	'GAMBIA' => 'GMB',
	'GEORGIA' => 'GEO',
	'GERMANY' => 'DEU',
	'GHANA' => 'GHA',
	'GREECE' => 'GRC',
	'GRENADA' => 'GRD',
	'GUATEMALA' => 'GTM',
	'GUINEA' => 'GIN',
	'GUINEA-BISSAU' => 'GNB',
	'GUYANA' => 'GUY',
	'HAITI' => 'HTI',
	'HONDURAS' => 'HND',
	'HUNGARY' => 'HUN',
	'ICELAND' => 'ISL',
	'INDIA' => 'IND',
	'INDONESIA' => 'IDN',
	'IRAN (ISLAMIC REPUBLIC OF)' => 'IRN',
	'IRAQ' => 'IRQ',
	'IRELAND' => 'IRL',
	'ISRAEL' => 'ISR',
	'ITALY' => 'ITA',
	'JAMAICA' => 'JAM',
	'JAPAN' => 'JPN',
	'JORDAN' => 'JOR',
	'KAZAKHSTAN' => 'KAZ',
	'KENYA' => 'KEN',
	'KIRIBATI' => 'KIR',
	'KUWAIT' => 'KWT',
	'KYRGYZSTAN' => 'KGZ',
	'LAO PEOPLE\'S DEMOCRATIC REPUBLIC' => 'LAO',
	'LATVIA' => 'LVA',
	'LEBANON' => 'LBN',
	'LESOTHO' => 'LSO',
	'LIBERIA' => 'LBR',
	'LIBYA' => 'LBY',
	'LIECHTENSTEIN' => 'LIE',
	'LITHUANIA' => 'LTU',
	'LUXEMBOURG' => 'LUX',
	'MADAGASCAR' => 'MDG',
	'MALAWI' => 'MWI',
	'MALAYSIA' => 'MYS',
	'MALDIVES' => 'MDV',
	'MALI' => 'MLI',
	'MALTA' => 'MLT',
	'MARSHALL ISLANDS' => 'MHL',
	'MAURITANIA' => 'MRT',
	'MAURITIUS' => 'MUS',
	'MEXICO' => 'MEX',
	'MICRONESIA (FEDERATED STATES OF)' => 'FSM',
	'MONACO' => 'MCO',
	'MONGOLIA' => 'MNG',
	'MONTENEGRO' => 'MNE',
	'MOROCCO' => 'MAR',
	'MOZAMBIQUE' => 'MOZ',
	'MYANMAR' => 'MMR',
	'NAMIBIA' => 'NAM',
	'NAURU' => 'NRU',
	'NEPAL' => 'NPL',
	'NETHERLANDS' => 'NLD',
	'NEW ZEALAND' => 'NZL',
	'NICARAGUA' => 'NIC',
	'NIGER' => 'NER',
	'NIGERIA' => 'NGA',
	'NORWAY' => 'NOR',
	'OMAN' => 'OMN',
	'PAKISTAN' => 'PAK',
	'PALAU' => 'PLW',
	'PANAMA' => 'PAN',
	'PAPUA NEW GUINEA' => 'PNG',
	'PARAGUAY' => 'PRY',
	'PERU' => 'PER',
	'PHILIPPINES' => 'PHL',
	'POLAND' => 'POL',
	'PORTUGAL' => 'PRT',
	'QATAR' => 'QAT',
	'REPUBLIC OF KOREA' => 'KOR',
	'REPUBLIC OF MOLDOVA' => 'MDA',
	'ROMANIA' => 'ROU',
	'RUSSIAN FEDERATION' => 'RUS',
	'RWANDA' => 'RWA',
	'SAINT KITTS AND NEVIS' => 'KNA',
	'SAINT LUCIA' => 'LCA',
	'SAINT VINCENT AND THE GRENADINES' => 'VCT',
	'SAMOA' => 'WSM',
	'SAN MARINO' => 'SMR',
	'SAO TOME AND PRINCIPE' => 'STP',
	'SAUDI ARABIA' => 'SAU',
	'SENEGAL' => 'SEN',
	'SERBIA' => 'SRB',
	'SEYCHELLES' => 'SYC',
	'SIERRA LEONE' => 'SLE',
	'SINGAPORE' => 'SGP',
	'SLOVAKIA' => 'SVK',
	'SLOVENIA' => 'SVN',
	'SOLOMON ISLANDS' => 'SLB',
	'SOMALIA' => 'SOM',
	'SOUTH AFRICA' => 'ZAF',
	'SOUTH SUDAN' => 'SSD',
	'SPAIN' => 'ESP',
	'SRI LANKA' => 'LKA',
	'SUDAN' => 'SDN',
	'SURINAME' => 'SUR',
	#'SWAZILAND' => 'SWZ',
	'ESWATINI' => 'SWZ',
	'SWEDEN' => 'SWE',
	'SWITZERLAND' => 'CHE',
	'SYRIAN ARAB REPUBLIC' => 'SYR',
	'TAJIKISTAN' => 'TJK',
	'THAILAND' => 'THA',
	#'THE FORMER YUGOSLAV REPUBLIC OF MACEDONIA' => 'MKD',
	'NORTH MACEDONIA' => 'MKD',
	'TIMOR-LESTE' => 'TLS',
	'TOGO' => 'TGO',
	'TONGA' => 'TON',
	'TRINIDAD AND TOBAGO' => 'TTO',
	'TUNISIA' => 'TUN',
	'TURKEY' => 'TUR',
	'TURKMENISTAN' => 'TKM',
	'TUVALU' => 'TUV',
	'UGANDA' => 'UGA',
	'UKRAINE' => 'UKR',
	'UNITED ARAB EMIRATES' => 'ARE',
	'UNITED KINGDOM' => 'GBR',
	'UNITED REPUBLIC OF TANZANIA' => 'TZA',
	'UNITED STATES' => 'USA',
	'URUGUAY' => 'URY',
	'UZBEKISTAN' => 'UZB',
	'VANUATU' => 'VUT',
	'VENEZUELA' => 'VEN',
	'VIET NAM' => 'VNM',
	'YEMEN' => 'YEM',
	'ZAMBIA' => 'ZMB',
	'ZIMBABWE' => 'ZWE'
};

# use thes map between names as they appear on the sheet to how they should appear in Horizon
use constant TO_HZN => {
	'CZECH REPUBLIC' => 'CZECHIA',
	'VENEZUELA' => 'VENEZUELA (BOLIVARIAN REPUBLIC OF)',
};

sub ids {
	my $self = shift;
	return $self->{ids} if $self->{ids};
	my %ids;
	for (keys %{&MEMBERS}) {
		my $id = substr($_,0,14);
		$ids{$id} = $_;
	}
	$self->{ids} = \%ids;
	return $self->{ids};
}

sub codes {
	my $self = shift;
	return &MEMBERS;
}

sub hzn_name {
	my ($self,$name) = @_;
	return TO_HZN->{$name};
}


package PDF::Text;
use base 'Class';
use File::Slurp;

sub text {
	my $self = shift;
	my $file = $self->{params}->{file};
	return $self->{text} if $self->{text};
	die "pdf not found" if ! -e $file;
	chmod 0777, $file; 
	$file = qq/"$file"/;
	$self->{text} = qx|s:/Bin_new/pdftotext -layout -enc UTF-8 $file -|;
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
use Cwd;
use List::Util qw/sum first none/;
use Time::Piece;

use Win32::GUI;

use MARC;
use Get::Hzn;

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
		
	my @fns;
	
	my @chosen = Win32::GUI::GetOpenFileName(-multisel => 100, -filter => ['PDFs' => '*.pdf']);
	
	if (@chosen == 1) {
		unless ($chosen[0]) {
			die "No files chosen\n";
		}
		push @fns, shift @chosen;
	} elsif (@chosen > 1) {
		my $dir = shift @chosen;
		push @fns, $_ for map {$dir."/$_"} @chosen;
	} 
	
	my $lt = localtime;
	#my $ofn = $lt->ymd().'@'.$lt->hms('-').'.mrc';
	my $ofn = 'results/'.join('-', sort map {s/[^\w]/_/gr} map {s/.*\\(.*)\.pdf/$1/r} @fns).'.mrc';
	
	if (! -e 'results') {
		mkdir 'results' or die $!;
	}
	open my $out, '>', $ofn or die $!;
	
	my @resos;
	
	FILES: while (my $file = shift @fns) {
		say qq|\nOK. processing "$file"\n|;
		system qq|start "C:\\Program Files (x86)\\Google\\Chrome\\Application" "$file"|;
	
		print "Please enter the resolution symbol: ";
		my $symbol = <STDIN>;
		chomp $symbol;
		
		convert($file,$symbol,$out);
		
		if (@fns > 0) {
			say scalar(@fns).' files remaining. press Enter to continue or Q to quit.';
			my $a = <STDIN>;
			last FILES if $a =~ /^[Qq]/;
		}
	}
	
	system qq{echo $ofn | clip};
	say qq|The output file path:\n"$ofn"\n...has been automatically copied to your clipboard :D|;
}

sub convert {
	my ($in,$symbol,$mrc) = @_;
	
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
			my $id = substr $text,0,14;
			my $member = $members->ids->{$id};		
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
				$field->set_sub('e',$members->hzn_name($member) // $member);
				$record->add_field($field);
				$results{$vote}++;
				
			} else {
				#say $chunk;
			}
		}	
		my @unseen;
		for my $mem (sort values %{$members->ids}) {
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
	
	print {$mrc} $record->to_marc21;
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