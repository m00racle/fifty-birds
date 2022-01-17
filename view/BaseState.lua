--[[ 
    BaseClass Class
    This is the parent class of all other States classes.
    This is abstract class
    Only consisit of abstract methods to be defined later in the subclasses which inherit from this class.

    This is not interface since the subclass does not have to override each method to define.
    The subclass can just leave the method empty
 ]]

 BaseState = Class{}

--  here are the methods need to be defined later (optional) by the subclass
function BaseState:init() end
function BaseState:enter() end
function BaseState:exit() end
function BaseState:update(dt) end
function BaseState:render() end
