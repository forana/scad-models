function npoly (n, r, offset = 0) =
    [for (i = [0:n-1]) [r * cos(360/n*i + offset), r * sin(360/n*i + offset)]];


polygon(npoly(5, 10, 90));