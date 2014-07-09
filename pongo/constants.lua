local M = {}

-- size of window
M.WIDTH = 1024
M.HEIGHT = 576

-- ball
M.BALL_RADIUS = 15
M.BALL_INITIAL_SPEED = 200
M.BALL_MINIMUM_SPEED = 10
M.BALL_DECELERATION = 8

-- player
M.PADDLE_WIDTH = 10
M.PADDLE_HEIGHT = 100
M.PADDLE_SPEED = 100

-- random angle
M.RANDOM_ANGLE = 0.1

-- GOAL
M.GOAL_MAX_TIME = 2
M.GOAL_MAX_PIXELS = 50
M.GOAL_SPEED = 20

return M
