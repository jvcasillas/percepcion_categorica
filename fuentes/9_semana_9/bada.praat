# the steady state formant values
f1 = 750
b1 = 100
f2 = 1200
b2 = 150
f3 = 2350
b3 = 200
f4 = 3300
b4 = 300
f5 = 4000
b5 = 500

#the onset formant values
f1bd = 300
f2b = 1100
f2d = 1600
f3b = 2150
f3d = 2600



Create PitchTier... empty 0 0.25
Add point... 0.024 0
Add point... 0.025 120
Add point... 0.065 130
Add point... 0.225 110
Add point... 0.226 0
To Sound (pulse train)... 22050 1 0.05 2000 no
Rename... source

#prepare picture window
Erase all
Select outer viewport... 0 6.5 0 5


for i from 0 to 6
    #calculate onset values for f2 and f3
        for f from 2 to 3
            barkOnset = (6-i)/6 * hertzToBark(f'f'b)+ i/6 * hertzToBark(f'f'd)
            f'f'Onset = barkToHertz(barkOnset)
        endfor
    Create FormantTier... bda'i' 0 0.25
    Add point... 0.025 'f1bd' 'b1' 'f2Onset' 'b2' 'f3Onset' 'b3' 'f4' 'b4' 'f5' 'b5'
    Add point... 0.075 'f1' 'b1' 'f2' 'b2' 'f3' 'b3' 'f4' 'b4' 'f5' 'b5'
        #draw
        Speckle... 0 0 5500 30 yes
        plus Sound source
    Filter
        Rename...  bda'i'
endfor

selectObject ("PitchTier empty")
plusObject ("Sound source")
plusObject ("FormantTier bda0")
plusObject ("FormantTier bda1")
plusObject ("FormantTier bda2")
plusObject ("FormantTier bda3")
plusObject ("FormantTier bda4")
plusObject ("FormantTier bda5")
plusObject ("FormantTier bda6")
do ("Remove")
