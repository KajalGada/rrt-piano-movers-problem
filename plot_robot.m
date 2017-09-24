function new_base = plot_robot(inPose)
% plotting robot
    w = 30; h = 10;
    base_ver = [];
    base_ver = [base_ver; -w/2, -h/2];
    base_ver = [base_ver; w/2, -h/2];
    base_ver = [base_ver; w/2, h/2];
    base_ver = [base_ver; -w/2, h/2];

    trans_ver = base_ver;
    
    rot_mat = [cos(inPose(3)), -sin(inPose(3))
              sin(inPose(3)), cos(inPose(3))];
    new_base = [];
    for rid = 1:size(trans_ver)
        new_ver = rot_mat*trans_ver(rid,:)';
        new_base = [new_base; new_ver(1,1), new_ver(2,1)];
    end
    
    trans_ver(:,1) = new_base(:,1) + inPose(1);
    trans_ver(:,2) = new_base(:,2) + inPose(2);
    
    new_base = trans_ver;
    
    patch(new_base(:,1), new_base(:,2), 'y')
    return;
end

