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
local lblBMI = display.newText("BMI", CenterX, 400, native.systemFontBold, 30)
local lblCatergory = display.newText("Category", CenterX, 450, native.systemFontBold, 28)
local titleHeight = display.newText("Weight:", 70, 190, native.systemFontBold, 20)
local titleWeight = display.newText("Height:", 70, 130, native.systemFontBold, 20)

lblBMI:setFillColor(1,1,1 , 0.5)
lblCatergory:setFillColor(1,1,1, 0.5)

--Text Boxes
local txtBxHeight = native.newTextField(210, 130, 150, 40)

txtBxHeight.font = native.newFont(systemFontBold, 24)
txtBxHeight:resizeHeightToFitFont()
txtBxHeight.placeholder = "Height (M)"

local txtBxWeight = native.newTextField(210, 190, 150, 40)

txtBxWeight.font = native.newFont(systemFontBold, 24)
txtBxWeight:resizeHeightToFitFont()
txtBxWeight.placeholder = "Weight (KG)"

--Event Handlers
function handleButtonEvent( event )
	print(event.phase)
	--If button is clicked
	if event.phase == "ended" then
	--Get User Data
	height = tonumber(txtBxHeight.text)
	weight = tonumber(txtBxWeight.text)

	if height == nil or weight == nil then
		native.showAlert("Error", "Invalid Data", {"OK", "Cancel"})
	elseif height <1 or height >3 then
		native.showAlert("Error", "Height must be between 1 and 3 Meters",{"OK", "Cancel"})
	else
		--Calculate BMI
		bmi = weight/(height ^2)
		bmi = math.round(bmi*10)/10
		lblBMI.text = bmi

		if bmi <18.5 then
			lblCatergory.text = "Underweight"
			lblCatergory:setFillColor(0,0,1)
		elseif bmi < 24 then
			lblCatergory.text = "Normal"
			lblCatergory:setFillColor(0,1,0)
		elseif bmi < 30 then
			lblCatergory.text = "Overweight"
			lblCatergory:setFillColor(0,1,1)
		else
			lblCatergory.text = "Obese"
			lblCatergory:setFillColor(1,0,0)
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