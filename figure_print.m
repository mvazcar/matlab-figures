% =========================================================================
% figure_print: save a figure as PNG at 300 dpi, the convention
%
%   figure_print(file, fig, dpi)
%
% Prints fig, the current figure by default, to the PNG file at dpi dots
% per inch, 300 by default, at the figure's screen size in inches, as
% figure_style sets it. A file name without an extension gets .png.
%
%   figure_print('basic.png')
%   figure_print(fullfile(figdir, 'panels'), fig)
% =========================================================================
function figure_print(file, fig, dpi)

if nargin < 2 || isempty(fig), fig = gcf ; end
if nargin < 3 || isempty(dpi), dpi = 300 ; end
[folder, name, ext] = fileparts(file) ;
if isempty(ext), file = fullfile(folder, [name '.png']) ; end
set(fig, 'PaperPositionMode', 'auto') ;
print(fig, '-dpng', sprintf('-r%d', dpi), file) ;
end
