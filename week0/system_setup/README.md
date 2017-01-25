# Setting up your Mac for Ruby development

* Open Terminal. It's inside Apps > Utilities (or search for it using
  Spotlight [the maginifying glass in the upper right]).
* Install [Homebrew](http://brew.sh)<sup><a href="#homebrew" id="homebrew-token">1</a></sup>.
	* It'll ask you to download something else - Command Line Tools. Let it.
* Install `rbenv`
  * `brew install rbenv`
  * `echo 'eval "$(rbenv init -)"' >> ~/.bash_profile`
* Install Ruby.
	* `rbenv install 2.3.3`
  * `rbenv global 2.3.3`
* Pop open a new Terminal tab (Command-t) and check your Ruby version.
	* `ruby -v`
	* Should read something similar to `ruby 2.3.3p222 (2016-11-21 revision 56859) [x86_64-darwin16]`. Don't worry about the number after the `p`. We're mainly concerned with making sure we're on Ruby 2.3.3.

## Let's set up git while we're at it

* `brew install git`
* Open a fresh Terminal tab and check the version.
	* `git --version`
	* Should read `git version 2.11.0` (or higher)
    * If it doesn't, try `brew upgrade git`
* Remember when you set up an account on [GitHub](https://www.github.com) (it was in the prework). Well, we need to tell Git who you are there so things will match up later.
	* `git config --global user.name "YOUR NAME"`
	* `git config --global user.email "YOUR EMAIL ADDRESS"` (this should be the same email address you used to sign up for GitHub)
	* `git config --global credential.helper osxkeychain` (rather than go into detail on what this does, [see GitHub's docs](https://help.github.com/articles/caching-your-github-password-in-git/).
    * If you're feeling more adventurous, go with the SSH key approach
      outlined here: <https://help.github.com/articles/adding-a-new-ssh-key-to-your-github-account/>
* Finally, we're going to ignore some Mac-specific files in our git
  commits. Run the follow commands:
  * `echo .DS_Store >> ~/.gitignore_global`
  * `git config --global core.excludesfile ~/.gitignore_global`


# Your editor

With whichever text editor you chose (again, I recommended [Atom](https://atom.io/)), your life will be made considerably easier by installing the command line helpers.

If you're already pretty neckbeardy with a text editor, just stick with that; I'll assume you know what you're doing. And if you're into [Vim](http://www.vim.org) (or would like to be), we can chat offline.

Here's how to install the CLI helpers for Atom:

## Atom

Nothing to see here. `atom` is magically already there all along. If, for some reason, it isn't<sup><a href="#atom-check" id="atom-check-token">2</a></sup> pasting the following into Terminal should do the trick:

`ln -s /Applications/Atom.app/Contents/MacOS/Atom /usr/local/bin/atom`

Or, you should be able to open Atom, and find "Install Shell Scripts" in the Atom menu.

### Tweaking Atom

One of the things that makes Atom powerful is its package system. To
install a bunch of recommended packages that can make your life a bit
easier in the course, run this in Terminal:

`apm stars --user dummied --install`

Packages this will install:

- [atom-beautify](https://atom.io/packages/atom-beautify)
- [atom-prettify](https://atom.io/packages/atom-prettify)
- [atom-wrap-in-tag](https://atom.io/packages/atom-wrap-in-tag)
- [autoclose-html](https://atom.io/packages/autoclose-html)
- [color-picker](https://atom.io/packages/color-picker)
- [linter](https://atom.io/packages/linter)
- [linter-ruby](https://atom.io/packages/linter-ruby)
- [linter-tidy](https://atom.io/packages/linter-tidy)
- [pigments](https://atom.io/packages/pigments)

Review the linked documentation for those when you get a chance to
discover how they're used.

Also:

 - Click Atom > Snippets and paste in after the comments:
  ```
  '.source.js':
    'console.log':
      'prefix': 'log'
      'body': 'console.log(${1:\'test\'})$2'
  '.text.html.basic':
    'bootstrap template':
      'prefix': 'bootstrap',
      'body': """
      <div class="container">
        <div class="row">
          <div class="col-xs-12"></div>
        </div>
      </div>
      """
    'html template':
      'prefix': 'html'
      'body': """
      <!DOCTYPE html>
      <html>
      <head>
        <title>$1</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <!-- Stylesheets go here. -->
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/4.2.0/normalize.min.css" />
        <link rel="stylesheet" type="text/css" href="global.css" />
      </head>
      <body>
        <!-- Content goes here. -->

        <!-- Scripts go here. -->
        <script type="text/javascript" src="https://cdn.polyfill.io/v2/polyfill.min.js?features=fetch"></script>
        <script type="text/javascript" src="global.js"></script>
      </body>
      </html>
      """
  ```

### One other editor set up thing

We're going to be working quite a bit with git, we're going to be writing a ton of commit messages along the way and it'll be handy to use our preferred text editor for creating those messages.

In Terminal:

#### Atom

`git config --global core.editor "atom --wait"`

## Finally, let's tweak our Terminal prompt a bit

In class, it's going to be important that you know where you are in the filesystem before running commands. For instance: It's going to be a nightmare if you `git init` your home directory or `rm -f` (note: try not to do that) a directory you didn't intend.

So, we're going to make your prompt display the entire path to the current directory as so:

In Terminal (presumes Atom):

`atom ~/.bash_profile`

In Atom (or Sublime), paste the following at the top of that file:

```
PS1='\[`[ $? = 0 ] && X=2 || X=1; tput setaf $X`\]\h\[`tput sgr0`\]:$PWD\n\$ '
```

Save, close and open a new Terminal window or tab to see the result.

## Speaking of `rm -rf`

To avoid future headaches, let's get `rm -rf` out of our workflow.

`brew install trash`

trash is a package that moves things to your trash can rather than completely obliterating them.

## Your first Rubygem

So we can have a better formatted Ruby playground, let's go ahead and install [`pry`](http://pryrepl.org/)

`gem install pry`

# PostgreSQL

We won't be using databases until a bit later in class, but let's go ahead and get Postgres set up while we're at it:

`brew install postgresql`

`brew services start postgresql`

# Node

Similarly, we won't be delving into JavaScript until much later, but let's get that prepared while we're at it.

Go here: <https://nodejs.org/en/download/> and download the Mac installer. Click the installer and follow the instructions.


# Other Mac niceties

Since many of you are also new to the Mac, I wanted to throw in some other helpful Mac tips.

None of these are _required_, but they're nice-to-haves.

* **An app launcher:** Hunting around your Mac for a particular application to open gets tedious fast. You can use the built-in Spotlight (typically available via `⌘-Space`). Or you can use a purpose-built app launcher like [Alfred](http://www.alfredapp.com). In general, I find specific app launchers like Alfred (generally available via `Command-Space`) a bit snappier and they tend to have additional features that you might find handy.
* **A password manager:** Maybe by the end of class, you'll want to write your own (but I wouldn't recommend it). In the meantime, you're going to have a ton of passwords floating around and the typical options - one password for them all, or trying to remember them all - are both _horrible_. Password managers such as [1Password](https://agilebits.com/onepassword) (recommended, but pricey - $35-$50 depending on the breaks), [Dashlane](http://lp.dashlane.com/cjv2/?utm_source=adwords&utm_campaign=US_Search_Brand_Exact&utm_medium=15594053097&utm_term=dashlane&gclid=CPWqiLWyl8YCFQYuaQodm0MA1g) or [LastPass](https://lastpass.com)<sup><a href="#lastpass" id="lastpass-token">3</a></sup> will make your life _significantly_ better and much more secure.
* **A better Terminal:** The default Terminal application on your Mac is _fine_, really. But if you want to take it a step further, I can highly recommend [iTerm 2](https://www.iterm2.com). Bonus: It's _free_. Note: Download the test release (iTerm2 3.0.10 beta (OS 10.8+))
* **Dropbox:** We technically don't need this for class, but you'll need it sooner or later (and it's handy to sync data between your Mac and iPhone apps down the road).

## What _not_ to install

There is only a single application I'm going to ask you to _not install_ during class:

[GitHub for Mac](https://mac.github.com).

It's a fine app, but for class purposes, we want to learn Git from the bare metal. That way, said app makes more sense if you decide to use it later.


<ul id="footnotes">
	<li><a href="#homebrew-token" id="homebrew">1</a>: For a bit of background, homebrew is a "package manager" for OSX. Package managers are commonly found on Linux servers and operating system to make the installation of command line programs easier. On the Mac, homebrew does much the same thing. <a href="#homebrew-token">Back</a></li>
	<li><a href="#atom-check-token" id="atom-check">2</a>: If you want to check, type `which atom` into Terminal. <a href="#atom-check-token">Back</a></li>
	<li><a href="#lastpass-token" id="lastpass">3</a>: A quick note on Lastpass: They were <a href="https://blog.lastpass.com/2015/06/lastpass-security-notice.html/">recently hacked</a>, but it's not quite as bad as it sounds since their encryption routines are seemingly strong enough that it would take attackers a very, very long time to crack even one set of passwords. <a href="#lastpass-token">Back</a></li>
</ul>
