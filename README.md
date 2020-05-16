# Wordpress HTML download

## Preparing your blog for download

- This tool is optimized for the theme "Revelar", [enable it](https://wordpress.com/theme/revelar) for maximum compatibility
- If you want featured images, enable it at `https://wordpress.com/customize/YOUR-BLOG`  then "Content Options"
- Hide comments: 
  * `/wp-admin/edit.php`
  * Select all
  * Bulk Actions > Edit
  * Comments > Do not allow
  * Apply
- Remove sharing actions: `/wp-admin/options-general.php?page=sharing` or `https://wordpress.com/marketing/sharing-buttons/YOUR-BLOG`


## Downloading and cleanup your Wordpress blog

These instructions have only been tested on Linux.

0. Install [pup](https://github.com/ericchiang/pup), the easiest is to run `curl -sf https://gobinaries.com/ericchiang/pup | sh` 

1. Open the `config` file and update with your info

2. Load the config with `source ./config`

3. Run `./dl-wordpress.sh` to download your side

4. Run `./cleanup.sh` to generate a clean-up version of it and start a preview server.

Your site is now in the `site` folder.

Open index.html and manually remove the `<li>` that do not point to articles but to full page gallery images.

Feel free to edit the HTML templates (Edit `template-header.html` for articles and `template-index-header.html` for the index page). After doing so, re-run step 4. above.

Notably, if you want a image grid layout for your index page, replace `<ol class="pages">` with `<ol class="pages grid">` in `template-index-header.html` and enable 

Customze your articles style in `style.css` and the index style in the `<style>` tag of `template-index-header.html`.

## TODO

- Clean-up images that are not used in `<img>` (but are only here because of `<scrset>`)