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

- Remove link in title and time
- Clean-up images that are not used in `<img>` (but are only here because of `<scrset>`)