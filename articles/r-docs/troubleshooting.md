# Troubleshooting

### Version Problems

In order to follow the examples in this documentation site, you should
have the latest version of `plotly.core` installed (0.1.0), as detailed
in the [Getting
Started](https://msummersgill.github.io/plotly.R.core/articles/r-docs/getting-started.md)
guide. These pages are written for `plotly.core`, which is a different
package from the legacy `plotly` R package: code written for `plotly`
(`plot_ly()`, [`layout()`](https://rdrr.io/r/graphics/layout.html),
`subplot()`, …) will not work here, and vice versa. `plotly.core`
bundles its own copy of the Plotly.js rendering engine, so figures look
the same wherever they are rendered. Read on for details about
troubleshooting `plotly.core` in other environments.

### Import Problems

Most loading problems can be traced back to having multiple or outdated
versions of `plotly.core` installed. It’s often worthwhile to uninstall
before following the [Getting
Started](https://msummersgill.github.io/plotly.R.core/articles/r-docs/getting-started.md)
instructions from scratch. You can run the following commands in the
console to fully remove `plotly.core` before installing again:

    remove.packages('plotly.core')

> Problems can also arise if you have a file named `plotly.core.R` in
> the same directory as the code you are executing.

### Static Image Export Problems

`plotly.core` does not use the `orca` executable.
[`save_image()`](https://msummersgill.github.io/plotly.R.core/reference/save_image.md)
exports figures with headless Chrome (driven by the chromote package).
If export fails because no browser is found, set the `CHROMOTE_CHROME`
environment variable to the complete path of a Chrome or Chromium-based
browser, or download Chrome Headless Shell once with
`chromote::chrome_versions_add("latest-stable", "chrome-headless-shell")`.
See [Static Image
Export](https://msummersgill.github.io/plotly.R.core/articles/r-docs/static-image-export.md)
for details.
