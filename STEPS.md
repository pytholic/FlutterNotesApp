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
    * need to configure add notes page *background color* with `isDark` variable from `main_page.dart`