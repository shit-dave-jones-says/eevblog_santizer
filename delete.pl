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




open (URLLIST, 'post_urls.txt');
while (<URLLIST>) {
	chomp;

	$mech->get($_);

	#Get all the post links
	my @links = $mech->find_all_links(url_regex => qr/action=delete/);
	my @urls = map { $_->[0] } @links;

	#print("# $url\n");
	#print("# Found ", scalar @urls, " posts\n");
	print("Source: $_\n");
	$_ =~ qr/.*(msg)(.*)$/;
	my $msg = $2;
	print("msgid: $msg\n");

	for my $url1 (@urls)
	{
		if ($url1 =~ /$msg/)
		{
      print("Found: $url1\n");
      $mech->get($url1);
    }
	}
	
	print("\n");
}
close(URLLIST);
