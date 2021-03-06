use Test::More tests => 4;

use_ok ('Net::OpenVPN::ProxyManager::HMA');

SKIP: {
	eval { 
		use LWP::Simple;
		return get('http://www.google.com');
	};
	skip 'No internet connection detected', 3 if $@;
    ok (my $pm_hma = Net::OpenVPN::ProxyManager::HMA->new, 'Instantiate Net::OpenVPN::ProxyManager::HMA object');
	ok (my $servers = $pm_hma->get_servers({ name => 'usa', proto => 'tcp'}), 'Check get_servers method');
	ok ($pm_hma->get_ip_address, 'Check get_ip_address_method');
}
