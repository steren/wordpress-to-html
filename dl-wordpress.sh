# for testing only
#rm -r site
#cp -r site-backup site

#recursively download the site
wget --directory-prefix site --no-verbose --no-host-directories --recursive --adjust-extension --page-requisites --convert-links --span-hosts --domains sterenlabs.files.wordpress.com,labs.steren.fr --accept html,svg,jpg,jpeg,png https://labs.steren.fr

cd site
# remove non post pages.
rm -R category comments feed page tag type
# delete all "tmp" file generated
find . -type f -name "*.tmp.html" -delete
find . -type f -name "*.tmp" -delete
# delete all AMP folders and pages
find . -type d -name "amp" -exec rm -r {} +
# delete all feed folders and pages
find . -type d -name "feed" -exec rm -r {} +
# new version of wordpress seems to generate thumbnails for images, delete
find . -type f -name "*?w=*" -delete
#remove all scripts (read doc at http://fhoerni.free.fr/comp/xslt.html)
find -name '*.html' -exec sh -c 'xsltproc --html ../cleanup.xsl \{} > \{}.new; mv \{}.new \{}' \;
# only keep the <article> tag
find -name '*.html' -exec sh -c 'cat \{} | pup 'article' > \{}.new; mv \{}.new \{}' \;
#remove all data- attributes
#TODO
#TODO: merge these 3 in one regexp
#remove all IDs
find -name '*.html' -exec sh -c "sed -i 's/\(<[^>]*\) \+id=\"[^\"]*\"\([^>]*>\)/\1\2/' \{}" \;
#remove all CSS classes
find -name '*.html' -exec sh -c "sed -i 's/\(<[^>]*\) \+class=\"[^\"]*\"\([^>]*>\)/\1\2/' \{}" \;
#remove all CSS styles
find -name '*.html' -exec sh -c "sed -i 's/\(<[^>]*\) \+style=\"[^\"]*\"\([^>]*>\)/\1\2/' \{}" \;