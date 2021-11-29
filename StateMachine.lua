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