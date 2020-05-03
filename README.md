# Wordpress HTML download


## Downloading your Wordpress blog

## Preparing your blog for download

- Hide comments: 
  * `/wp-admin/edit.php`
  * Select all
  * Bulk Actions > Edit
  * Comments > Do not allow
  * Apply
- Remove sharing actions on this page `/wp-admin/options-general.php?page=sharing`

## TODO:

- Download things like `https://sterenlabs.files.wordpress.com/2020/03/screenshot-2020-03-04-at-08.20.38.png?w=586&amp;h=390&amp;crop=1`, use `--accept` with a shell match, or `--accept-regex`