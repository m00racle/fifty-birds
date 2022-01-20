--[[ 
    BaseState Class
    This is the parent class of all other States classes.
    This is abstract class
    Only consisit of abstract methods to be defined later in the subclasses which inherit from this class.

    This is not interface since the subclass does not have to override each method to define.
    The subclass can just leave the method empty

    UPDATE 2022/01/20:
    The init of each state machine class inheritance must also includes a class of controller. 
 ]]

 BaseState = Class{}

--  here are the methods need to be defined later (optional) by the subclass
function BaseState:init(controller) end
-- This update: Whenever the StateMachine is also defined its controller!
-- the means of defining the controller is making function callback that return BaseController class.

function BaseState:enter() end
function BaseState:exit() end
-- function BaseState:update(dt) end
-- is moved to the BaseController class in Controller directory.
function BaseState:render() end
