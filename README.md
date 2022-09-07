# Voice-Controlled-Game
## Files Info
###### [Game](https://github.com/iamjohnalex/Voice-Controlled-Game/tree/main/Game) folder
>Contains the .mlapp file where you can access and edit/view code and GUI through MATLAB App Designer.

###### [SpeechRecognitionTesting](https://github.com/iamjohnalex/Voice-Controlled-Game/tree/main/SpeechRecognitionTesting) folder
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

###### [StandaloneApp](https://github.com/iamjohnalex/Voice-Controlled-Game/tree/main/StandaloneApp) folder
>Cointains the standalone application of the game 'VoiceControlledSnakeGame.exe'
## More
###### Intro
The idea was implemented in the MATLAB R2020b environment and in particular the feature extraction technique from the audio signals using the MFCC method and the Dynamic Time Warping (DTW) algorithm were used to find the shortest distance between the audio signals, which in combination ensure the correct recognition of the command words with which the game works.
###### Methodology
Summary of the steps for the development of the game:<br>
1. Create parameters file
2. Create a knowledge base with the motion commands<br>
&nbsp;&nbsp;&nbsp;2.1.&nbsp;Recording voice commands “up”, “down”, “left”, “right” in 2 second audio files<br>
&nbsp;&nbsp;&nbsp;2.2.&nbsp;Clipping<br>
&nbsp;&nbsp;&nbsp;2.3.&nbsp;Extract and save features from the saved audio files using the MFCC method<br>
&nbsp;&nbsp;&nbsp;2.4.&nbsp;Calculating averages for feature values<br>
3. Generate code for speech recognition<br>
&nbsp;&nbsp;&nbsp;3.1.&nbsp;Record a command word from the microphone to a 2-second audio file<br>
&nbsp;&nbsp;&nbsp;3.2.&nbsp;Extract and save features from the new audio file using the MFCC method<br>
&nbsp;&nbsp;&nbsp;3.3.&nbsp;Finding shortest distance with DTW algorithm<br>
&nbsp;&nbsp;&nbsp;3.4.&nbsp;Show result<br>
4. Code development for the snake game (GUI) and integration of the speech recognition code
