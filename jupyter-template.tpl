((*- extends 'article.tplx' -*))

%===============================================================================
% Input
%===============================================================================

((* block input scoped *))
   ((( custom_add_prompt(cell.source | wrap_text(88) | highlight_code(strip_verbatim=True), cell, 'In ', 'incolor') )))
((* endblock input *))

%===============================================================================
% Output
%===============================================================================

% Display stream ouput with coloring
((* block stream *))
    \begin{Verbatim}[commandchars=\\\{\},fontsize=\footnotesize]
((( output.text | wrap_text(86) | escape_latex | ansi2latex )))
    \end{Verbatim}
((* endblock stream *))

%==============================================================================
% Define macro custom_add_prompt() (derived from add_prompt() macro in style_ipython.tplx)
%==============================================================================

((* macro custom_add_prompt(text, cell, prompt, prompt_color) -*))
    ((*- if cell.execution_count is defined -*))
    ((*- set execution_count = "" ~ (cell.execution_count | replace(None, " ")) -*))
    ((*- else -*))
    ((*- set execution_count = " " -*))
    ((*- endif -*))
    ((*- set indention =  " " * (execution_count | length + 7) -*))
\begin{Verbatim}[commandchars=\\\{\},fontsize=\scriptsize]
((( text | add_prompts(first='{\color{' ~ prompt_color ~ '}' ~ prompt ~ '[{\\color{' ~ prompt_color ~ '}' ~ execution_count ~ '}]:} ', cont=indention) )))
\end{Verbatim}
((*- endmacro *))
