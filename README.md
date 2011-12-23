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

	`gem install morale`

We are working on removing the dependency on the Morale CLI gem and making the integration with TextMate a tighter experience. Stay tuned.

Installation
-------------

	cd ~/Library/"Application Support"/TextMate/Bundles

	# If that directory does not exist, you have to make the directory.
	mkdir ~/Library/"Application Support"/TextMate/Bundles

	git clone git@github.com:brilliantfantastic/morale-tmbundle.git "morale.tmbundle"
	morale projects --change
	
Features
--------

* You can __create Morale tickets__ by highlighting a comment and using the key combination (default is ⇧⌘M) to send the comment to Morale. This will return the identifier for the newly created ticket and add it to the end of the comment in the format of '(#\d)'.

![before the comment is parsed](https://s3.amazonaws.com/github-morale-tmbundle-screenshots/before-create.jpg "")

![after the comment is parsed](https://s3.amazonaws.com/github-morale-tmbundle-screenshots/after-create.jpg "")

* You can __update Morale tickets__ by highlighting a comment with the identifier and using the same key combination for creating the ticket (default is ⇧⌘M) to send the comment to Morale. This will update the ticket with the identifier in the comment. If there is no identifier, a new comment will be created.
* You can __archive Morale tickets__ by highlighting the comment with the identifier and using the key combination (default is ⇧⌫) to archive the comment in Morale. This will delete the comment from the source code.

TODO
----

We want to integrate Morale more into the TextMate bundle and remove the dependency on the Morale gem.

* Add preferences to enter Morale subdomain and sign in to Morale from TextMate
* Set the Morale project for each project opened in TextMate so there is no swapping of projects from the command line
* Window to view the Morale tickets from within TextMate
* Create a language so you can use keywords like TODO, TASK, and BUG within comments to create Morale tickets

Released under the [MIT license](http://www.opensource.org/licenses/mit-license.php).