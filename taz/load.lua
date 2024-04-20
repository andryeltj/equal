function love.load()
 love.window.setMode(200, 180)
 love.window.setTitle("Equal")
 love.window.setIcon(love.image.newImageData("res/equal512.png"))
  notolight = lfs.newFileData("res/NotoSans-Light.ttf")
  notodings = lfs.newFileData("res/NotoSerifJP-Light.otf")
  fontsystem=lg.setNewFont(notolight, mainfontsize)
  fontdisplay=lg.setNewFont(notolight, maindisplaysize)
  fontdings=lg.setNewFont(notodings, mainfontsize)
 numbers={'0', '1', '2', '3', '4', '5', '6', '7', '8', '9'}
 numberskp={'kp0', 'kp1', 'kp2', 'kp3', 'kp4', 'kp5', 'kp6', 'kp7', 'kp8', 'kp9'}
 operators={'+', '-', '*', '/', '^'}
 opersreplaces={'x','÷'}
 operatorskp={'kp+', 'kp-', 'kp*', 'kp/' }
 tabstxt,tabssec,tabsunsec="","•","￮"
 numtab=1
 tbnavtabs={""}
 tbTabs={}
 clearmem()
 bknum=1
 history=0
 bthistory=0
 mag=8
 mousex, mousey = love.mouse.getPosition( )
 numex=1
end
function clearmem()
 tbExpression={}
 expressions={}
 results={}
 Expression=""
 calExpression=""
 numshow=""
 bricks={}
 numbrick=""
 result, resultado,resultadodisplay = "", "", ""
 delscr, remscr, copy,content = 0, 0, 0, 0
 tbrollspace={}
 tbrollspacechild={}
 qtex=""
end