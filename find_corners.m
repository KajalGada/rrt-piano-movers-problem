function bot_vertices = find_corners(position_point)

w = 30;
h = 10;

bot_vertices = [-w/2 w/2 w/2 -w/2;
                -h/2 -h/2 h/2 h/2];

th = position_point(3);
rot_mat = [ cos(th) -sin(th);
    sin(th) cos(th)];

bot_vertices = rot_mat * bot_vertices;

bot_vertices(1,:) = bot_vertices(1,:) + position_point(1);
bot_vertices(2,:) = bot_vertices(2,:) + position_point(2);


end