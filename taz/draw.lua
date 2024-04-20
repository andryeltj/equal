function love.draw()
if remscr == 1 then
lg.setBackgroundColor(.2,.6,1)
elseif delscr == 1 then
lg.setBackgroundColor(.9,.1,.17)
else
lg.setBackgroundColor(bgcolor[bknum])
end
lg.setColor(.2,.2,.2,.9)
lg.rectangle("fill",200,0,260,480)
lg.setColor(0,0,0,.3)
lg.rectangle("line",201,0,258,482)
lg.setFont(fontsystem)
lg.setColor(.3,.3,.3,.9)
lg.rectangle("fill",0,0,200,80)

if numshow == 7 then lg.setColor(1,1,1,.15);lg.rectangle("fill",3,93,65,18) end
if numshow == 8 then lg.setColor(1,1,1,.15);lg.rectangle("fill",68,93,65,18) end
if numshow == 9 then lg.setColor(1,1,1,.15);lg.rectangle("fill",133,93,65,18) end
if numshow == 4 then lg.setColor(1,1,1,.15);lg.rectangle("fill",3,113,65,18) end
if numshow == 5 then lg.setColor(1,1,1,.15);lg.rectangle("fill",68,113,65,18) end
if numshow == 6 then lg.setColor(1,1,1,.15);lg.rectangle("fill",133,113,65,18) end
if numshow == 1 then lg.setColor(1,1,1,.15);lg.rectangle("fill",3,133,65,18) end
if numshow == 2 then lg.setColor(1,1,1,.15);lg.rectangle("fill",68,133,65,18) end
if numshow == 3 then lg.setColor(1,1,1,.15);lg.rectangle("fill",133,133,65,18) end
if numshow == 0 then lg.setColor(1,1,1,.15);lg.rectangle("fill",68,153,65,18) end

if copy == 1 then lg.setColor(1,1,1,.1);lg.rectangle("fill",0,45,200,35) end


if textshadow == 1 then
lg.setColor(0,0,0)
lg.print("7",32,90)
lg.print("8",92,90)
lg.print("9",152,90)
lg.print("4",32,110)
lg.print("5",92,110)
lg.print("6",152,110)
lg.print("1",32,130)
lg.print("2",92,130)
lg.print("3",152,130)
lg.print("0",92,150)
--lg.print(Expression,180,50)
end
lg.setColor(1,1,1)
lg.setFont(fontsystem)
lg.print("7",32,90)
lg.print("8",92,90)
lg.print("9",152,90)
lg.print("4",32,110)
lg.print("5",92,110)
lg.print("6",152,110)
lg.print("1",32,130)
lg.print("2",92,130)
lg.print("3",152,130)
lg.print("0",92,150)
lg.setFont(fontdisplay)
lg.printf(calExpression,5,4,160,"left")
lg.printf(resultado,95,4,80,"right")
lg.printf(Expression,0,40,195,"right")
lg.setFont(fontdings)
lg.printf(tabstxt,0,160,205,"center")
lg.setFont(fontsystem);lg.setColor(0,0,0,.5);lg.printf(qtex,0,0,200,"right")
lg.setFont(fontdisplay)
lg.setColor(0,0,0,0)
if bthistory == 1 then lg.setColor(1,1,1,.3) elseif bthistory == 2 then lg.setColor(0,0,0,.3) end
lg.rectangle("fill",175,21,maindisplaysize,maindisplaysize)
if history == 0 then lg.setColor(0,0,0) else lg.setColor(1,1,1) end
lg.setFont(fontdisplay)
lg.print("꠵",180,15)
if history == 1 then readhistory() end
end