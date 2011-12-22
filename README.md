Morale TextMate bundle
===========

Description
-----------

Use comments in your source code to act as Morale tickets. This bundle allows you to use TextMate commands to send a comment up to Morale for parsing and return a Morale identifier which is placed next to your comment for reference in Morale.

For more information about Morale see <http://teammorale.com>.

Prerequisites
-------------

1. You must have a Morale account (uh,). You can get one at <http://teammorale.com>.
1. You must have the API enabled on your profile (which is turned off by default).
1. You must install the Morale command line interface gem. You can just run:

	gem install morale

We are working on removing the dependency on the Morale CLI gem and making the integration with TextMate a tighter experience. Stay tuned.

Installation
-------------

	cd ~/Library/"Application Support"/TextMate/Bundles

If that directory does not exist, you have to make the directory.

	mkdir ~/Library/"Application Support"/TextMate/Bundles

	git clone git@github.com:brilliantfantastic/morale-tmbundle.git/morale-tmbundle "morale.tmbundle"
	morale projects --change

Released under the [MIT license](http://www.opensource.org/licenses/mit-license.php).