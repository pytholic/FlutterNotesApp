# Steps
* Create **Main** page with **App Bar**.
* Create a `toggle` switch button on the main page's app bar to switch between `dark` and `light` modes.
* Create a **Note** model with input fields.
* Create a *Note From* widget.
* Create an **Add Note** using *Note Form* widget..
    * Add **Pick Color** option using `flutter_colorpicker package` in the **Add Note** form page.
        * Can choose between *rgb color picker* or *block*.
    * Fix design of **Add Note** page. Use `padding` to add space between *title* and *description` boxes.
    * Wrapped *title* and *description* fields in `Row()` to add `padding` on the left side.
    * Selecting font style for *title* and *description* text.
    * Passing `isDark` variable from **Main** page to *Add/Edit* page. Pass variable from main page using navigator route and then assign it to new defined variables in the next page. More code detail in `add_edit_note.dart`. Also this [answer](https://stackoverflow.com/a/56744625) helped a lot.)
    * Creating variables for light and dark theme data
    * Using light and dark theme data to customize `AppBar` in *Add Note* page. Also added title text in add note page.
    * Passing same `ThemeData` variables (*lightTheme, darTheme*) from **Main Page** to **Add Edit Page** to customize app bar. 
    * Customized `Save` button theme and dimensions with `ThemeData`.
    * Customized *Back* button `<-` color in the *Add Note* page.
    * Added `Color Pick` icon (*rainbow*) in the app bar on *Add Page*. Will replace **Pick Color** button with this icon.