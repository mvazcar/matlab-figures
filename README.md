# Minimalist MATLAB Template for Scientific Figures

A fork of [pmichaillat/matlab-figures](https://github.com/pmichaillat/matlab-figures), Pascal Michaillat's MATLAB template for scientific figures, which carefully follows [best practices for data visualization](https://www.edwardtufte.com/tufte/books_vdqi). This fork keeps his design and packages it so that any project can call it, with two changes described below.

## What this fork changes

The intended change is small and deliberate:

+ **The template is a function.** `figure_style.m` sets the template's defaults for the MATLAB session in one call: Helvetica, black axes and grid, ticks out and short, horizontal grid only, no box, axes line width 1, titles in normal weight, a white 4:3 figure of 8.5 by 6.375 inches, a 24 point font and lines of width 3. Multi-panel figures keep the font and use 8.5 by 6.375 inches per panel.
+ **The palette is Set1.** The qualitative palette is [ColorBrewer's Set1](https://colorbrewer2.org/#type=qualitative&scheme=Set1&n=9), red, blue, green, purple, orange, yellow, brown, pink and gray. It is set as the color order, so unstyled lines and bars take the colors in turn, and returned by name: `s = figure_style(); plot(x, y, 'Color', s.blue)`. The paired and sequential palettes of the original are unchanged.
+ **The output convention is PNG at 300 dpi.** `figure_print.m` saves the current figure, or a given one, at its size in inches: `figure_print('basic.png')`. For a figure larger than the display, which MATLAB clamps a figure to, draw it at a fraction `s` of the sheet with the fonts and lines scaled, `figure_style(24*s, 3*s)`, and pass the sheet in inches, `figure_print(file, fig, 300, sheet)`: it prints at `300/s` dots per inch, the pixels of the sheet at 300 dpi with everything in the proportions drawn.

`figures.m`, the original illustration script, uses both and writes its twelve figures to `figures/` as PNG.

<p>
  <img src="figures/qualitative.png?v=2" alt="Three qualitatively different time series, in blue, red and green" width="49%">
  <img src="figures/above_below.png?v=2" alt="A time series with colored areas above and below a target" width="49%">
</p>

## Usage

+ Clone the repository, and either add its folder to the MATLAB path or copy `figure_style.m` and `figure_print.m` into your project.
+ Call `figure_style` once at the top of each figure script, and `figure_print` to save each figure.
+ Run `figures.m` to reproduce the illustrations in `figures/`, or `publish('figures.m')` to generate an HTML page at `html/figures.html` with the code and its output. Any part of `figures.m` can be used as a starting point.

## Shoutout

All of the design is Pascal Michaillat's: the proportions, the typography, the axes, the grids and the restraint that makes the figures readable. Shoutout to him for the template and for documenting it at [pascalmichaillat.org/d](https://pascalmichaillat.org/d/), where the original figures can be viewed at [pascalmichaillat.org/d.pdf](https://pascalmichaillat.org/d.pdf). This fork only changes the palette and the way the template is called.

## Software

+ The original template was developed using MATLAB R2023B on macOS Sonoma (Apple silicon). This fork was tested with MATLAB R2024b on Windows 11.
+ Other MATLAB releases and operating systems may require minor adjustments. Please report any issues to help improve compatibility.

## License

This repository is licensed under the [MIT License](LICENSE.md).
