package com.isofh.bvp.models;

import org.springframework.web.multipart.MultipartFile;

public class UploadAvatarModel {
    private MultipartFile file;
    private float cropPointX;
    private float cropPointY;
    private float imageCropWidth;
    private float imageCropHeight;
    private float orgWidth;
    private float orgHeight;
    private float clientWidth;
    private float clientHeight;
    private boolean uploadOriginImage;

    public UploadAvatarModel() {
    }

    public UploadAvatarModel(MultipartFile file, float cropPointX, float cropPointY, float imageCropWidth, float imageCropHeight, float orgWidth, float orgHeight, float clientWidth, float clientHeight) {
        this.file = file;
        this.cropPointX = cropPointX;
        this.cropPointY = cropPointY;
        this.imageCropWidth = imageCropWidth;
        this.imageCropHeight = imageCropHeight;
        this.orgWidth = orgWidth;
        this.orgHeight = orgHeight;
        this.clientWidth = clientWidth;
        this.clientHeight = clientHeight;
    }

    public MultipartFile getFile() {
        return file;
    }

    public void setFile(MultipartFile file) {
        this.file = file;
    }

    public float getCropPointX() {
        return cropPointX;
    }

    public void setCropPointX(float cropPointX) {
        this.cropPointX = cropPointX;
    }

    public float getCropPointY() {
        return cropPointY;
    }

    public void setCropPointY(float cropPointY) {
        this.cropPointY = cropPointY;
    }

    public float getImageCropWidth() {
        return imageCropWidth;
    }

    public void setImageCropWidth(float imageCropWidth) {
        this.imageCropWidth = imageCropWidth;
    }

    public float getImageCropHeight() {
        return imageCropHeight;
    }

    public void setImageCropHeight(float imageCropHeight) {
        this.imageCropHeight = imageCropHeight;
    }

    public float getOrgWidth() {
        return orgWidth;
    }

    public void setOrgWidth(float orgWidth) {
        this.orgWidth = orgWidth;
    }

    public float getOrgHeight() {
        return orgHeight;
    }

    public void setOrgHeight(float orgHeight) {
        this.orgHeight = orgHeight;
    }

    public float getClientWidth() {
        return clientWidth;
    }

    public void setClientWidth(float clientWidth) {
        this.clientWidth = clientWidth;
    }

    public float getClientHeight() {
        return clientHeight;
    }

    public void setClientHeight(float clientHeight) {
        this.clientHeight = clientHeight;
    }

    public boolean isUploadOriginImage() {
        return uploadOriginImage;
    }

    public void setUploadOriginImage(boolean uploadOriginImage) {
        this.uploadOriginImage = uploadOriginImage;
    }
}
