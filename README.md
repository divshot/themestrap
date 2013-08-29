# Themestrap

**Themestrap** is a simple starter kit for constructing Twitter Bootstrap 3+ themes. It provides the skeleton
for a simple, maintainable theme that always uses code directly from Bootstrap with as little replacement as
possible.

## Themestrap's Philosophy

1. A theme should be built *on top* of the framework, with as little intrusive change as possible.
2. As the framework evolves, a theme should be easily updated to the latest version.

To this end, Themestrap provides you with two simple files to modify: **variables.less**
and **theme.less** (both in the `less` directory). You can tweak any and all of the Bootstrap variables 
in **variables.less** and support any additional code or classes you'd like in **theme.less**. The compiled
theme CSS includes the Bootstrap library and will automatically pick up any overrides from variables.

## Creating a Theme with Themestrap

To create a theme, first start by cloning the Themestrap repository into a directory named for
your theme. We recommend a `bootstrap-theme-THEME_NAME` naming scheme:

    git clone https://github.com/divshot/themestrap.git bootstrap-theme-THEME_NAME
    
Next, you should open `bower.json` and change the package name from `bootstrap-theme-themestrap`
to match what you want your theme to be named. Now you're ready to install dependencies using
[Grunt](http://gruntjs.com) and [Bower](https://github.com/bower/bower) (you must have these
installed).

    npm install
    bower install
    
Now you're ready to go! Simply edit `less/variables.less` and `less/theme.less` to your liking.
When you're ready, just run `grunt` and it will compile and minify the distribution for you.
You can also run `grunt watch` to automatically compile as you work.

## Testing Out Your Theme

We've provided a "Bootstrap Kitchen Sink" HTML file at `examples/kitchen-sink.html` that contains
all of the various components in all of their variations. It may not be 100% exhaustive but it
should give you a good idea of what your theme will look like at a glance.

You can start a development server at `http://localhost:8000` by running `grunt serve`. Your theme will automatically compile while the server is running.

## Deeper Customization

In cases where you need to do a more in-depth overhaul of a portion of Bootstrap's LESS, you may do so by
simply copying over a file from Bootstrap's `less` directory into your theme's `less` directory and then
modifying it as necessary. Example:

    cp bower_components/bootstrap/less/alerts.less less/alerts.less

Because it takes path priority over the Bower-installed Bootstrap LESS, it will automatically override the 
Bootstrap default. In fact, this is how `variables.less` works already...delete it and the default Bootstrap
variables will be back in play.

## Releasing Your Theme

Before you release your theme, you should do a few things:

1. Make sure that you've updated the package name in `bower.json` and filled out your name, the theme name and GitHub repo info
2. Check the `index.html` file – it is generated using the information you supplied in `bower.json`.  To change it to suit your needs, edit the template `/pages/index.html`.
3. Update the `README.md` file to be about your theme

Once you've done that, you should push it up to GitHub. The repository
is already designed to be released directly onto GitHub Pages without an additional intermediary,
so if you push to the `gh-pages` branch you should have a nice way to show off your theme!

Also consider [registering a Bower package](https://github.com/bower/bower#registering-packages).
If you do, remove the `"private": true` property from `bower.json`.

## The Themestrap Gallery

We've created a [gallery of themes built with Themestrap](http://code.divshot.com/themestrap). If you
have created a theme and want to add it to the gallery, just make a pull request to the [gh-pages](https://github.com/divshot/themestrap/tree/gh-pages)
branch of this repository.

## Copyright and license

Copyright 2013 Divshot, Inc. under [the Apache 2.0 license](LICENSE).