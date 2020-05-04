rm -r site || true

#recursively download the site
wget --directory-prefix site-backup --no-verbose --no-host-directories --recursive --adjust-extension --page-requisites --convert-links --span-hosts --domains sterenlabs.files.wordpress.com,labs.steren.fr --accept "html,*.svg,*.jpg*,*.jpeg*,*.png*,*.gif*" https://labs.steren.fr

cp -r site-backup site

cd site
# remove non post pages.
rm -R category comments feed page tag type
# remove index page, we will regenerate it
rm index.html
# delete all "tmp" file generated
find . -type f -name "*.tmp.html" -delete
find . -type f -name "*.tmp" -delete
# delete all AMP folders and pages
find . -type d -name "amp" -exec rm -r {} +
# delete all feed folders and pages
find . -type d -name "feed" -exec rm -r {} +
# clean up HTML (see cleanup.xsl)
find -name '*.html' -exec sh -c 'xsltproc --html ../cleanup.xsl \{} > \{}.new; mv \{}.new \{}' \;
# apply HTML template (see template.xsl)
find -name '*.html' -exec sh -c 'xsltproc ../template.xsl \{} > \{}.new; mv \{}.new \{}' \;

