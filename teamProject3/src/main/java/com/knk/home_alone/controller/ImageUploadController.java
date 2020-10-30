/*package com.knk.home_alone.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;


import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.knk.home_alone.domain.AttachFileDTO;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@Log4j
public class ImageUploadController {
	
 
	@GetMapping("/uploadForm")
	public void uploadForm() {

		log.info("GET upload form");
	}
	@PostMapping("/uploadFormAction")
	public void uploadFormPost(MultipartFile[] uploadFile, Model model) {

		String uploadFolder = "C:\\upload";

		for (MultipartFile multipartFile : uploadFile) {

			log.info("-------------------------------------");
			log.info("Upload File Name: " + multipartFile.getOriginalFilename());
			log.info("Upload File Size: " + multipartFile.getSize());

			File saveFile = new File(uploadFolder, multipartFile.getOriginalFilename());

			try {
				multipartFile.transferTo(saveFile);
			} catch (Exception e) {
				log.error(e.getMessage());
			} // end catch
		} // end for

	}
	
	@GetMapping("/uploadAjax")
	public void uploadAjax() {
		
		log.info("upload ajax");
	}
	
	 //날짜 경로로 문자열를 생성합니다.
	 private String getFolder() {

			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

			Date date = new Date();

			String str = sdf.format(date);

			return str.replace("-", File.separator);
		}
	  
	  // 특정한 파일이 이미지 타입인지를 검사하는 별도의 메소드
	  private boolean checkImageType(File file) {

			try {
				String contentType = Files.probeContentType(file.toPath());

				return contentType.startsWith("image");

			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			return false;
		}
	    // 해당 경로가 있는지 검사를 하고 풀더를  생성합니다 이후 생성된 풀더로  파일를 저장합니다 . uploadPath 경로에  파일을 저장하게 되면 자동으로 풀더가 생성 되면서 파일 저장됩니다.
	    //UUID 파일 이름을 생성할 때 동일한 이름으로 업로드 되면 기존 파일을 지우개 되므로 java.util.UUID의 값을 이용해서 처리 돕니다. 
		@PostMapping(value = "/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
		@ResponseBody
		//json 데이터를  반환하도록 변경해줍니다. 내부에서는 각 파일에 맞게 AttachFileDTO를 생성해서 전달하는 구조로 변경됩니다.
		public ResponseEntity<List<AttachFileDTO>> uploadAjaxPost(MultipartFile[] uploadFile) {

			List<AttachFileDTO> list = new ArrayList<>();
			String uploadFolder = "C:\\upload";

			String uploadFolderPath = getFolder();
			// make folder --------
			File uploadPath = new File(uploadFolder, uploadFolderPath);

			if (uploadPath.exists() == false) {
				uploadPath.mkdirs();
			}
			// make yyyy/MM/dd folder

			for (MultipartFile multipartFile : uploadFile) {

				AttachFileDTO attachDTO = new AttachFileDTO();

				String uploadFileName = multipartFile.getOriginalFilename();

				// IE has file path
				uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
				log.info("only file name: " + uploadFileName);
				attachDTO.setFileName(uploadFileName);

				UUID uuid = UUID.randomUUID();
				 //	 randomUUID()를 이용해서 임의의 값을 생성합니다 .  생성 된 값을  원래의  파일 이름과 구분할 수 있도록 중간에 _ 를 추가합니다. 
				  //UUID가 생성된 파일이 생기므로 원본 이름과 같더라도  다른 이름의 파일로 생성 되는 것으로 확인할 수 있습니다.
				uploadFileName = uuid.toString() + "_" + uploadFileName;

				try {
					File saveFile = new File(uploadPath, uploadFileName);
					multipartFile.transferTo(saveFile);

					attachDTO.setUuid(uuid.toString());
					attachDTO.setUploadPath(uploadFolderPath);

					// check image type file
					if (checkImageType(saveFile)) {

						attachDTO.setImage(true);
			 //Thumbnailator는  InputStream과 java.io.File 객체를 이용해서  파일을 생성할  수 있고, 뒤에 사이즈에 대한 부분을 파라미터 width와 height를  지정할 수 있도록 합니다.
			 //이제 이미지 파일을 업로드하면 원복 파일은 그대로  저장되고  파일 이름이 S로 시작하는 섬네일 파일 생성되는 것을 볼 수 있습니다  반면에 일반 파일의 경우는 그냥 파일만 업로드 도는 것을 볼 수 있습니다.
						FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + uploadFileName));

						Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 100, 100);

						thumbnail.close();
					}

					// add to List
					list.add(attachDTO);

				} catch (Exception e) {
					e.printStackTrace();
				}

			} // end for
			return new ResponseEntity<>(list, HttpStatus.OK);
		}
		@GetMapping("/display")
		@ResponseBody
		public ResponseEntity<byte[]> getFile(String fileName) {

			log.info("fileName: " + fileName);

			File file = new File("c:\\upload\\" + fileName);

			log.info("file: " + file);

			ResponseEntity<byte[]> result = null;

			try {
				HttpHeaders header = new HttpHeaders();

				header.add("Content-Type", Files.probeContentType(file.toPath()));
				result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return result;
		}
		
		 @GetMapping(value="/download" ,
		 produces=MediaType.APPLICATION_OCTET_STREAM_VALUE)
		 @ResponseBody
		 public ResponseEntity<Resource>
		 downloadFile(@RequestHeader("User-Agent")String userAgent, String fileName){
		
		 Resource resource = new FileSystemResource("c:\\upload\\" + fileName);
		
		 if(resource.exists() == false) {
		 return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		 }
		
		 String resourceName = resource.getFilename();
		
		 //remove UUID
		 String resourceOriginalName =
		 resourceName.substring(resourceName.indexOf("_")+1);
		
		 HttpHeaders headers = new HttpHeaders();
		 try {
		
		 boolean checkIE = (userAgent.indexOf("MSIE") > -1 ||
		 userAgent.indexOf("Trident") > -1);
		
		 String downloadName = null;
		
		 if(checkIE) {
		 downloadName = URLEncoder.encode(resourceOriginalName,
		 "UTF8").replaceAll("\\+", " ");
		 }else {
		 downloadName = new
		 String(resourceOriginalName.getBytes("UTF-8"),"ISO-8859-1");
		 }
		
		 headers.add("Content-Disposition", "attachment; filename="+downloadName);
		
		 } catch (UnsupportedEncodingException e) {
		 e.printStackTrace();
		 }
		
		 return new ResponseEntity<Resource>(resource, headers,HttpStatus.OK);
		}
		 @PostMapping("/deleteFile")
			@ResponseBody
			public ResponseEntity<String> deleteFile(String fileName, String type) {

				log.info("deleteFile: " + fileName);

				File file;

				try {
					file = new File("c:\\upload\\" + URLDecoder.decode(fileName, "UTF-8"));

					file.delete();

					if (type.equals("image")) {

						String largeFileName = file.getAbsolutePath().replace("s_", "");

						log.info("largeFileName: " + largeFileName);

						file = new File(largeFileName);

						file.delete();
					}

				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
					return new ResponseEntity<>(HttpStatus.NOT_FOUND);
				}

				return new ResponseEntity<String>("deleted", HttpStatus.OK);

			}
		
	

}
*/