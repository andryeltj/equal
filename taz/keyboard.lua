function love.keypressed(key)
  for i, v in ipairs(numbers) do
   if key == v then
     --print("'"..resultado.."'",type(resultado), "'"..Expression.."'",type(Expression))
     if resultado == Expression and #tbExpression >= 1 then tbExpression={};resultado="" end
     numshow=v;table.insert(tbExpression,v);todisplay() end
  end
  for i, v in ipairs(numberskp) do
   if key == v then
     if resultado == Expression  and #tbExpression >= 1 then tbExpression={};resultado="" end
     numshow=i-1;table.insert(tbExpression,i-1);todisplay() end
  end
  for i, v in ipairs(operators) do
   if key == v then table.insert(tbExpression,v);todisplay() end
  end
  for i, v in ipairs(operatorskp) do
   if key == v then
    if v == operatorskp[1] then v = operators[1]; end
    if v == operatorskp[2] then v = operators[2]; end
    if v == operatorskp[3] then v = operators[3]; end
    if v == operatorskp[4] then v = operators[4]; end
    table.insert(tbExpression,v);todisplay()
   end
  end
  if key == "return" or key == "kpenter" or key == "kp=" or key == "=" then
  --upbrick()
    if Expression=="" then table.insert(expressions,"=")
    else
      calExpression=Expression
      Expression=""
      calculate()
      todisplay()
      table.insert(expressions,calExpression);table.insert(results,result)
      rwidth,tbline=fontdisplay:getWrap(expressions[#expressions], 160)
      calExpression=tbline[1]..' ='
      qtex=#expressions
      rwidth,tbline=fontdisplay:getWrap(results[#results], 80)
      resultado=tbline[1]
    end
  end
  if key == "backspace" then
    remscr = 1
    if  #tbExpression >= 1 then
    bricks={}
    numbrick=""
    table.remove(tbExpression, #tbExpression)
    todisplay()
    --readexpression()
    end
  end
  if key == "delete" then
    Expression = ""; bricks={};  tbExpression={};calExpression,result,resultado,numbrick="","","","";
    delscr = 1
  end
  if love.keyboard.isDown('lctrl') and key == 'c' then copy=1;love.system.setClipboardText(Expression) end
  if love.keyboard.isDown('lctrl') and key == 's' then local dateTime = os.date("%Y%m%d%H%M%S"); salvar(expressions, "Equal-"..dateTime..".txt") end
  if love.keyboard.isDown('lctrl') and key == 'right' or love.keyboard.isDown('rctrl') and key == 'right' or
     love.keyboard.isDown('lctrl') and key == 't' or love.keyboard.isDown('rctrl') and key == 't'
  then
	numtab=#tbnavtabs+1;
	print("Nova Aba", numtab);
	table.insert(tbTabs,{tbExpression,results,expressions});
	clearmem();
	table.insert(tbnavtabs,"")
	navtabs()
  end
  if key == 'left' then navminus() end
  if key == 'right'  then navplus() end
  if love.keyboard.isDown('lctrl') and key == 'x' or love.keyboard.isDown('rctrl') and key == 'x'
  then	table.remove(tbTabs[numtab]); clearmem(); readtab() end
  if love.keyboard.isDown('lctrl') and key == 'h' or love.keyboard.isDown('rctrl') and key == 'h'
  then switchHistory() end
end
function love.textinput(text)
  if text == operators[5] then print(text); table.insert(tbExpression,operators[5]);todisplay() end
end

function love.keyreleased(key)
   numshow="";delscr,remscr,copy = 0, 0, 0
end
