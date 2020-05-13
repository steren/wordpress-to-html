BLOG_DOMAIN="blog.steren.fr"
FILES_DOMAIN="sterenblog.files.wordpress.com"

rm -r site-backup || true

#recursively download the site
wget --directory-prefix site-backup --no-verbose --no-host-directories --recursive --adjust-extension --page-requisites --convert-links --span-hosts --domains $FILES_DOMAIN,$BLOG_DOMAIN --accept "html,*.svg,*.jpg*,*.jpeg*,*.png*,*.gif*" https://$BLOG_DOMAIN

echo "Blog downloaded,now run ./cleanup.sh"