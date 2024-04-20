tbrollspace={}
tbrollspacechild={}
numroll=0
ch=1
function reloadtbex(a)
  tbExpression={}
  for i=1,#a do
    local c=a:sub(i,i) -- mostra caracter na posicao i
    table.insert(tbExpression,c)
  end
end
function todisplay()
 Expression,va="",""
 for i, v in ipairs(tbExpression) do
   if v == operators[3] then v=opersreplaces[1] end
   if v == operators[4] then v=opersreplaces[2] end
   va=va..v
 end
 vawidth,tblineva=fontdisplay:getWrap(va, 195)
 Expression=tblineva[1]
end
function upbrick(a)
 --print(numbrick,a)
 numbrick=tonumber(numbrick)
 table.insert(bricks, numbrick)
 if a ~= nil then table.insert(bricks, a) end
 --table.insert(bricks, a)
 numbrick=""
 
end

function calculate()
  itemcalc = {}
  itemoper = {}
  tmpres = 0
  numbrick=""
  bricks={}
  for i, v in ipairs(tbExpression) do
   v=tostring(v)
   for j, k in pairs(numbers)   do  if v == k then numbrick=numbrick..k;content=1 end end
   for j, k in pairs(operators)	do	if v == k then upbrick(k) end	end
  end
  upbrick()
  if content == 1 then
  for i,v in pairs(bricks) do
    --print(v,type(v))
    if type(v) == "number" then table.insert(itemcalc, v) end
    if type(v) == "string" then table.insert(itemoper, v) end
  end
  for i,v in pairs(itemoper) do
  --print(v)
    if v == operators[1] then tmpres = itemcalc[1]+itemcalc[2]; itemcalc[1]=tmpres;if #itemcalc >= 3 then table.remove(itemcalc,2) end; end
    if v == operators[2] then tmpres = itemcalc[1]-itemcalc[2]; itemcalc[1]=tmpres;if #itemcalc >= 3 then table.remove(itemcalc,2) end; end
    if v == operators[3] then tmpres = itemcalc[1]*itemcalc[2]; itemcalc[1]=tmpres;if #itemcalc >= 3 then table.remove(itemcalc,2) end; end
    if v == operators[4] then tmpres = itemcalc[1]/itemcalc[2]; itemcalc[1]=tmpres;if #itemcalc >= 3 then table.remove(itemcalc,2) end; end
    if v == operators[5] then tmpres = itemcalc[1]^itemcalc[2]; itemcalc[1]=tmpres;if #itemcalc >= 3 then table.remove(itemcalc,2) end; end
  end
  --print(tmpres,type(tmpres))
  result=tmpres;tmpres=tostring(tmpres)
  reloadtbex(tmpres)
  content=0
  end
end
function retval(a,b)
  if a == "ex" then reloadtbex(expressions[b]);todisplay() end
  if a == "tt" then reloadtbex(tostring(results[b]));todisplay() end
end

function salvar(tabela, nomeArquivo)
    local conteudo = ""
    for chave, valor in pairs(tabela) do
        conteudo = conteudo .. tostring(valor) .. " = "..results[chave].. "\n"
    end
    love.filesystem.write(nomeArquivo, conteudo)
    local savePath = love.filesystem.getSaveDirectory() .. "/" .. nomeArquivo
    love.system.openURL("file://" .. savePath)
end
function readtab()
    clearmem()
    --print("Aba",numtab)
    tbExpression=tbTabs[numtab][1]
    results=tbTabs[numtab][2]
    expressions=tbTabs[numtab][3]
    qtex=#expressions
    todisplay()
    if #expressions >= 1 then
    rwidth,tbline=fontdisplay:getWrap(expressions[#expressions],160)
    calExpression=tbline[1]..' ='
    rwidth,tbline=fontdisplay:getWrap(results[#results], 80)
    resultado=tbline[1]
    end
    navtabs()
end
function navtabs()
  tabstxt=""
  for i, v in pairs(tbnavtabs) do    
    if i == numtab then tbnavtabs[i]=tabssec;bksel() else tbnavtabs[i]=tabsunsec end
    tabstxt=tabstxt..tbnavtabs[i]
  end
end
function bksel()
  bknum=-1
  for i = 0, numtab do
    bknum=bknum+1
    if bknum > #bgcolor then bknum=1 end
  end
end
function readhistory()
  ch=fontdisplay:getHeight()
  rollspace(206,0,440,480,ch)
  height = 0
  for i, v in ipairs(expressions) do
    if i-1 >= 1 then height=height+ch --fontdisplay:getHeight())-20+(i*mag)
    end
    contentWidth=fontdisplay:getWidth(v)
    totWidth=fontdisplay:getWidth(results[i])
    if tbrollspacechild[numroll][2] <= ch*i
    then tbrollspacechild[numroll][2]=(ch*i)+ch; end
    my=tbrollspace[numroll][6]+height
    rmouin=(function() 
      kin=(function()
				lg.setColor(1,1,1,.1);
				lg.rectangle("fill",206+mainfontsize-2,my,contentWidth+4,ch);
				execlick=(function() numex=i;retval("ex",numex);
	  end) end)
      mousevent(206+mainfontsize-2,my,206+mainfontsize+contentWidth+4,my+ch,kin)
      kin=(function()
				lg.setColor(1,1,1,.1);
				lg.rectangle("fill",440-10-totWidth,my,totWidth+5,ch);
				execlick=(function() numex=i;retval("tt",numex);
	  end) end)
      mousevent(440-12-totWidth,my,440-6,my+ch,kin)
      lg.setColor(1,1,1,.1)
    end)
    rmouout=(function() lg.setColor(0,0,0,0) end)
    mousevent(200,my,440,my+ch,rmouin,rmouout)
    lg.rectangle("fill",200,my,240,ch)
    
    lg.setFont(fontdisplay)
    lg.setColor(0,0,0); lg.printf(v.." = ",206+mainfontsize,my+1,250,"left")
    lg.setColor(1,1,1); lg.printf(v.." = ",205+mainfontsize,my,250,"left")
    lg.setColor(0,0,0); lg.printf(results[i],206,my+1,227,"right")
    lg.setColor(1,1,1); lg.printf(results[i],205,my,227,"right")
    lg.setFont(fontsystem);
    lg.setColor(0,0,0); lg.printf(i..": ",206,my+5+1,227,"left")
    --lg.setColor(1,1,1); lg.printf(i..": ",205,my+5,227,"left")
    
    --print(i,(i*mainfontsize)+(i*mag),tbrollspacechild[numroll][2])
  end
end
function switchHistory()
  history=history+1; if history > 1 then history=0 end
  if history == 1 then		love.window.setMode(440, 480)
  elseif history == 0 then	love.window.setMode(200, 180) end
end
function navplus()
  if #tbTabs >= 1 then
  tbTabs[numtab]={tbExpression,results,expressions}
  numtab=numtab+1; if numtab > #tbnavtabs then numtab = #tbnavtabs end
  readtab()
  end
end
function navminus()
  if #tbTabs >= 1 then
  tbTabs[numtab]={tbExpression,results,expressions}
  numtab=numtab-1; if numtab <= 0 then numtab = 1 end
  readtab()
  end
end
function rollspace(x,y,xw,yh,ch)
  local x,y,xw,yh,ch = x or 0,y or 0,xw or 0,yh or 0,ch or 1
  numroll=numroll+1
  if #tbrollspace < numroll
  then table.insert(tbrollspace,{x,y,xw,yh,0,0,ch});table.insert(tbrollspacechild,{0,0, 0,0,0, 0,0,0}) end
  cdsw,cdsh=xw-x,yh-y
  diffh = cdsh-tbrollspacechild[numroll][2]
  if diffh < 0 then diffh=-1*diffh else diffh = 0 end
  unimov=diffh+tbrollspace[numroll][6]
  --print(unimov)
  entrox=(function ()
    execrollup=(function()
     if unimov >= 0 then
       if unimov < ch then tbrollspace[numroll][6]=tbrollspace[numroll][6]-unimov
       else tbrollspace[numroll][6]=tbrollspace[numroll][6]-ch end
     end
    end);
    execrolldn=(function()
     if tbrollspace[numroll][6] < 0 then
       if unimov > diffh then tbrollspace[numroll][6]= 0
       else tbrollspace[numroll][6]=tbrollspace[numroll][6]+ch end
     end
    end);
  end)
  if tbrollspacechild[numroll][2] >= cdsh
  then
    tbrollspacechild[numroll][6]=xw-3
    barhpercent=rulethree2(tbrollspacechild[numroll][2],100,yh)
    runspaceh=yh-rulethree(yh,100,barhpercent)
    barrollpercent=rulethree2(diffh,100,(-1*tbrollspace[numroll][6]))
    tbrollspacechild[numroll][7]=rulethree(runspaceh,100,barrollpercent)
    tbrollspacechild[numroll][8]=rulethree(yh,100,barhpercent)
    lg.setColor(barcolor)
    lg.rectangle("fill",tbrollspacechild[numroll][6],tbrollspacechild[numroll][7],barwidth,tbrollspacechild[numroll][8])
  end
  --saix=(function() execrollup,execrolldn = '' end)
  mousevent(x,y,xw,yh,entrox,saix)
end

function percent(a,b,c)
 local a = a or 0
 local b = b or 100
 local x = (b-a)/c
 return x
end
function rulethree(a,b,d)
 local a = a or 0
 local b = b or 100
 local d = d or 1
--	A	=	B
--	X	=	D
 local x = (a*d)/b
 return x
end
function rulethree2(a,b,c)
 local a = a or 1
 local b = b or 100
 local c = c or 1
--	A	=	B
--	C	=	X
 local x = (c*b)/a
 return x
end
