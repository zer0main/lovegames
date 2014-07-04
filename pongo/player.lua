local M = {}

local function player_draw(self)
   love.graphics.setColor(self.color)
   love.graphics.push()
   love.graphics.translate(self.x, self.y)
   love.graphics.rotate(self.angle)
   love.graphics.rectangle('fill', -self.height / 2, 0, self.height, self.width)
   love.graphics.pop()
end

local function player_update(self, dt)
   local coeff_x = 0
   local coeff_y = 0

   if joystick then
      coeff_x = joystick:getAxis(1)
      coeff_y = joystick:getAxis(2)
      self.angle = (joystick:getAxis(3) * 0.9 + 1) * math.pi / 2

   elseif love.keyboard.isDown(self.keys.up) then
      coeff_y = -1
   elseif love.keyboard.isDown(self.keys.down) then
      coeff_y = 1
   elseif love.keyboard.isDown(self.keys.left) then
      coeff_x = -1
   elseif love.keyboard.isDown(self.keys.right) then
      coeff_x = 1
   end

   self.x = self.x + coeff_x * self.speed_x * dt
   self.y = self.y + coeff_y * self.speed_y * dt
   self.x = bound(self.x, self.min_x, self.max_x)
   self.y = bound(self.y, self.min_y, self.max_y)
end

local function player_keypressed(self, key)
   if key == self.keys.clock then
      self.angle = self.angle + 0.1
   elseif key == self.keys.anti then
      self.angle = self.angle - 0.1
   else
      return true
   end
end


function M.new(p)
   p.update = player_update
   p.draw = player_draw
   p.keypressed = player_keypressed
   return p
end


return M