function [r_x,r_y,r_t] = random_point()
r = randi([1,100]);

if r < 91
    r_x = randi([0,200]);
    r_y = randi([0,200]);
    r_t = randi([0,1]);
    if r_t == 1
        r_t = 1.57;
    end
else
    s_G = [160,30,0];
    r_x = s_G(1);
    r_y = s_G(2);
    r_t = s_G(3);
end

rand_point = [r_x,r_y,r_t];
% plot(rand_point(1), rand_point(2), 'yO')

end