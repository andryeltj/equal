rollx,rolly=0,0
execlick,exerclick,posexec='','',''
execrollup,execrolldn = ''
function mouse(dt)
	mousex, mousey = love.mouse.getPosition( )
	mouseupdate()
end
function love.wheelmoved(x, y)
  rollx,rolly=x,y
  --print(type(execrollup),execrollup)
  if y > 0 then
    if type(execrollup) == "function" then execrollup() end
  elseif y < 0 then
    if type(execrolldn) == "function" then execrolldn() end
  end
end
function mousevent(a,b,posxw,posyh,execin,execout)
  local execin = execin or ""
  local execout = execout or ""
   --print(a,b,posxw,posyh,mousex,mousey)
  if  mousex > a and mousey > b
  and mousex < posxw and mousey < posyh then
    if type(execin) == "function" then execin() end
  else
    if type(execout) == "function" then execout() end
  end
end
function love.mousepressed(x, y, button, istouch)
  --print("clicked",type(execlick))
  pressx,pressy=x,y
  if button == 1 then
    if type(execlick) == "function" and execlick ~= nil then execlick() end
  end
  if button == 2 then
    if type(exerclick) == "function" and exerclick ~= nil then exerclick() end
  end
end
function love.mousereleased( x, y, button, istouch, presses )
  pressx,pressy=0,0
  if button == 1 then if type(posexec) == "function" then posexec() end; execlick = ""
  end
end

function mouseupdate()
  --rollnav=
  --[[
  entrou=(function ()
  execrollup=(function() navplus() end);
  execrolldn=(function() navminus() end);
  end)
  saiu=(function() execrollup,execrolldn = '' end)
  mousevent(0,81,200,480,entrou,saiu)
  ]]
  
  entrou=(function ()
   bthistory=1;
   execlick=(function() bthistory=2; switchHistory(); bthistory=0 end);
  end)
  saiu=(function() execlick = '';bthistory=0 end)
  mousevent(175,21,200,45,entrou,saiu)
  
  entrov=(function ()
    --print('entrou');
    execrollup=(function() navplus() end);
    execrolldn=(function() navminus() end);
  end)
  sait=(function() --print('saiu');
  execrollup = '';execrolldn = '' end)
  mousevent(0,0,200,480,entrov,sait)
end
