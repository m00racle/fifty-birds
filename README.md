# fifty-birds

This is the sample project for the CS 50 GAMING from Harvard.

Fifty Bird is a game similar to Flappy Bird build using Lua Programming Language.

Using the Love2D framework to develop game environment.

### UPDATE: 8

This update focus on adding State Machine capablities to the game apps. 

The states will be covered in separate file. This is similar concept like Activity in Android Studio and Views in XCode. Each of those Activity and/or View has its own controller. This is the philisophy I will use to define different state machine. 

Thus state machine will contain two files represent one display render function and the other for the update control functions. I know this will require I to define two state machine one for view and other is for controller. 

However I need to research my way to make the simplest way to make state machine. I need to make sure its functions are fulfilled but adjusted for our design philosophy.

[link to the CS50 update 8 repo gitHub](https://github.com/games50/fifty-bird/tree/master/bird8)

#### NEXT:
- [ ] Make new file for titleState class
- [ ] Make new file for playState class
- [ ] move all relevant play algorithm from main to the playState class
- [ ] Test if the controller for each State can be divided into separate class or file in the Controller directory.
- [ ] connect the StateMachine class to the main class 
- [ ] test if transition between stateMachine are done seamlessly
