-- update Bird 8:
-- State machine - a state machine 
-- 
-- Usage:
-- 
-- States are only created as need, to save memory, reduce clean-up bugs and increase speed
--  due to garbage collection takes longer with more data in memory
-- 
-- States are added with a string indentifier and an initialisation function.
-- It is expected the init function, when called, will return a table with:
--  Render, Update, Enter, and Exit methods.
-- 
-- TODO make the state machine class.

-- The states are categorized within its own folder.
-- This is which will define how the looks of the display according to its state.
-- 
-- TODO learn on how each state defined and called into the main 
-- TODO interpret this to our project
--  I think the states are mostly on how to display and control
-- Thus it should be located in view.

StateMachine = Class{}

function StateMachine:init(states)
    -- the states is a table consisting key value dict style list.
    self.empty = {
        render = function() end,
        update = function() end,
        control = function() end,
        enter = function() end,
        exit = function() end
    }
    -- this empty table is to initialize the first time the class is initiated or between transition
    -- basically it gives each function for render, update, enter, exit but does not 
    
    -- now for the list of all "real" states:
    self.states = states or {}
    -- but when first initiated just in case the state is an empty list then set the current state as:
    self.current = self.empty
end

-- now make a function to enable the change and transition from one state to the other:
function StateMachine:change(stateName, enterParams)
    
    -- stateName = callback that return class type BasicStates

    -- make sure the current class is exist in the table 
    -- this stateName is the keyword put as part of the parameter states in the StateMachine class init
    assert(self.states[stateName]) 
    -- if the stateName does not exist as key for the table states the error will be invoked!!

    -- if the stateName is exist then start the transition process
    -- first the old state must transition out 
    self.current:exit()

    -- shift (change) the old state to the new state:
    self.current = self.states[stateName]()
    -- the call seems like passing empty parameter: denotes callback function?

    -- the new state transition in
    self.current:enter(enterParams)
    -- in this transition in the params can be included maybe this is where the init params will be included in the future.

end

function StateMachine:update(dt)
    -- standard update function but now it will be delegated to the states classes
    self.current:update(dt)
end

function StateMachine:render()
    -- similar to above delegating the function to particular state.
    self.current:render()
end

function StateMachine:control(key)
    self.current:control(key)
end