using Luxor
using Colors

Luxor.Drawing(100, 100, "avatar.png")
Luxor.background(Colors.RGB(0, 1, 0))

origin()

r1 = 20
c1 = Point(-10, 10)
r2 = 20
c2 = Point(10, 10)

r3 = 50
c3 = c2 + (r2-r3,0)
r4 = 50
c4 = c1 - (r1-r4,0)
 
flag, tip, p2 = intersectioncirclecircle(c3, r3, c4, r4)
flag, p1, bot = intersectioncirclecircle(c1, r1, c2, r2)

newpath()
arc2r(c3, tip, c2+(r2,0), :path)
arc2r(c2, c2+(r2,0), bot, :path)
arc2r(c1, bot, c1-(r1,0), :path)
arc2r(c4, c1-(r1,0), tip, :path)
closepath()

fillpath()

setline(10)
line(O, -tip, :stroke)

Luxor.finish()