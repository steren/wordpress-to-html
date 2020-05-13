# Wordpress HTML download

## Preparing your blog for download

- This tool is optimized for the theme "Revelar", [enable it](https://wordpress.com/theme/revelar) for maximum compatibility
- Hide comments: 
  * `/wp-admin/edit.php`
  * Select all
  * Bulk Actions > Edit
  * Comments > Do not allow
  * Apply
- Remove sharing actions: `/wp-admin/options-general.php?page=sharing` or `https://wordpress.com/marketing/sharing-buttons/YOUR-BLOG`


## Downloading and cleanup your Wordpress blog

1. Run `./dl-wordpress.sh` to download your side

2. Run `./cleanup.sh` to generate a clean-up version of it and start a preview server.

Your site is now in the `site` folder.

Feel free to edit the HTML templates (Edit `template-header.html` for articles and `template-index-header.html` for the index page) as well as customize the s

Customze your articles style in `style.css` and the index style in the `<style>` tag of `template-index-header.html`.

## TODO

- Add blog title as variable.
- Clean-up images that are not used in `<img>` (but are only here because of `<scrset>`)