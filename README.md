# Merlot ![Bower Version](https://img.shields.io/bower/v/merlot.svg) [![Node Version](https://img.shields.io/npm/v/merlot.svg)](https://www.npmjs.com/package/merlot) ![GitHub License](https://img.shields.io/github/license/hlfcoding/merlot.svg) [![devDependency Status](https://img.shields.io/david/dev/hlfcoding/merlot.svg)](https://david-dm.org/hlfcoding/merlot#info=devDependencies) [![Code Climate](https://codeclimate.com/github/hlfcoding/merlot/badges/gpa.svg)](https://codeclimate.com/github/hlfcoding/merlot)

> Merlot is a fancy page template for GitHub Pages. Want to use it for your own
site? [Fork this repo](https://github.com/hlfcoding/merlot/fork) and add your
own content.

![screenshot](https://cloud.githubusercontent.com/assets/100884/8019015/372f6aee-0bee-11e5-837b-7a1f8fb512a0.png)

## Support

|      Browser       | Chrome | Firefox | Safari | IE | iOS | Android |
|--------------------|--------|---------|--------|----|-----|---------|
| Supported versions | latest | latest  | latest | 9+ | 7+  | 4+      |

## Themes

You can even customize your own theme. The default theme and 'bleu' (pictured
above) come included.

```bash
$ npm install
$ bower install
```

```bash
$ grunt new-theme --theme=pinot-noir
# follow instructions:
$ grunt --theme=pinot-noir
# make edits...
```

```bash
# or if you don't like bleu and want to switch to the default
$ grunt switch-theme
# or to switch to your own
$ grunt switch-theme --theme=pinot-noir
```

## Install

```bash
# or if you want to create a theme
$ npm install merlot
# or to just use current theme (bleu)
$ bower install merlot
# copy files and assets into your project as fit...
```

## Resources

### Sample ST2 Project File

```json
{
  "folders":
  [
    {
      "file_exclude_patterns":
      [
        "*.css*",
        "*.png",
        "*.sketch"
      ],
      "folder_exclude_patterns":
      [
        "node_modules"
      ],
      "path": "merlot"
    }
  ]
}
```
