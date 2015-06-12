---
layout: page
title: DAFx 2015
---

This is the companion webpage for the 18th International Conference on Digital Audio Effects submission "Improving the robustness of the iterative solver in state-space modelling of guitar distortion circuitry". The content is likely to change.

Special thanks to Jamie Bridges for kindly providing dry guitar samples.

[**Download all companion content**](https://github.com/bholmesqub/DAFx15/releases/download/v0.1-beta/dafx15_improving.zip)

##Audio samples

###Dry

<table style="width:100%">
	<tr>
		<td>
			Chord:
		</td>
		<td>
			Riff:
		</td>
	</tr>
	<tr>
		<td>
			<audio controls>
			  <source src="https://raw.githubusercontent.com/bholmesqub/DAFx15/gh-pages/audio/chord.wav" type="audio/wav">
			Your browser does not support the audio element.
			</audio> 
		</td>
		<td>
			<audio controls>
			  <source src="https://raw.githubusercontent.com/bholmesqub/DAFx15/gh-pages/audio/riff.wav" type="audio/wav">
			Your browser does not support the audio element.
			</audio> 
		</td>		
	</tr>
</table>

###Asymmetrical Diode Clipper

<table style="width:100%">
	<tr>
		<td>
			Chord (peak voltage @ 4.5V):
		</td>
		<td>
			Riff (peak voltage @ 4.5V):
		</td>
	</tr>
	<tr>
		<td>
			<audio controls>
			  <source src="https://raw.githubusercontent.com/bholmesqub/DAFx15/gh-pages/audio/diode_chord.wav" type="audio/wav">
			Your browser does not support the audio element.
			</audio> 
		</td>
		<td>
			<audio controls>
			  <source src="https://raw.githubusercontent.com/bholmesqub/DAFx15/gh-pages/audio/diode_riff.wav" type="audio/wav">
			Your browser does not support the audio element.
			</audio> 
		</td>		
	</tr>
</table>

###Dallas Rangemaster Treble Booster

<table style="width:100%">
	<tr>
		<td>
			Chord (peak voltage @ 255mV):
		</td>
		<td>
			Riff (peak voltage @ 300mV):
		</td>
	</tr>
	<tr>
		<td>
			<audio controls>
			  <source src="https://raw.githubusercontent.com/bholmesqub/DAFx15/gh-pages/audio/rangemaster_chord.wav" type="audio/wav">
			Your browser does not support the audio element.
			</audio> 
		</td>
		<td>
			<audio controls>
			  <source src="https://raw.githubusercontent.com/bholmesqub/DAFx15/gh-pages/audio/rangemaster_riff.wav" type="audio/wav">
			Your browser does not support the audio element.
			</audio> 
		</td>		
	</tr>
</table>

##SPICE

LTspice IV models for each circuit (right-click save as to download):
 
[Diode Clipper](https://raw.githubusercontent.com/bholmesqub/DAFx15/master/spice/asym_diode_clipper.asc)

[Dallas Rangemaster Treble Booster](https://raw.githubusercontent.com/bholmesqub/DAFx15/master/spice/dallas_rangemaster.asc)

[PNP BJT model for Rangemaster](https://raw.githubusercontent.com/bholmesqub/DAFx15/master/spice/ebers_moll.txt)

##MATLAB

Iterative solver used in simulations:

[numericalsolver.m](https://raw.githubusercontent.com/bholmesqub/DAFx15/master/matlab/numericalsolver.m)