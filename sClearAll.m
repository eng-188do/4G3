%%sClearALL - clears up all points but restores breakpoints.
%from http://stackoverflow.com/questions/12657219/how-to-restore-breakpoints-in-matlab-after-clear-all

%# store breakpoints
tmp = dbstatus;
save('tmp.mat','tmp')

%# clear all
close all
%clear classes %# clears even more than clear all
clc

%# reload breakpoints
load('tmp.mat')
dbstop(tmp)

%# clean up
clear tmp
delete('tmp.mat')