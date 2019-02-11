-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here

widget = require("widget")

CenterX = display.contentCenterX
CenterY = display.contentCenterY

--Text
local Title = display.newText("My Fitness Pal", CenterX, 0, native.systemFontBold, 24)
local BMITitle = display.newText("Your BMI", CenterX, 300, native.systemFontBold, 36)
local BMIOutput = display.newText("", CenterX, 400, native.systemFontBold, 24)

--Text Box
local txtBxHeight = native.newTextField(100, CenterY, 100, 40)

txtBxHeight.font = native.newFont(systemFontBold, 24)
txtBxHeight:resizeHeightToFitFont()

local txtBxWeight = native.newTextField(200, CenterY, 100, 40)

txtBxWeight.font = native.newFont(systemFontBold, 24)
txtBxWeight:resizeHeightToFitFont()


--Touch Listener
local function handleButtonEvent( event )
	-- body
	if ("ended" == event.phase ) then
		height = txtBxHeight.text 	
		weight = txtBxWeight.text
	if event.target.name == "calculate" then
		BMIOutput.text = weight/height/height * 10000
end
end
end

--Calculate Button
local btnCalculate = widget.newButton(
{
	label = "Calculate",
	onEvent = handleButtonEvent,
	emboss = false,
	--Properties for a rounded rectangle button
	shape= "roundedRect",
	cornerRadius = 2,
	labelColor = { default={1,1,1}, over={0,0,0,0.5}},
	fillColor = {default={.5,.5,.5,1}, over={.7,0,.7,0,.7,0.4}},
	strokeColor = {default={1,1,1,1}, over={0.8,0.8,1,1}},
	strokeWidth = 4
})
btnCalculate.name = "calculate"
btnCalculate.x = 100

