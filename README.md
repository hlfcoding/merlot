# Merlot

> Merlot is a fancy page template for GitHub Pages. Want to use it for your own
site? [Fork this repo](https://github.com/hlfcoding/merlot/fork) and add your
own content.

![screenshot](https://cloud.githubusercontent.com/assets/100884/7903524/13ef5b56-0794-11e5-8305-d530169615a7.png)

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
