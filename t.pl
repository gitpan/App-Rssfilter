#!/usr/bin/perl
    use App::Rssfilter::Match::Duplicates;

    use Mojo::DOM;
    my $first_rss = Mojo::DOM->new( <<"End_of_RSS" );
<?xml version="1.0" encoding="UTF-8"?>
<rss>
  <channel>
    <item>
      <link>http://rss.slashdot.org/~r/Slashdot/slashdot/~6/gu7UEWn8onK/is-typing-tiring-your-toes</link>
      <description>type with toes for tighter tarsals</description>
    </item>
    <item>
      <link>http://rss.slashdot.org/~r/Slashdot/slashdot/~9/lloek9InU2p/new-planet-discovered-on-far-side-of-sun</link>
      <description>vulcan is here</description>
    </item>
  </channel>
</rss>
End_of_RSS

    my $second_rss = Mojo::DOM->new( <<"End_of_RSS" );
<?xml version="1.0" encoding="UTF-8"?>
<rss>
  <channel>
    <item>
      <link>http://rss.slashdot.org/~r/Slashdot/slashdot/~3/mnej39gJa9E/new-rocket-to-visit-mars-in-60-days</link>
      <description>setting a new speed record</description>
    </item>
    <item>
      <link>http://rss.slashdot.org/~r/Slashdot/slashdot/~9/lloek9InU2p/new-planet-discovered-on-far-side-of-sun</link>
      <description>vulcan is here</description>
    </item>
  </channel>
</rss>
End_of_RSS

    #print "$_\n" for $first_rss->find( 'item' )->grep( \&App::Rssfilter::Match::Duplicates::match );
    #print "$_\n" for $second_rss->find( 'item' )->grep( \&App::Rssfilter::Match::Duplicates::match );

    # or with an App::Rssfilter::Rule

    use App::Rssfilter::Rule;
    my $dupe_rule = App::Rssfilter::Rule->new(
        condition => 'Duplicates',
        action    => sub { print shift->to_xml, "\n" },
    );
    $dupe_rule->constrain( $first_rss );
    $dupe_rule->constrain( $second_rss );

    # either way, prints

    # <item>
    #   <link>http://rss.slashdot.org/~r/Slashdot/slashdot/~9/lloek9InU2p/new-planet-discovered-on-far-side-of-sun</link>
    #   <description>vulcan is here</description>
    # </item>
