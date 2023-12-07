---@meta

-- ----------------------------------------------------------------------------

---@class norns.ParamSet
params = {}

-- constructor of new paramset.
---@param id string
---@param name string
function params.new(id, name) end

-- ----------------------------------------------------------------------------
-- initialization

-- default reads parameter value from default preset
function params:default() end

-- bang calls action fucntion on all parameters.
function params:bang() end

-- clear reset all state of ParamSet to empty value.
function params:clear() end

-- ----------------------------------------------------------------------------
-- add parameter

-- add adds a gerneric parameter to ParamSet.
-- All other add parameter method wrap this method in some way.
---@param args table # parameter config table, key 'type' and 'id' are required.
---    args can provide an optional 'action' function.
function params:add(args) end

-- add_number adds a number parameter.
---@param id string # identifier with no space
---@param name string # Display name
---@param min number
---@param max number
---@param default number
---@param formatter fun(value: number): string
---@param wrap boolean
function params:add_number(id, name, min, max, default, formatter, wrap) end

-- add_option adds an option parameter.
---@param id string
---@param name string
---@param options any
---@param default any
function params:add_option(id, name, options, default) end

-- add_control adds a control parameter.
---@param id string
---@param name string
---@param controlspec any
---@param formatter any
function params:add_control(id, name, controlspec, formatter) end

-- add_file adds a file parameter.
---@param id string
---@param name string
---@param path string
function params:add_file(id, name, path) end

-- add_text adds a string parameter.
---@param id string
---@param name string
---@param text string
function params:add_text(id, name, text) end

-- add_taper adds a taper parameter.
---@param id string
---@param name string
---@param min number
---@param max number
---@param deffault number
---@param k number
---@param units string
function params:add_taper(id, name, min, max, deffault, k, units) end

-- add_trigger adds a trigger parameter.
---@param id string
---@param name string
function params:add_trigger(id, name) end

-- add_binary adds a binary parameter.
---@param id string
---@param name string
---@param behavior string
---@param dfault number
function params:add_binary(id, name, behavior, dfault) end

-- ----------------------------------------------------------------------------
-- visual pesudo-parameter

-- add_separator adds a separator to ParamSet UI representation.
-- ID and name are optional, separator with id will get an unique index, and
-- can be toggle hiden.
---@param id? string
---@param name? string
function params:add_separator(id, name) end

-- add_group adds a group for parameters. Group can not be nested.
-- ID and name are optional, group with id will get an unique index, and can be
-- toggle hiden.
---@param id? string
---@param name? string
---@param n integer # group id
function params:add_group(id, name, n) end

-- ----------------------------------------------------------------------------
-- meta data

-- print prints string representation on screen.
function params:print() end

-- list prints out all IDs.
function params:list() end

-- string resutns string representation of a parameter. That string is made with
-- formatter bind with parameter.
---@param index number | string # parameter index in parameter list or parameter id
---@return string
function params:string(index) end

---@param index number # parameter index in parameter list
---@return string # get_id gets string id of a parameter.
function params:get_id(index) end

-- t returns type of a parameter.
---@param index number | string # parameter index in parameter list or parameter id
---@return string param_type
function params:t(index) end

-- get_range returns parameter value range with a table.
---@param index number | string # parameter index in parameter list or parameter id
---@return number[] range # { min, max }
function params:get_range(index) end

---@param index number | string # parameter index in parameter list or parameter id
---@return boolean
function params:get_allow_pmap(index) end

-- ----------------------------------------------------------------------------
-- value operation

-- set writes new value to param.
---@param index number | string # parameter index in parameter list or parameter id
---@param v any # new param value
---@param silent? boolean # when false, param action will be called with new, default to false
function params:set(index, v, silent) end

-- set_raw just as `set`, but only works on control type parameters.
---@param index number | string # parameter index in parameter list or parameter id
---@param v any # new param value
---@param silent? boolean # when false, param action will be called with new, default to false
function params:set_raw(index, v, silent) end

-- get reads parameter value
---@param index number | string # parameter index in parameter list or parameter id
---@return any
function params:get(index) end

-- get_raw just as `get`, but only works on control type parameters.
---@param index number | string # parameter index in parameter list or parameter id
---@return any
function params:get_raw(index) end

-- delta sets param by offset.
---@param index number | string # parameter index in parameter list or parameter id
---@param d number # value offset
function params:delta(index, d) end

-- set_actioin binds a function to parameter, function gets called on parameter
-- value is changed. New parameter value will be passed to that function.
---@param index number | string # parameter index in parameter list or parameter id
---@param func fun(value: any)
function params:set_action(index, func) end

--  set_save sets if a parameter should be saved in file.
---@param index number | string # parameter index in parameter list or parameter id
---@param state boolean
function params:set_save(index, state) end

-- ----------------------------------------------------------------------------
--  visibility

-- hide sets a parameter as hiden.
function params:hide(index) end

-- show sets a parameter as shown.
function params:show(index) end

-- visible gets visibility of a parameter.
---@param index number
---@return boolean is_visible
function params:visible(index) end

-- ----------------------------------------------------------------------------
-- preset file operation

-- write stores all parameters to file.
---@param filename? string | number # absolute path or preset index. When number
---    is passed, file will be <scirptname>-<number>.pset under local data
---    directory. When nil is passed, config will be written to <scriptname>.pset
---    file.
---@param name? string
function params:write(filename, name) end

-- read load parameters from file.
---@param filename? string | number # absolute path or preset index. When number
---    is passed, file will be <scirptname>-<number>.pset under local data
---    directory. When nil is passed, index number will read from pset-last.txt
---    under local data directory.
---@param silent boolean
function params:read(filename, silent) end

-- delete removes specified preset file from file system.
---@param filename? string | number # absolute path or preset index. When number
---    is passed, file will be <scirptname>-<number>.pset under local data
---    directory. When nil is passed, file will be [scriptname].pset
---@param name? string
function params:delete(filename, name) end
