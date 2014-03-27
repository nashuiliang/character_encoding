use Data::Dumper qw(Dumper);
use strict;
use warnings;
require './utf8_zh.pl';

my %ascii = (
  "00000000" => [0, "00", ' '],
  "00000001" => [0, "01", ''],
  "00000010" => [0, "02", ''],
  "00000011" => [0, "03", ''],
  "00000100" => [0, "04", ''],
  "00000101" => [0, "05", ''],
  "00000110" => [0, "06", ''],
  "00000111" => [0, "07", ''],
  "00001000" => [0, "08", ''],
  "00001001" => [0, "09", "\t"],
  "00001010" => [0, "0A", "\n"],
  "00001011" => [0, "0B", ''],
  "00001100" => [0, "0C", ''],
  "00001101" => [0, "0D", ''],
  "00001110" => [0, "0E", ''],
  "00001111" => [0, "0F", ''],
  "00010000" => [0, "10", ''],
  "00010001" => [0, "11", ''],
  "00010010" => [0, "12", ''],
  "00010011" => [0, "13", ''],
  "00010100" => [0, "14", ''],
  "00010101" => [0, "15", ''],
  "00010110" => [0, "16", ''],
  "00010111" => [0, "17", ''],
  "00011000" => [0, "18", ''],
  "00011001" => [0, "19", ''],
  "00011010" => [0, "1A", ''],
  "00011011" => [0, "1B", ''],
  "00011100" => [0, "1C", ''],
  "00011101" => [0, "1D", ''],
  "00011110" => [0, "1E", ''],
  "00011111" => [0, "1F", ''],

  "00100000" => [1, "20", ' '],
  "00100001" => [1, "21", '!'],
  "00100010" => [1, "22", '"'],
  "00100011" => [1, "23", '#'],
  "00100100" => [1, "24", '$'],
  "00100101" => [1, "25", '%'],
  "00100110" => [1, "26", '&amp;'],
  "00100111" => [1, "27", '\''],
  "00101000" => [1, "28", '('],
  "00101001" => [1, "29", ')'],
  "00101010" => [1, "2A", '*'],
  "00101011" => [1, "2B", '+'],
  "00101100" => [1, "2C", ','],
  "00101101" => [1, "2D", '-'],
  "00101110" => [1, "2E", '.'],
  "00101111" => [1, "2F", '/'],
  "00110000" => [1, "30", '0'],
  "00110001" => [1, "31", '1'],
  "00110010" => [1, "32", '2'],
  "00110011" => [1, "33", '3'],
  "00110100" => [1, "34", '4'],
  "00110101" => [1, "35", '5'],
  "00110110" => [1, "36", '6'],
  "00110111" => [1, "37", '7'],
  "00111000" => [1, "38", '8'],
  "00111001" => [1, "39", '9'],
  "00111010" => [1, "3A", ':'],
  "00111011" => [1, "3B", ';'],
  "00111100" => [1, "3C", '&lt;'],
  "00111101" => [1, "3D", '='],
  "00111110" => [1, "3E", '&gt;'],
  "00111111" => [1, "3F", '?'],
  "01000000" => [1, "40", '@'],
  "01000001" => [1, "41", 'A'],
  "01000010" => [1, "42", 'B'],
  "01000011" => [1, "43", 'C'],
  "01000100" => [1, "44", 'D'],
  "01000101" => [1, "45", 'E'],
  "01000110" => [1, "46", 'F'],
  "01000111" => [1, "47", 'G'],
  "01001000" => [1, "48", 'H'],
  "01001001" => [1, "49", 'I'],
  "01001010" => [1, "4A", 'J'],
  "01001011" => [1, "4B", 'K'],
  "01001100" => [1, "4C", 'L'],
  "01001101" => [1, "4D", 'M'],
  "01001110" => [1, "4E", 'N'],
  "01001111" => [1, "4F", 'O'],
  "01010000" => [1, "50", 'P'],
  "01010001" => [1, "51", 'Q'],
  "01010010" => [1, "52", 'R'],
  "01010011" => [1, "53", 'S'],
  "01010100" => [1, "54", 'T'],
  "01010101" => [1, "55", 'U'],
  "01010110" => [1, "56", 'V'],
  "01010111" => [1, "57", 'W'],
  "01011000" => [1, "58", 'X'],
  "01011001" => [1, "59", 'Y'],
  "01011010" => [1, "5A", 'Z'],
  "01011011" => [1, "5B", '['],
  "01011100" => [1, "5C", '\\'],
  "01011101" => [1, "5D", ']'],
  "01011110" => [1, "5E", '^'],
  "01011111" => [1, "5F", '_'],
  "01100000" => [1, "60", '`'],
  "01100001" => [1, "61", 'a'],
  "01100010" => [1, "62", 'b'],
  "01100011" => [1, "63", 'c'],
  "01100100" => [1, "64", 'd'],
  "01100101" => [1, "65", 'e'],
  "01100110" => [1, "66", 'f'],
  "01100111" => [1, "67", 'g'],
  "01101000" => [1, "68", 'h'],
  "01101001" => [1, "69", 'i'],
  "01101010" => [1, "6A", 'j'],
  "01101011" => [1, "6B", 'k'],
  "01101100" => [1, "6C", 'l'],
  "01101101" => [1, "6D", 'm'],
  "01101110" => [1, "6E", 'n'],
  "01101111" => [1, "6F", 'o'],
  "01110000" => [1, "70", 'p'],
  "01110001" => [1, "71", 'q'],
  "01110010" => [1, "72", 'r'],
  "01110011" => [1, "73", 's'],
  "01110100" => [1, "74", 't'],
  "01110101" => [1, "75", 'u'],
  "01110110" => [1, "76", 'v'],
  "01110111" => [1, "77", 'w'],
  "01111000" => [1, "78", 'x'],
  "01111001" => [1, "79", 'y'],
  "01111010" => [1, "7A", 'z'],
  "01111011" => [1, "7B", '{'],
  "01111100" => [1, "7C", '|'],
  "01111101" => [1, "7D", '}'],
  "01111110" => [1, "7E", '~'],

  "01111111" => [0, "7F", "DEL"],

  "10000000" => [1, "80", ''],
  "10000001" => [1, "81", ''],
  "10000010" => [1, "82", ''],
  "10000011" => [1, "83", ''],
  "10000100" => [1, "84", ''],
  "10000101" => [1, "85", ''],
  "10000110" => [1, "86", ''],
  "10000111" => [1, "87", ''],
  "10001000" => [1, "88", ''],
  "10001001" => [1, "89", ''],
  "10001010" => [1, "8A", ''],
  "10001011" => [1, "8B", ''],
  "10001100" => [1, "8C", ''],
  "10001101" => [1, "8D", ''],
  "10001110" => [1, "8E", ''],
  "10001111" => [1, "8F", ''],
  "10010000" => [1, "90", ''],
  "10010001" => [1, "91", ''],
  "10010010" => [1, "92", ''],
  "10010011" => [1, "93", ''],
  "10010100" => [1, "94", ''],
  "10010101" => [1, "95", ''],
  "10010110" => [1, "96", ''],
  "10010111" => [1, "97", ''],
  "10011000" => [1, "98", ''],
  "10011001" => [1, "99", ''],
  "10011010" => [1, "9A", ''],
  "10011011" => [1, "9B", ''],
  "10011100" => [1, "9C", ''],
  "10011101" => [1, "9D", ''],
  "10011110" => [1, "9E", ''],
  "10011111" => [1, "9F", ''],

  "10100000" => [2, "A0", '�'],
  "10100001" => [2, "A1", '¡'],
  "10100010" => [2, "A2", '¢'],
  "10100011" => [2, "A3", '£'],
  "10100100" => [2, "A4", '¤'],
  "10100101" => [2, "A5", '¥'],
  "10100110" => [2, "A6", '¦'],
  "10100111" => [2, "A7", '§'],
  "10101000" => [2, "A8", '¨'],
  "10101001" => [2, "A9", '©'],
  "10101010" => [2, "AA", 'ª'],
  "10101011" => [2, "AB", '«'],
  "10101100" => [2, "AC", '¬'],
  "10101101" => [2, "AD", '�'],
  "10101110" => [2, "AE", '®'],
  "10101111" => [2, "AF", '¯'],
  "10110000" => [2, "B0", '°'],
  "10110001" => [2, "B1", '±'],
  "10110010" => [2, "B2", '²'],
  "10110011" => [2, "B3", '³'],
  "10110100" => [2, "B4", '´'],
  "10110101" => [2, "B5", 'µ'],
  "10110110" => [2, "B6", '¶'],
  "10110111" => [2, "B7", '·'],
  "10111000" => [2, "B8", '¸'],
  "10111001" => [2, "B9", '¹'],
  "10111010" => [2, "BA", 'º'],
  "10111011" => [2, "BB", '»'],
  "10111100" => [2, "BC", '¼'],
  "10111101" => [2, "BD", '½'],
  "10111110" => [2, "BE", '¾'],
  "10111111" => [2, "BF", '¿'],
  "11000000" => [2, "C0", 'À'],
  "11000001" => [2, "C1", 'Á'],
  "11000010" => [2, "C2", 'Â'],
  "11000011" => [2, "C3", 'Ã'],
  "11000100" => [2, "C4", 'Ä'],
  "11000101" => [2, "C5", 'Å'],
  "11000110" => [2, "C6", 'Æ'],
  "11000111" => [2, "C7", 'Ç'],
  "11001000" => [2, "C8", 'È'],
  "11001001" => [2, "C9", 'É'],
  "11001010" => [2, "CA", 'Ê'],
  "11001011" => [2, "CB", 'Ë'],
  "11001100" => [2, "CC", 'Ì'],
  "11001101" => [2, "CD", 'Í'],
  "11001110" => [2, "CE", 'Î'],
  "11001111" => [2, "CF", 'Ï'],
  "11010000" => [2, "D0", 'Ð'],
  "11010001" => [2, "D1", 'Ñ'],
  "11010010" => [2, "D2", 'Ò'],
  "11010011" => [2, "D3", 'Ó'],
  "11010100" => [2, "D4", 'Ô'],
  "11010101" => [2, "D5", 'Õ'],
  "11010110" => [2, "D6", 'Ö'],
  "11010111" => [2, "D7", '×'],
  "11011000" => [2, "D8", 'Ø'],
  "11011001" => [2, "D9", 'Ù'],
  "11011010" => [2, "DA", 'Ú'],
  "11011011" => [2, "DB", 'Û'],
  "11011100" => [2, "DC", 'Ü'],
  "11011101" => [2, "DD", 'Ý'],
  "11011110" => [2, "DE", 'Þ'],
  "11011111" => [2, "DF", 'ß'],
  "11100000" => [2, "E0", 'à'],
  "11100001" => [2, "E1", 'á'],
  "11100010" => [2, "E2", 'â'],
  "11100011" => [2, "E3", 'ã'],
  "11100100" => [2, "E4", 'ä'],
  "11100101" => [2, "E5", 'å'],
  "11100110" => [2, "E6", 'æ'],
  "11100111" => [2, "E7", 'ç'],
  "11101000" => [2, "E8", 'è'],
  "11101001" => [2, "E9", 'é'],
  "11101010" => [2, "EA", 'ê'],
  "11101011" => [2, "EB", 'ë'],
  "11101100" => [2, "EC", 'ì'],
  "11101101" => [2, "ED", 'í'],
  "11101110" => [2, "EE", 'î'],
  "11101111" => [2, "EF", 'ï'],
  "11110000" => [2, "F0", 'ð'],
  "11110001" => [2, "F1", 'ñ'],
  "11110010" => [2, "F2", 'ò'],
  "11110011" => [2, "F3", 'ó'],
  "11110100" => [2, "F4", 'ô'],
  "11110101" => [2, "F5", 'õ'],
  "11110110" => [2, "F6", 'ö'],
  "11110111" => [2, "F7", '÷'],
  "11111000" => [2, "F8", 'ø'],
  "11111001" => [2, "F9", 'ù'],
  "11111010" => [2, "FA", 'ú'],
  "11111011" => [2, "FB", 'û'],
  "11111100" => [2, "FC", 'ü'],
  "11111101" => [2, "FD", 'ý'],
  "11111110" => [2, "FE", 'þ'],
  "11111111" => [2, "FF", 'ÿ'],
);

open my $fp, "< $ARGV[0]" or die $!;
binmode($fp, ":bytes");

my @info = ();
my @result = ();
push(@info, unpack("B*", $_)) for <$fp>;

local $SIG{__WARN__} = sub {die $_[0]};

for(@info){
  my $l = length($_) / 8;
  foreach my $i (0..$l - 1){
    push(@result, substr($_, $i * 8, 8));
  }
}
my @r = ();
for(my $i = 0; $i <= $#result; $i++){
	$result[$i] =~ /^(1*).*$/g;
	my $l = length($1);
	if(!$l){
		push(@r, $ascii{$result[$i]}[2]);
	}else{
		my $s = substr($result[$i], 4, 4) . substr($result[$i + 1], 2, 6) . substr($result[$i + 2], 2, 6);
		my ($sa, $sb) = (substr($s, 0, 8), substr($s, 8, 8));
		$i = $i + 2;
		my $a = $ascii{$sa}[1] . $ascii{$sb}[1];
		push(@r, $utf8_zh::zh{$a});
	}
}
print join("", @r);
