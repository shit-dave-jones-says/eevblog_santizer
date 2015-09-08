Enter file contents hereuse warnings;
use LWP;
use HTTP::Cookies;
use HTML::LinkExtractor;
use HTML::TreeBuilder;
use WWW::Mechanize;


my $mech = WWW::Mechanize->new;
$mech->get('http://www.eevblog.com/forum/login/');
$mech->submit_form(with_fields => {
	user		=> 'username',
	passwrd		=> 'password'
});




open (URLLIST, 'urls.txt');
while (<URLLIST>) {
	chomp;

	$mech->get($_);

	#Get all the post links
	my @links = $mech->find_all_links(url_regex => qr/#msg/);
	my @urls = map { $_->[0] } @links;

	#print("# $url\n");
	#print("# Found ", scalar @urls, " posts\n");

	for my $url1 (@urls)
	{
		#my $filename = basename($url1);
		print("$url1\n");
		#$mech->get($url1, ':content_file'=>$filename);
	}
}
close(URLLIST);
