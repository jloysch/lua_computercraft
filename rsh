--print("HEHEHEHEHEHEHEE")
--sleep(3)

rednet.open("right")

local shell_commands = {}
local shell_command_ctr = 1

function add_shell_command(cmdstr, target)
  local commandRelation = {}
  
  table.insert(commandRelation, 1, cmdstr)
  table.insert(commandRelation, 2, target)
  
  table.insert(shell_commands, shell_command_ctr, commandRelation)
  
  shell_command_ctr = shell_command_ctr + 1
  
end

function is_shell_command(cmdstr)

  local commandRelation = {}
  
  for k,v in pairs(shell_commands) do
    commandRelation = v
	
	if (v[1] == cmdstr) then
	  --print("true")
	  return true
	end

  end
  
  return false
  
end

function shell_command_value(cmdstr)
  local commandRelation = {}
  
  for k,v in pairs(shell_commands) do
    commandRelation = v
	
	if (v[1] == cmdstr) then
	  --print("true")
	  return tostring(v[2])
	end

  end
  
  return false
 
end

local registered_computers = {}
local registered_computers_ctr = 1

function register_computer(cid) 
  table.insert(registered_computers, registered_computers_ctr, cid)
  registered_computers_ctr = registered_computers_ctr + 1
end

function is_registered_computer(sid)
  for k, v in pairs(registered_computers) do
    if (tonumber(v) == tonumber(sid)) then
	  return true
	end
  end
  return false
end

add_shell_command("help", "hello")
add_shell_command("shutdown", "os.reboot()")
add_shell_command("execute", "")
add_shell_command("reprog", "")

register_computer(20) --only the programs controller gets to send shell commands to the computers.

function net_listen()
	
		local sid, msg = rednet.receive(1)

		if not (msg == nil) then
		
		  if (is_registered_computer(sid)) then
			local cmd_tokens = {}
			local i = 1

			for word in string.gmatch(msg, '%S+') do
				--print(word)
				table.insert(cmd_tokens , i , word)
				i = i+1
			end
		
		  if (is_shell_command(cmd_tokens[1])) then
		    print(shell_command_value(cmd_tokens[1]))
			
			if (cmd_tokens[1] == "execute") then
			  print("Executing..")
			  local execStr = ""
			  local fmt_ct = 1
			  
			  for i=1, #cmd_tokens do
			    if (cmd_tokens[i] ~= "execute") then
					if (i == (#cmd_tokens)) then
					   execStr = execStr .. cmd_tokens[i]
					else 
					  execStr = execStr .. cmd_tokens[i] .. " "
					end
				end
			  end
			  
			  
			  --[[
			  for k,v in pairs(cmd_tokens) do
			  
			    if (tostring(v) ~= cmd_tokens[1]) then
				
				  if (#cmd_tokens == fmt_ct) then
			        execStr = execStr .. v .. " "
				  else
				    execStr = execStr .. v .. " "
				  end
				end
				
				fmt_ct = fmt_ct + 1
			  end
			  ]]--
			 
			  
			  print("'" .. execStr .. "'")
			  shell.run(execStr)
			elseif (cmd_tokens[1] == "reprog") then
			  print("Writing '" .. cmd_tokens[2] .. "'")
			  local progfile = fs.open("progvar", "w")
			  progfile.write(cmd_tokens[2])
			  progfile.close()
			  term.clear()
			  print("Rewrite complete. Running updated in 5 seconds.")
			  print("NEW PROGRAM > " .. cmd_tokens[2] .. "*")
			  
			  sleep(5)
			  os.reboot()
			else
			  print("Unrecognized query.")
			end
			
		  else
		    print("INTERRUPT: NET MSG > " .. msg)
		  end
		end
	  end
		
end

net_listen()





