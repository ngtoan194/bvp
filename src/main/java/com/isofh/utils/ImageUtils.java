package com.isofh.utils;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;

public class ImageUtils {

    public static BufferedImage cropImage(byte[] content, int x, int y, int width, int height) throws IOException {
        InputStream in = new ByteArrayInputStream(content);
        BufferedImage originalImage = ImageIO.read(in);
        return originalImage.getSubimage(
                x,y,width,height);
    }
}
