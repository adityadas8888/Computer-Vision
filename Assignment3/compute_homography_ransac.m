function [H,inlier1,inlier2] = compute_homography_ransac(mpts1,mpts2,thresh)
    for i=1:500
        flag=1;
        randflag = randperm(size(mpts1,1),4); 
        H = compute(mpts2(randflag,:), mpts1(randflag,:));
        for j=1:size(mpts1,1)
            [A,B] = homography(H,mpts1(j,1),mpts1(j,2)); 
            d = (mpts2(j,1)-A).^2 + (mpts2(j,2)-B).^2;
            if (d < thresh)
                inlier1(flag,:) = [mpts1(j,1),mpts1(j,2)];
                inlier2(flag,:) = [mpts2(j,1),mpts2(j,2)];
                flag=flag+1;
            end
        end
    end
    H = compute(inlier2, inlier1);
end

