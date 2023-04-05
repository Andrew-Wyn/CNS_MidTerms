function image = distort_image(image, percentage)
    to_distort = randperm(length(image));
    to_distort = to_distort(1:int16(length(image)*percentage));
    image(to_distort) = -image(to_distort);
end

