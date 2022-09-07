clc;
clear all;
close all;

trainerClass=input('Please Enter for which Class ("up" or "down" or "left" or "right") you are training:', 's');

recObj=audiorecorder(8000,16,1);  %(Fs, nBits, channels)
fs=8000;

disp('Start speaking.')
recordblocking(recObj,2); % 2 seconds =>16,000 SAMPLES
disp('Recording Ends');
tic;

x=getaudiodata(recObj);
x=x(1:16000); % ONLY WHEN 2 SECONDS! SO THAT THE FRAMES FOR MFCCS COME TO AN INTEGER 330

%%  CLIPPING SOUND AND MOVING TO START
xmax = movmax(x,60);
xclipped = x(xmax>0.015); %we keep only values exceeds 0.015
xclipped2 = zeros(16000,1);  %create table with full of zeros with size of 16000, as many as the samples of 2 seconds
for i= 1:length(xclipped)  
    xclipped2(i,1)=xclipped(i,1); %paste the signal data from the starting point of time
end

%% COEFFICIENTS 
soundsc(xclipped2) %play clipped sound command

windowLength = round(0.025*fs); %25ms window
overlapLength = round(0.019*fs); %19ms overlap

win = hamming(windowLength,"periodic");
coeffs = mfcc(xclipped2,fs,"Window",win,"OverlapLength",overlapLength,"NumCoeffs",13,"LogEnergy","ignore");

a=coeffs(1);
 
MFCCoeffs=cell(330,1);
for i=1:330
    a=coeffs(i,1:13);
    a=a';
    MFCCoeffs{i}=a;
end
display('Coefficients generated');

%% SAVE COMMANDS AS .MAT FILES AND COEFFICIENT AVERAGES
load('params.mat');

%saving audio information of the command to proper folder with its coeffs
if isequal(trainerClass,'up')
    stringpath=strcat(pwd,'\train\up\train',num2str(WordTrainUp+1),'.mat');
    save(stringpath, 'MFCCoeffs','x');
    WordTrainUp=WordTrainUp+1;

elseif isequal(trainerClass,'down')
    stringpath=strcat(pwd,'\train\down\train',num2str(WordTrainDown+1),'.mat');
    save(stringpath, 'MFCCoeffs','x');
    WordTrainDown=WordTrainDown+1;

elseif isequal(trainerClass,'left')
    stringpath=strcat(pwd,'\train\left\train',num2str(WordTrainLeft+1),'.mat');
    save(stringpath, 'MFCCoeffs','x');
    WordTrainLeft=WordTrainLeft+1;
    
elseif isequal(trainerClass,'right')
    stringpath=strcat(pwd,'\train\right\train',num2str(WordTrainRight+1),'.mat');
    save(stringpath, 'MFCCoeffs','x');
    WordTrainRight=WordTrainRight+1;
    
end


% Find the new averages 
AvgMFCCTrainUp=cell(330,1);
AvgMFCCTrainDown=cell(330,1);
AvgMFCCTrainLeft=cell(330,1);
AvgMFCCTrainRight=cell(330,1);

for i=1:330
    AvgMFCCTrainUp{i}=zeros(13,1);
    AvgMFCCTrainDown{i}=zeros(13,1);
    AvgMFCCTrainLeft{i}=zeros(13,1);
    AvgMFCCTrainRight{i}=zeros(13,1);
end

if WordTrainUp~=0  %if there are more than 1 training inputs, calculate the avg coeffs
    for i=1:WordTrainUp
        stringpath=strcat(pwd,'\train\up\train',num2str(i),'.mat');
        load(stringpath);
        for j=1:330
            AvgMFCCTrainUp{j}=(AvgMFCCTrainUp{j})+MFCCoeffs{j};
        end

    end
    for j=1:330
        AvgMFCCTrainUp{j}=AvgMFCCTrainUp{j}./WordTrainUp;
    end
end

if WordTrainDown~=0
    for i=1:WordTrainDown
        stringpath=strcat(pwd,'\train\down\train',num2str(i),'.mat');
        load(stringpath);
        for j=1:330
            AvgMFCCTrainDown{j}=AvgMFCCTrainDown{j}+MFCCoeffs{j};
        end
    end
    for j=1:330
        AvgMFCCTrainDown{j}=AvgMFCCTrainDown{j}./WordTrainDown;
    end
end

if WordTrainLeft~=0
    for i=1:WordTrainLeft
        stringpath=strcat(pwd,'\train\left\train',num2str(i),'.mat');
        load(stringpath);
        for j=1:330
            AvgMFCCTrainLeft{j}=AvgMFCCTrainLeft{j}+MFCCoeffs{j};
        end
    end
    for j=1:330
        AvgMFCCTrainLeft{j}=AvgMFCCTrainLeft{j}./WordTrainLeft;
    end
end

if WordTrainRight~=0
    for i=1:WordTrainRight
        stringpath=strcat(pwd,'\train\right\train',num2str(i),'.mat');
        load(stringpath);
        for j=1:330
            AvgMFCCTrainRight{j}=AvgMFCCTrainRight{j}+MFCCoeffs{j};
        end
    end
    for j=1:330
        AvgMFCCTrainRight{j}=AvgMFCCTrainRight{j}./WordTrainRight;
    end
end
 
%Final Saving
save('params.mat','WordTrainUp','WordTrainDown','WordTrainLeft','WordTrainRight','AvgMFCCTrainUp','AvgMFCCTrainDown','AvgMFCCTrainLeft','AvgMFCCTrainRight');


toc  