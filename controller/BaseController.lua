--[[ 
    BaseController Class
    This is the parent class for controller of each state machine.
    
    I need to build this in separate class to the base state machine to accomodate the possibilities of 
    Control Customization in the future.
 ]]

 BaseController = Class()

--  here are the basic methods to be taken
function BaseController:init() end
function BaseController:isModifiable() end
function BaseController:update(dt) end
function BaseController:modKeyOption() end