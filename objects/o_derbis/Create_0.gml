image_alpha = random(1) + 1

x = 0
y = 0

pos = [0, 0]
posDir = [random(7) - 2.5, random(3) - 1.5]

init = function() {
   posDir = [random(7) - 2.5, (random(3) - 1.5) / max(pos[0] / 200, 1)]
}