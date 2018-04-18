stripeBlock(10, 20);

module stripeBlock(w, h, stripeSpacing = 2) {
    intersection() {
        for (i = [2:2:(w + h)]) {
            polygon([
                [(i - 1) * stripeSpacing, 0],
                [i * stripeSpacing, 0],
                [0, i * stripeSpacing],
                [0, (i - 1) * stripeSpacing]
            ]);
        };
        square([w, h]);
    };
}