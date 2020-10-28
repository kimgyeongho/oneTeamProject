package com.knk.home_alone.domain;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
@Data
public class imageDTO {
	 private MultipartFile imgFile;
	 private MultipartFile imgFile2;
	 private MultipartFile imgFile3;

	    public MultipartFile getImgFile() {
	        return imgFile;
	    }
	 
	    public void setImgFile(MultipartFile imgFile) {
	        this.imgFile = imgFile;
	    }

		public MultipartFile getImgFile2() {
			return imgFile2;
		}

		public void setImgFile2(MultipartFile imgFile2) {
			this.imgFile2 = imgFile2;
		}

		public MultipartFile getImgFile3() {
			return imgFile3;
		}

		public void setImgFile3(MultipartFile imgFile3) {
			this.imgFile3 = imgFile3;
		}
	    
	    
}
