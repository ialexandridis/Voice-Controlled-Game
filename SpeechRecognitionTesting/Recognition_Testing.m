clc;
clear all;
close all;
load('params.mat');

display('Welcome to Up Down Left Right WORD RECOGNIZER');
randommessg=input('If you are ready to record your speech for testing, press Enter:');
recObj=audiorecorder(8000,16,1);  %(Fs, nBits, channels)
fs=8000;

disp('Start speaking one of the words Up or Down or Left or Right (2 seconds).')
recordblocking(recObj,2); % 2 seconds => 16,000 SAMPLES
disp('Recording Ends');
tic;

x=getaudiodata(recObj);
x=x(1:16000);

windowLength = round(0.025*fs); %25ms window | 200 frames
overlapLength = round(0.019*fs); %19ms overlap | 152 frames

%%  CLIPPING SOUND AND MOVING TO START
xmax = movmax(x,60);
xclipped = x(xmax>0.015); %we keep only values exceeds 0.015
xclipped2 = zeros(16000,1); %create table with full of zeros with size of 16000, as many as the samples of 2 seconds
for i= 1:length(xclipped)
    xclipped2(i,1)=xclipped(i,1);   %paste the signal data from the starting point of time
end
%%
soundsc(xclipped2) %play clipped sound command

win = hamming(windowLength,"periodic");
coeffs = mfcc(xclipped2,fs,"Window",win,"OverlapLength",overlapLength,"NumCoeffs",13,"LogEnergy","ignore");

a=coeffs(1);
%coeffs for input command 
TestMFCCoeffs2=cell(330,1); 
for i=1:330
    a=coeffs(i,1:13);
    a=a';
    TestMFCCoeffs2{i}=a;
end

InputCommand = cell2mat(TestMFCCoeffs2); %cell2mat converted into an ordinary array
avgDown= cell2mat(AvgMFCCTrainDown);
avgUp= cell2mat(AvgMFCCTrainUp);
avgLeft= cell2mat(AvgMFCCTrainLeft);
avgRight= cell2mat(AvgMFCCTrainRight);

min_Left = dtw(avgLeft,InputCommand);
min_Down = dtw(avgDown,InputCommand);
min_Right = dtw(avgRight,InputCommand);
min_Up = dtw(avgUp,InputCommand);

min_Left 
min_Down 
min_Right 
min_Up 
toc 

%less distance equals command matching
if min_Left>=min_Right && min_Down>=min_Right && min_Up>=min_Right
    disp(' ');
    display('YOU SAID:  RIGHT');
elseif min_Left>=min_Down && min_Right>=min_Down && min_Up>=min_Down
    disp(' ');
    display('YOU SAID:  DOWN');
elseif min_Down>=min_Left && min_Right>=min_Left && min_Up>=min_Left
    disp(' ');
    display('YOU SAID:  LEFT'); 
elseif min_Left>=min_Up && min_Down>=min_Up && min_Right>=min_Up
    disp(' ');
    display('YOU SAID:  UP');
end
%ENDS