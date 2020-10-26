package com.knk.home_alone.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.knk.home_alone.domain.BoardVO;
import com.knk.home_alone.domain.imageDTO;
import com.knk.home_alone.service.BoardService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class Board_POST {

	@Autowired 
	private BoardService service;
	
	
	@RequestMapping("/board_all.do")
	public String getBoardList(BoardVO vo, Model mav) throws Exception {
		log.info("getBoardList");
		if (vo.getSerchKeyword() == null)vo.setSerchKeyword("");
		log.info(vo.getSerchKeyword()+"키워드가져옵니다");
		mav.addAttribute("boardList", service.getboardList(vo));

		return "board_all";
	}
	
	 @RequestMapping(value ="/boardupdate.do" ,method = RequestMethod.POST)
		public String boardupdate(BoardVO vo,imageDTO dto) throws IllegalStateException, Exception {
		 log.info("===========boardUpdate===============");
			service.boardupdate(vo);
		 try {
			 log.info("===========imageUpdate===============");
		        Map<String, Object> imageMap = new HashMap<String, Object>();
		        imageMap.put("img", dto.getImgFile().getBytes());
		        imageMap.put("img2", dto.getImgFile2().getBytes());
		        imageMap.put("img3", dto.getImgFile3().getBytes());

		        System.out.println(imageMap);
		        service.boardImage(imageMap);   
		    } catch (Exception e) {
		        e.printStackTrace();
		    }
			
			return "redirect:board_all.do";
		}
	 
	 @RequestMapping("/getBoard.do")
		public String getBoard(BoardVO vo, Model mav) throws Exception {
		 log.info("===========getBoard===============");
			BoardVO boardvo= service.getBoard(vo);
			mav.addAttribute("board", boardvo);
			List<Map<String,Object>> resultList = null;
			List<String> paramList = new ArrayList<String>();
			try {
				resultList = service.getboardImage(vo.getSeq());
				mav.addAttribute("resultList",resultList);
				Iterator<Map<String,Object>> itr = resultList.iterator();
				while(itr.hasNext()){
					Map<String,Object>element = (Map<String,Object>)itr.next();
					byte[] encoded=org.apache.commons.codec.binary.Base64.encodeBase64((byte[]) element.get("img"));
					byte[] encoded2=org.apache.commons.codec.binary.Base64.encodeBase64((byte[]) element.get("img2"));
					byte[] encoded3=org.apache.commons.codec.binary.Base64.encodeBase64((byte[]) element.get("img3"));
					String encodedString =new String(encoded);
					String encodedString2 =new String(encoded2);
					String encodedString3 =new String(encoded3);
					element.put("base64", encodedString);
					element.put("base642", encodedString2);
					element.put("base643", encodedString3);
					paramList.add(encodedString);
					paramList.add(encodedString2);
					paramList.add(encodedString3);
					mav.addAttribute("image",paramList);
				}
			}catch (Exception e) {
				// TODO: handle exception
			}
			return "boardViewDetails";
		}
	 
	 
	 
	 
	 
	 
	 		//게시판 글쓰기 이동
			@RequestMapping(value = "/boardWrite.do", method = RequestMethod.GET)
			public void writeView() throws Exception{
						log.info("boardWrite");
							
			}
			

	 		//게시판 수정하기로 이동
			@RequestMapping(value = "/Bulletin_board_repair.do", method = RequestMethod.GET)
			public String getBoard2(BoardVO vo, Model mav) throws Exception{
						log.info("Bulletin_board_repair");
					BoardVO boardvo= service.getBoard(vo);
					mav.addAttribute("board", boardvo);
					List<Map<String,Object>> resultList = null;
					List<String> paramList = new ArrayList<String>();
					try {
						resultList = service.getboardImage(vo.getSeq());
						mav.addAttribute("resultList",resultList);
						Iterator<Map<String,Object>> itr = resultList.iterator();
						while(itr.hasNext()){
							Map<String,Object>element = (Map<String,Object>)itr.next();
							byte[] encoded=org.apache.commons.codec.binary.Base64.encodeBase64((byte[]) element.get("img"));
							byte[] encoded2=org.apache.commons.codec.binary.Base64.encodeBase64((byte[]) element.get("img2"));
							byte[] encoded3=org.apache.commons.codec.binary.Base64.encodeBase64((byte[]) element.get("img3"));
							String encodedString =new String(encoded);
							String encodedString2 =new String(encoded2);
							String encodedString3 =new String(encoded3);
							element.put("base64", encodedString);
							element.put("base642", encodedString2);
							element.put("base643", encodedString3);
							paramList.add(encodedString);
							paramList.add(encodedString2);
							paramList.add(encodedString3);
							mav.addAttribute("image",paramList);
								}
							}catch (Exception e) {
								// TODO: handle exception
							}
							return "Bulletin_board_repair";
							
			}
			
			
			@RequestMapping(value ="/boardupdate2.do" ,method = RequestMethod.POST)
			public String boardupdate2(BoardVO vo,imageDTO dto) throws IllegalStateException, Exception {
			 log.info("===========boardUpdate===============");
				service.boardupdate(vo);
			 try {
				 log.info("===========imageUpdate===============");
			        Map<String, Object> imageMap = new HashMap<String, Object>();
			        imageMap.put("img", dto.getImgFile().getBytes());
			        imageMap.put("img2", dto.getImgFile2().getBytes());
			        imageMap.put("img3", dto.getImgFile3().getBytes());

			        System.out.println(imageMap);
			        service.boardImage(imageMap);   
			    } catch (Exception e) {
			        e.printStackTrace();
			    }
				
				return "redirect:board_all.do";
			}
}
