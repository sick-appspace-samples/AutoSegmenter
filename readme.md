## AutoSegmenter
Reading the date on the label on a cardboard box using API integrated
HALCON AutoSegmenter.

### Description
HALCON AutoSegmenter provides an easy and robust way to read text with few input
parameters. All known text characteristics can be entered as parameters,
in this case "min stroke width" and "text line structure".

### How to Run
Starting this sample is possible either by running the app (F5) or
debugging (F7+F10). Setting breakpoint on the first row inside the 'main'
function allows debugging step-by-step after 'Engine.OnStarted' event.
Results can be seen in the image viewer on the DevicePage.
Restarting the Sample may be necessary to show images after loading the webpage.
To run this Sample a device with SICK Algorithm API, HALCON support and
AppEngine >= V2.5.0 is required. For example SIM4000 with latest firmware.
Alternatively the Emulator in AppStudio 2.3 or higher can be used in conjunction
with a HALCON developer license and dongle.

### More Information
Tutorial "Algorithms - OCR"

### Topics
Algorithm, Image-2D, OCR, Sample, SICK-AppSpace