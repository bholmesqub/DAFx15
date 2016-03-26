---
layout: post
title: Guitar Signals
---

This page contains the results of a representative guitar signal processed using both New Iterate and Capped Step methods. The guitar signal was captured using the National Instruments USB-6251 data acquisition device, which measured the voltage across the output of a guitar. A G major chord was strummed, resulting in a signal with a peak voltage of 0.979 V. This signal was then processed at 1x oversampling, at which only the New Iterate and Capped Step methods could successfully complete the simulation.

##New Iterate


**N.B.** The New Iterate method used for this comparison has been modified, applying a comparative function to the input of the logarithm in (25) to prevent it from being equal to or less than zero. This additional calculation was not included in the cost calculations in the paper, but was included here as it was required to process the high amplitude signal.


<figure>
	<img src="{{ site.baseurl }}/images/ni.png" alt="New Iterate Method">
	<figcaption>Figure 1 - <i>(Top) The input and output signals of the Rangemaster with a representative guitar signal. (Bottom) The unfiltered and filtered number of iterations performed by the New Iterate method.</i></figcaption>
</figure>

##Capped Step

<figure>
	<img src="{{ site.baseurl }}/images/cs.png" alt="New Iterate Method">
	<figcaption>Figure 1 - <i>(Top) The input and output signals of the Rangemaster with a representative guitar signal. (Bottom) The unfiltered and filtered number of iterations performed by the Capped Step method.</i></figcaption>
</figure> 
