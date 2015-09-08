# eevblog_santizer
Remove your posts from the EEVBlog forums in bulk.

Licence: GPL v3


Due to increasing bigotry on EEVBlog (both the forums and videos), supported by the site operator, some former users wish to remove their posts in bulk. These scripts automate that process.

First fill in your user ID number in listgen.cmd. You can find it by going to your user page. Adjust the loop to cover as many pages as you need to get all your posts. Execute the script and redirect the output to a file called urls.txt.

Edit parser.pl with your username and password. Run and redirect output to post_urls.txt. This will scan all the URLs generated above and produce links to each post.

Finally edit delete.pl with your username and password. This script will parse post_urls.txt, and systematically delete them all.

Unfortunately the shitty forum software Dave uses doesn't support removing the first post of a thread you created, so you have to manually edit them all to be "[removed]" for something similar.
