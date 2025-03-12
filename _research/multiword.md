---
title: "Word Representabilitiy"
excerpt: "A new decidability proof for word representability and a generalization of the notion of word representability "
use_math: true
---

The notion of word-representable graphs has been extensively studied. It is well known that the set of word-representable graphs are exactly the graphs whose edges can be ordered in a semi-transitive manner. Thus the set of word-representable graphs is decidable. This paper gives an alternative and simpler proof of decidability of word-representable graphs. The second part of the paper introduces a notion called multi-word-representability. Many classes of graphs - planar graphs, interval graphs, split graphs, co-bipartite graphs and line graphs - are shown to be two word-representable. An upper bound on the number of words needed to represent colourable graphs has also been calculated.

**Word  Representable Graphs**

<p>Consider the following graph <span
class="math inline"><em>G</em></span> and the word <span
class="math inline"><em>a</em><em>e</em><em>b</em><em>a</em><em>c</em><em>f</em><em>d</em><em>b</em><em>c</em><em>e</em></span>.</p>

Consider the  graph $$G$$ shown in Fig 1. and the word $$aebacfdbce$$.

<script type="text/tikz">
\begin{tikzpicture}
\begin{scope}[xshift=3cm]
% Define nodes with polar coordinates in a loop
\foreach \name/\radius/\angle in {a/2/90, b/2/162, c/2/234, d/2/306, e/2/18} {
    \node[circle, draw] (\name) at ({\radius*cos(\angle)}, {\radius*sin(\angle)}) {\name};
}

\node[circle,draw] (f) at (0,0) {f};
% Define edges in a loop
\foreach \source/\dest in {a/b,b/c,c/d,d/e,e/a, f/b, f/c, f/d,f/e} {
	  \draw (\source) -- (\dest);
}
\end{scope}
\end{tikzpicture}
</script>


<br>

Collaborators:  
- Ahaan Sameer Malhotra
- Sreyas Sasidharan, 
- Sajith Gopalan
- Mrityunjay Singh


[Link](https://link.springer.com/chapter/10.1007/978-3-031-33264-7_13)
