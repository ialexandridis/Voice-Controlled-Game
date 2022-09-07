# Voice-Controlled-Game
###### "Game" folder
>Contains the .mlapp file where you can access and edit/view code and GUI through MATLAB App Designer.

###### "SpeechRecognitionTesting" folder
>**Contains all the .m files that contributed to the final game. More details...**
<sub><br>*Commands_Training.m:<br>
  &nbsp;&nbsp;&nbsp;This program is for adding more training samples into the Speech Database 
  of the Recognizer. 
<br>*Recognition_Testing.m:<br>
  &nbsp;&nbsp;&nbsp;This is the main Speech Recognizer program, which utilizes the training
  samples in the 'train' folder and recognizes speech input.
<br>*Params_Initialization.m:<br>
  &nbsp;&nbsp;&nbsp;This .m file is to be used to initialize the variables and clear all the 
  parameters in the params.mat. So, this clears the total train database.
<br>*params:<br>
  &nbsp;&nbsp;&nbsp;This MATLAB data file stores the variables containing information about
  the number of sample data available for each command in training folder.
  It also stores the average MFCCoefficients of the train data, so that 
  they are ready for use by the recognizer program.</sub>

###### "StandaloneApp" folder
>Cointains the standalone application of the game 'VoiceControlledSnakeGame.exe'
