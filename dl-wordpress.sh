rm -r site || true

#recursively download the site
#wget --directory-prefix site-backup --no-verbose --no-host-directories --recursive --adjust-extension --page-requisites --convert-links --span-hosts --domains sterenlabs.files.wordpress.com,labs.steren.fr --accept "html,*.svg,*.jpg*,*.jpeg*,*.png*,*.gif*" https://labs.steren.fr

cp -r site-backup site

cp style.css site/style.css
cp index.css site/index.css
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
# we do not use --html because some tags are not supported by xsltproc
find -name '*.html' -exec sh -c 'xsltproc ../template.xsl \{} > \{}.new; mv \{}.new \{}' \;

# start an index.html file
# we'll populate it alphabetically, so oldest will be at the top for now
echo '</ol>' > index.html.reverse

# Loop over each file and:
# - Update their <title>
# - Add them to index.html

shopt -s globstar
for i in **/*.html; do
    # Extract title (in my case, it's a <h2> in a <header>), clean up newlines and trim whitespaces
    title=$(cat $i | pup 'header h2 text{}' | tr -d '\n' | xargs)
    # Extract first image
    image=$(cat $i | pup 'img:first-of-type attr{src}' | head -1)
    # replace <title> in articles
    sed -i "s/___TITLE___/$title/g" $i
    # Add entry to index.html's list
    # Only Title
    #echo "<li><a href=\"${i%index.html}\">$title</a></li>" >> index.html.reverse
    # Image + title
    # we use &lt; in order to please xsltproc, which doesn like <figure>
    echo "<li><a href=\"${i%index.html}\"><figure><img loading=\"lazy\" src=\"${i%index.html}$image\" alt=\"$title\"></img><figcaption>$title</figcaption></figure></a></li>" >> index.html.reverse

done
echo '<ol>' >> index.html.reverse
# reverse order of all lines, in order to have most recent at the top.
tac index.html.reverse > index.html
rm index.html.reverse

# Apply index template
xsltproc ../template-index.xsl index.html > index.html.new; mv index.html.new index.html
# format index.html
cat index.html | pup -p > index.html.new && mv index.html.new index.html

# Start server for dev
python -m SimpleHTTPServer