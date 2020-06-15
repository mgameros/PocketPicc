# Pocket Piccolo
Digital Signal Processing SP2020 Project, creating a working digital piccolo using MatLab

## Introduction
The purpose of this project was to create a digital piccolo that will allow me to play my instrument without the risk of damaging my or anyone else’s ears. I wanted the piccolo to be able to play the full range of a piccolo, which is from D6 to C8, or almost 3 octaves.

## Piccolo Harmonics
To get the sound of a piccolo, I needed to figure out how a piccolo generates sound. In my research, I found that a piccolo’s sound is multiple cosine functions added together. Each cosine is generated at a harmonic frequency, which is found by multiplying the target frequency by a number from 1 to 10. For each harmonic, there is a decreasing amplitude on the cosine function. 

## Piccolo Note to Generated Note Comparison
I started creating the sound using the harmonics found in the website I used as my primary source, however, it actually wound up sounding more like a harmonica than an actual piccolo. So I recorded myself playing my piccolo and found the harmonics of the sound using the DFT of the wave. This gave me 4 peaks with the amplitudes of the wave, and I found the true harmonics of the piccolo. Surprisingly, there was a harmonic tone at 1/40 of the desired frequency as well. However, using this combination of harmonics rather than the ones suggested actually made the program sound more like a real piccolo.

## ADSR Window 
The other piece of a piccolo’s sound is what is called an ADSR window. ADSR stands for “Attack, Decay, Sustain, Release.” This window is a sound modifier that imitates how a real instrument would sound. As a player begins blowing air into their instrument, there is a sharp increase in air going into the instrument, before the amount of air reduces slightly, then it sustains until the player wants to stop playing the note, then there is a slow release as the player stops blowing air into the instrument. When modifying the cosine functions with this window, it makes it sound more like a real instrument rather than a computer generated sound. I have the maximum volume set to 0.8 rather than 1 because it was too loud when I was using 1 as the max.
