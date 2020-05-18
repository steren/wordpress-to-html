# Wordpress HTML download

This script will download your Wordpress blog on your local machine, and optionnally generate a clean-up version of it.

This is how I exported my personal blogs from wordpress.com to pure HTML+CSS versions ([example](https://github.com/steren/labs) and [another example](https://github.com/steren/blog).

My main motivation was to improve performances of my blog, as well as stop paying for a custom domain or any hostign fee.

It went from this a 19/100 Performance score, tons of injected JavaScript and an unreadable markup:

![before](https://user-images.githubusercontent.com/360895/82164727-dc664f00-9866-11ea-9e30-c65ba5ee25a0.png)

To 100/100 Performance score and super clearn markup:

![after](https://user-images.githubusercontent.com/360895/82164741-f142e280-9866-11ea-9448-fc7d96461431.png)

***Warning**: I sincerely recommend not to use this tool. It is likely that it won't work as you expect, and trying to debug why might make you crazy (mostly due to the use of XSLT to cleanup the HTML)* 

## Preparing your blog for download

- This tool is optimized for the theme "Revelar", [enable it](https://wordpress.com/theme/revelar) for maximum compatibility
- If you want featured images, enable it at `https://wordpress.com/customize/YOUR-BLOG`  then "Content Options"
- Remove sharing actions: `/wp-admin/options-general.php?page=sharing` or `https://wordpress.com/marketing/sharing-buttons/YOUR-BLOG`

## Downloading and cleanup your Wordpress blog

These instructions have only been tested on Linux.

0. Install [pup](https://github.com/ericchiang/pup), the easiest is to run `curl -sf https://gobinaries.com/ericchiang/pup | sh` 

1. Open the `config` file and update with your info

2. Load the config with `source ./config`

3. Run `./dl-wordpress.sh` to download your site in a folder named `site-backup`.

4. Run `./cleanup.sh` to generate a clean-up version of it in a folder named `site` and start a preview server.

5. Open index.html and manually remove the `<li>` that do not point to articles but to full page gallery images.

6. Feel free to edit the HTML templates (Edit `template-header.html` for articles and `template-index-header.html` for the index page). After doing so, re-run step 4. above. Notably, if you want a image grid layout for your index page, replace `<ol class="pages">` with `<ol class="pages grid">` in `template-index-header.html` and enable 

Customze your articles style in `style.css` and the index style in the `<style>` tag of `template-index-header.html`.

## After exporting to HTML

After you've exported your blog, to create new article, you will need to copy paste an existing article, as well as manually update `index.html` with a link to the article.

To make markup changes to your article headers and footers, you will need to use the "Find and Replace in files"feature of your favorite IDE.

## Hosting your blog

Because your blog is now just plain HTML and CSS. You can host it anywhere that is able to serve static files. GitHub pages are great for that, as it allows you to directly publish your blog from where you version its code (GitHub).

## TODO

- Clean-up images that are not used in `<img>` (but are only here because of `<scrset>`)
