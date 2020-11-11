im = imread('im.jpeg');
histEq(im);

function imprime = histEq(im)
%Histogram equalization 
%im and imprime are 8-bit RGB images
%imprime is the equalized version of im
    im = uint8(im);
    black = zeros(size(im, 1), size(im, 2), "uint8");
    
    r_channel = im(:, :, 1);
    b_channel = im(:, :, 2);
    g_channel = im(:, :, 3);
    r_pdf = histcounts(r_channel, [0:255], "Normalization", "PDF");
    b_pdf = histcounts(b_channel, [0:255], "Normalization", "PDF");
    g_pdf = histcounts(g_channel,[0:255], "Normalization", "PDF");
    Fx_r = cumsum(r_pdf);
    Fx_b = cumsum(b_pdf);
    Fx_g = cumsum(g_pdf);
    r = round(255 * Fx_r(r_channel + 1));
    b = round(255 * Fx_b(b_channel + 1));
    g = round(255 * Fx_g(g_channel + 1));
    r_prime = histcounts(r, [0:255], "Normalization", "PDF");
    b_prime = histcounts(b, [0:255], "Normalization", "PDF");
    g_prime = histcounts(g, [0:255], "Normalization", "PDF");
    
    imprime = uint8(cat(3, r, b, g));
end


