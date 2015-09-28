---
layout: post
title: Nodal DK Matrices
---

This page contains the incidence matrices of the modelled circuits necessary to create Nodal DK models.

LaTeX support is provided by MathJax. If this is not functioning correctly try reloading the page, and if there is still no success the LaTeX form is available in the page source code.

### Asymettrical Diode Clipper

<div>
\begin{align}
	\boldsymbol{N}_R &=
	\begin{pmatrix}
		-1 & 1
	\end{pmatrix}\\
	\boldsymbol{N}_x &=
	\begin{pmatrix}
		0 & 1
	\end{pmatrix}\\
	\boldsymbol{N}_u &=
	\begin{pmatrix}
		1 & 0
	\end{pmatrix}\\
	\boldsymbol{N}_n &=
	\begin{pmatrix}
		0 & 1
	\end{pmatrix}\\
	\boldsymbol{N}_o &=
	\begin{pmatrix}
		0 & 1
	\end{pmatrix}\\

\end{align}
</div>

### Dallas Rangemaster

<div>
\begin{align}
	\boldsymbol{N}_R &= 
	\begin{pmatrix}
		0 & -1 & 1 &  0 &  0 & 0 & 0 \\
		0 &  1 & 0 &  0 &  0 & 0 & 0 \\
		0 &  0 & 0 &  0 &  0 & 1 & 0 \\
		0 &  0 & 1 & -1 &  0 & 0 & 0 \\
		0 &  0 & 0 &  1 & -1 & 0 & 0 \\
		0 &  0 & 0 &  0 &  0 & 0 & 1 
	\end{pmatrix}
	\\[0.6em]
	\boldsymbol{N}_x &= 
	\begin{pmatrix}
		0 &  0 & 1 & 0 & 0 & 0 &  0 \\
		1 & -1 & 0 & 0 & 0 & 0 &  0 \\
		0 &  0 & 0 & 0 & 0 & 1 &  0 \\
		0 &  0 & 0 & 1 & 0 & 0 & -1
	\end{pmatrix}
	\\[0.6em]
	\boldsymbol{N}_u &= 
	\begin{pmatrix}
		0 & 0 & -1 & 0 & 0 & 0 & 0 \\
		1 & 0 &  0 & 0 & 0 & 0 & 0
	\end{pmatrix}
	\\[0.6em]
	\boldsymbol{N}_n &= 
	\begin{pmatrix}
		0 & -1 & 0 & 0 &  0 & 1 & 0 \\
		0 &  0 & 0 & 0 & -1 & 1 & 0 
	\end{pmatrix}
	\\[0.6em]
	\boldsymbol{N}_o &= 
	\begin{pmatrix}
		0 & 0 & 0 & 0 & 0 & 0 & 1 \\
	\end{pmatrix}	
\end{align}
</div>
