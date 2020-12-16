--Start of Global Scope---------------------------------------------------------
print('AppEngine Version: ' .. Engine.getVersion())

-- Delay in ms between visualization steps for demonstration purpose only
local DELAY = 150

-- Creating viewer
local viewer = View.create('viewer2D1')

-- Setting up graphical overlay attributes
local decoration = View.ShapeDecoration.create()
decoration:setLineColor(0, 255, 0)
decoration:setLineWidth(3)

local charDeco = View.TextDecoration.create()
charDeco:setSize(40)

-- Creating and setup an OCR segmenter
local segmenter = Image.OCR.Halcon.AutoSegmenter.create()
segmenter:setParameter('MIN_STROKE_WIDTH', 7)
segmenter:setParameter('TEXT_LINE_STRUCTURE_0', '2 2 2')
segmenter:setParameter('RETURN_PUNCTUATION', 'false')
segmenter:setParameter('MLP_CLASSIFIER', 'Universal_0-9_Rej')

-- Creating font classifier and select font
local fontClassifier = Image.OCR.Halcon.FontClassifier.create()
fontClassifier:setFont('UNIVERSAL_0_9_REJ')

--End of Global Scope-----------------------------------------------------------

--Start of Function and Event Scope---------------------------------------------

local function main()
  -- Load image and present
  local img = Image.load('resources/AutoSegmenter.bmp')
  viewer:clear()
  local imageID = viewer:addImage(img)
  viewer:present()
  Script.sleep(DELAY * 5) -- for demonstration purpose only

  -- Find and segment text in image
  local textLines = segmenter:findText(img)
  local charRegions = textLines:getTextLine(0)

  -- Classify all found charcters
  local characters, _, _ = fontClassifier:classifyCharacters(charRegions, img, "[0-9]{6}")

  -- Draw bounding boxes and print classified characters
  for i = 1, #characters do
    local box = charRegions[i]:getBoundingBox()
    viewer:addShape(box, decoration, nil, imageID)
    viewer:present()
    local CoG = box:getCenterOfGravity()
    charDeco:setPosition(CoG:getX() - 10, CoG:getY() + 65)
    viewer:addText(characters:sub(i, i), charDeco, nil, imageID)
    viewer:present() -- can be put outside loop if not for demonstration
    Script.sleep(DELAY) -- for demonstration purpose only
  end
  print('App finished.')
end
--The following registration is part of the global scope which runs once after startup
--Registration of the 'main' function to the 'Engine.OnStarted' event
Script.register('Engine.OnStarted', main)

--End of Function and Event Scope--------------------------------------------------
