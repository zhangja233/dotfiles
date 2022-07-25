# My keymap in linux machine
The basic tool is xmodmap. I mapped two alt keys to control to make using control easier in emacs. The two super(or win) keys are mapped to alt for similar reason. On my xps laptop to the right of Alt_R is Control_R, so I also remapped Control_R to alt. See the following table for keycodes to use:

| keycode | original  | modified    |
|:-------:|:---------:|:-----------:|
| 64      | Alt_L     | Control_L   |
| 108     | Alt_R     | Control_R   |
| 133     | Super_L   | Alt_L       |
| 134     | Super_R   | Alt_R       |
| 37      | Control_L | Super_L     |
| 105     | Control_R | Alt_R       |
| 66      | Caps_Lock | Mode_switch |

As can be seen from the table, I mapped Caps_Lock to an extra modifier, since of course, it's got such a premium location. Here are the keybindings I use:

| key            | functionality        |
|:--------------:|:--------------------:|
| `caps-j`       | `-`                  |
| `caps-k`       | `=`                  |
| `caps-l`       | `+`                  |
| `caps-;`       | `(`                  |
| `caps-'`       | `)`                  |
| `caps-u`       | `_`                  |
| `caps-i`       | `^`                  |
| `caps-d`       | `delete`             |
| `caps-n/p/f/b` | `down/up/right/left` |
| `caps-a/e`     | `home/end`           |




# Usage
Run 
```
xmodmap xmodmap.conf
```
