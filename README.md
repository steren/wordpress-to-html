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

## TODO

- Figure out how to handle resized images in order to only keep one (the biggest?)
- Generate index page
- Clean and format HTML, use http://www.html-tidy.org/ or pup