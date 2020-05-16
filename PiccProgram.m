%% Pocket Piccolo
%
% McKenna Gameros
%
% 14 April 2020
%% Program

clear;
clc;

% The sampling frequencies and time t are the same throughout, so we'll 
% define it here
Fs = 44100;
t = 0:1/Fs:1;

% Get harmonic levels for a piccolo sound
Levels = [0.04216 1 0.02235 0.03738];

% Generate ADSR envelope
% The ADSR envelope is how notes are normally played in instruments: a
% sharp attack at the beginning, a sustain, and then a drop.
% ADSR stands for "Attack, Decay, Sustain, Release"
A=linspace(0,0.8,0.1*(Fs+1));
D=linspace(0.8,0.6,0.15*(Fs+1));
S=linspace(0.6,0.6,0.6*(Fs+1));
R=linspace(0.6,0,0.15*(Fs+1));

ADSR = [A D S R 0];

% Read the note tables in.
low = readtable('Low.csv');
low.Properties.VariableNames{'x___Note'} = 'Note';

mid = readtable('Middle.csv');
mid.Properties.VariableNames{'x___Note'} = 'Note';

high = readtable('High.csv');
high.Properties.VariableNames{'x___Note'} = 'Note';

while 1
    octave = input('Piccolo octave (default middle): ','s');
    if isempty(octave)
        octave = 'M';
    end
    
    note = input('Piccolo note: ');
    
    if octave == 'L' || octave == 'l'
        f = low.Frequency(low.Note == note);
    elseif octave == 'M' || octave == 'm'
        f = mid.Frequency(mid.Note == note);
    elseif octave == 'H' || octave == 'h'
        f = high.Frequency(high.Note == note);
    end
    
    % Generate harmonics
    H1 = Levels(:,1).*cos(2.*pi.*f.*t./40);
    H2 = Levels(:,2).*cos(2.*pi.*f.*t);
    H3 = Levels(:,3).*cos(2.*pi.*2.*f.*t);
    H4 = Levels(:,4).*cos(2.*pi.*3.*f.*t);

    % Generate pitch
    tone = H1+H2+H3+H4;
    note = ADSR.*tone;

    sound(note,Fs);      
end