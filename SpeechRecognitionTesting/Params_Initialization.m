clc;
clear all;
close all; 
load('params.mat');

WordTrainUp=0;
WordTrainDown=0;
WordTrainLeft=0;
WordTrainRight=0;

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

delete('train\up\*.mat')
delete('train\down\*.mat')
delete('train\right\*.mat')
delete('train\left\*.mat')

save('params.mat','WordTrainUp','WordTrainDown','WordTrainLeft','WordTrainRight','AvgMFCCTrainUp','AvgMFCCTrainDown','AvgMFCCTrainLeft','AvgMFCCTrainRight');
display('Training Parameters Initialized');