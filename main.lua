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
local Title = display.newText("My Fitness Pal", CenterX, 10, native.systemFontBold, 42)
local yourData = display.newText("Your Data", CenterX, 70, native.systemFontBold, 24)
local BMITitle = display.newText("Your BMI", CenterX, 340, native.systemFontBold, 36)
local BMIOutputNumber = display.newText("", CenterX, 400, native.systemFontBold, 30)
local BMIOutputText = display.newText("", CenterX, 450, native.systemFontBold, 28)
local titleHeight = display.newText("Weight:", 70, 190, native.systemFontBold, 20)
local titleWeight = display.newText("Height:", 70, 130, native.systemFontBold, 20)

--Text Box
local txtBxHeight = native.newTextField(210, 130, 150, 40)

txtBxHeight.font = native.newFont(systemFontBold, 24)
txtBxHeight:resizeHeightToFitFont()
txtBxHeight.placeholder = "Height (M)"

local txtBxWeight = native.newTextField(210, 190, 150, 40)

txtBxWeight.font = native.newFont(systemFontBold, 24)
txtBxWeight:resizeHeightToFitFont()
txtBxWeight.placeholder = "Weight (KG)"


--Touch Listener
local function handleButtonEvent( event )
	-- body
	if ("ended" == event.phase ) then
		height = txtBxHeight.text 	
		weight = txtBxWeight.text
	if event.target.name == "calculate" then
		BMI = weight/height/height
		BMI = math.round(BMI)

	if BMI <18 then
		BMIOutputText.text = ("Underweight")
		BMIOutputText:setTextColor(0,0,1)
		BMIOutputNumber.text = (BMI)
	elseif BMI <25 then
		BMIOutputText.text = ("Normal")
		BMIOutputText:setTextColor(0,1,0)
		BMIOutputNumber.text = (BMI)
	elseif BMI <30 then
		BMIOutputText.text = ("Overweight")
		BMIOutputText:setTextColor(1,1,0)
		BMIOutputNumber.text = (BMI)
	else
		BMIOutputText.text = ("Obese")
		BMIOutputText:setTextColor(1,0,0)
		BMIOutputNumber.text = (BMI)
	end
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
btnCalculate.x = CenterX
btnCalculate.y = 250