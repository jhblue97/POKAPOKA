package com.poka.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URI;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;


import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.util.LinkedMultiValueMap;
import com.poka.domain.Criteria;
import com.poka.domain.NijiVO;
import com.poka.domain.PayVO;
import com.poka.domain.UserVO;
import com.poka.service.NijiService;
import com.poka.service.PayService;
import com.poka.service.UserService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Controller //스프링이 빈으로 관리하도록 어노테이션 추가
@Log4j
@RequestMapping("/niji/*") //브라우저에서 /board/~~ 로 들어오는 모든 요청을 처리하도록 어노테이션 추가
@AllArgsConstructor
public class NijiController {

	private NijiService nijiService;
	private PayService payService;
	private UserService userService;
	private static final String HOST = "https://kapi.kakao.com";
	     //게시물 목록 조회
		@GetMapping("/list")
		public String list(Criteria cri, Model model) throws IOException {			
			
			/*
			 * cri.setAmount(5); cri.setKeyword(""); cri.setPageNum(1);
			 */
			  
			if(cri.getKeyword()==null) {
				cri.setKeyword("");
			}
			System.out.println(cri.getAmount());
			System.out.println(cri.getKeyword());
			System.out.println(cri.getPageNum());
			
			log.info(".....list().....");	
			System.out.println("gggg");
			System.out.println(cri);
			
			  List<NijiVO> list = nijiService.getList(cri);
			  
			  System.out.println("niji : -> " + list);
				 
			  model.addAttribute("list", list);
			  model.addAttribute("keyword",cri.getKeyword());

			  ////////////////////////
			  return "niji/nijiList";
		}		
		
		@GetMapping("/chat/{userid}")
		public String chat(@PathVariable("userid") String userid,Model model) throws RestClientException, IOException {			
			
			model.addAttribute("userid",userid);
			  System.out.println("userid--->"+userid);
			  return "niji/chat";
		}		
		
		 //결제 목록 조회
			@GetMapping("/pay/list")
			public String payList(@RequestParam("user_id") String user_id,Criteria cri, Model model) {		
					
				if(cri.getKeyword()==null) {
					cri.setKeyword("");
				}
				System.out.println(cri.getAmount());
				System.out.println(cri.getKeyword());
				System.out.println(cri.getPageNum());

					cri.setKeyword(user_id);
				
		   List<PayVO> list = payService.getList(cri); 
		   model.addAttribute("list", list);
		   
		   list.forEach(niji -> {
				  System.out.println("niji : -> " + niji); });
		   
 
			log.info(".....list().....");	
			return "pay/payList";
		}	
		 //게시물 검색 조회
		@GetMapping("/search")
		public String list(@RequestParam("name") String name,Criteria cri, Model model) {			
			log.info(".....list().....");
			return null;
		}		
		
		//게시물 하나 조회
		@GetMapping("/get")
		public String get(@RequestParam("nno") String nno, 
						Model model) {
			
			System.out.println("zzzz");
			
			log.info(".....get() or modify() .....");	
		
			model.addAttribute("niji", nijiService.get(nno));	
			
			return "niji/nijiView";
		}	

		
	
				
		//게시물 삭제 
		@PostMapping("/delete")
		//@PreAuthorize("principal.username == #writer") //작성자 확인
		public String delete(@RequestParam("nno") String nno,
						Model model) {
			log.info(".....get() or modify() .....");
			
			nijiService.delete(nno);
			return "redirect:/niji/list"; 
		}
		
		
		//첨부파일 삭제
		public void deleteFile(String filename) {
			log.info(".....deleteFiles().....");
		
			
			try {
				Path file = Paths.get("c:\\upload\\" +filename);
				Files.deleteIfExists(file);	//파일이 존재하면 삭제
				
				if(Files.probeContentType(file).startsWith("image")) {	//이미지 파일의 경우 섬네일 삭제
					
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
			}

			/*
			 * //첨부파일 목록 JSON 반환
			 * 
			 * @GetMapping(value="/displayFile",
			 * produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
			 * 
			 * @ResponseBody public ResponseEntity<NijiAttachVO> getNijiAttach(String nno){
			 * log.info(".....getAttachList()....."); return new
			 * ResponseEntity<>(nijiService.getAttach(nno), HttpStatus.OK); }
			 * 
			 * //첨부파일 목록 JSON 반환
			 * 
			 * @GetMapping(value="/pay/displayFile",
			 * produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
			 * 
			 * @ResponseBody public ResponseEntity<NijiAttachVO> getPayAttach(String pno){
			 * log.info(".....getAttachList()....."); return new
			 * ResponseEntity<>(nijiService.getAttach(pno), HttpStatus.OK); }
			 */
			
		//게시물 수정
		@GetMapping("/modify")
		public String modify(@RequestParam("nno") String nno,Model model) {	
			
			log.info(".....get() or modify() .....");	
			
			model.addAttribute("niji", nijiService.get(nno));
			
			return "/niji/nijiUpdate";
		}
		
		//게시물 수정
		@PostMapping("/modify")
		//@PreAuthorize("principal.username == #niji.writer") //작성자 확인
		public String modify(NijiVO niji, RedirectAttributes rttr) {
			
			log.info(niji);
			
			 nijiService.modify(niji);
			return "redirect:/niji/list";
		}
		
		
		//게시물 등록 화면
		@GetMapping("/add")
		//@PreAuthorize("isAuthenticated()")
		public String add() {
			
			System.out.println("add등록");
			
			
		return "niji/nijiAdd";
		}
		
		
		
		//게시물 등록
		@PostMapping("/add")
		//@PreAuthorize("isAuthenticated()")
		public String add(NijiVO niji, RedirectAttributes rttr) {
			System.out.println("getImage :::  "+niji.getImage());
			System.out.println("full tag :::  "+niji.getFullTag());
			

			nijiService.add(niji);
			rttr.addFlashAttribute("result","登録しました。");

			return "redirect:/niji/list";
		}
		
		
		//결제 내역 상세 조회
		@GetMapping("/pay/get")
		public ResponseEntity<PayVO> payGet(@RequestParam("pno") String pno, Model model) {			
			log.info(".....get() or modify() .....");	
			return new ResponseEntity<>(payService.get(pno), HttpStatus.OK);
		}	
		//카카오 결제				
		@GetMapping({ "/kakao/pay"})
		public String pay(@RequestParam("price")String price,@RequestParam("user_id")String user_id,@RequestParam("nno")String nno,HttpSession session) throws Exception {
	
			
			    System.out.println("get startstream2");

		        RestTemplate restTemplate = new RestTemplate();
		      
			    // 서버로 요청할 Body
			    MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
			    params.add("cid","TC0ONETIME");
			    params.add("partner_order_id",user_id);
			    params.add("partner_user_id",user_id);
			    params.add("item_name","携帯");
			    params.add("quantity","1");
			    params.add("total_amount",price);
			    params.add("tax_free_amount","0");
			    params.add("approval_url","http://192.168.0.63:8091/niji/pay/pay_after");
			    params.add("cancel_url","http://192.168.0.63:8091");
			    params.add("fail_url","http://192.168.0.63:8091");

			    // 서버로 요청할 Header 
			    HttpHeaders headers = new HttpHeaders();
			    headers.add("Authorization","KakaoAK "+"ba4cb63601508f24d7800dc383e44fa4");
			    headers.add("Content-Type",MediaType.APPLICATION_FORM_URLENCODED_VALUE +";charset=UTF-8");

			    HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<MultiValueMap<String, String>>(params, headers);
			    Map response = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), request, Map.class);
			    System.out.println(response.get("next_redirect_pc_url"));
			    session.setAttribute("tid", response.get("tid"));
			    
		
			    
			    NijiVO niji = new NijiVO(); 
			    niji = nijiService.get(nno);
			    session.setAttribute("niji",niji);
			    session.setAttribute("user_id",user_id);
			    session.setAttribute("price",price);			    
			    

				System.out.println("session저장확인"+session.getAttribute("tid")+session.getAttribute("user_id")+session.getAttribute("price"));
					 
				return "redirect:"+response.get("next_redirect_pc_url");
			
		}
		
		@GetMapping({ "/niji/pay_before"})
		public String pay_before(@RequestParam("nno") String nno, Model model) {
			log.info(".....get() or modify() .....");	
			model.addAttribute("niji", nijiService.get(nno));
			return "niji/pay_before";	
		}
		
		@PostMapping({ "/niji/pay_before"})
		public String pay_before(NijiVO niji) {
	
				log.info(".....get() or modify() .....");			
				return null;	
		}
		
		@GetMapping({ "/pay/pay_after"})
		public String pay_after(@RequestParam("pg_token") String pg_token,Model model,HttpSession session) throws Exception  {
	

				String tid = String.valueOf(session.getAttribute("tid"));
				String user_id = String.valueOf(session.getAttribute("user_id"));
				System.out.println("tid ------> "+tid+"user_id ------->"+user_id+"pg_token----->"+pg_token);
		
				RestTemplate restTemplate = new RestTemplate();
	
			    // 서버로 요청할 Body
			    MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
			    params.add("cid","TC0ONETIME");
			    params.add("tid",tid);
			    params.add("partner_order_id",user_id);
			    params.add("partner_user_id",user_id);
			    params.add("pg_token",pg_token);
			
	
			    HttpHeaders headers = new HttpHeaders();
			    headers.add("Authorization","KakaoAK "+"ba4cb63601508f24d7800dc383e44fa4");
			    headers.add("Content-Type",MediaType.APPLICATION_FORM_URLENCODED +";charset=UTF-8");
			    HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<MultiValueMap<String, String>>(params, headers);
			    
			    System.out.println("ㅅㅂ");
			    
			    
			    Map response = restTemplate.postForObject(new URI(HOST + "/v1/payment/approve"), request, Map.class);
		 
			    NijiVO niji = new NijiVO(); 
			    niji = (NijiVO) session.getAttribute("niji");
			    
			    UserVO user = new UserVO();
			    user = userService.get(user_id);
			    
			    PayVO pay = new PayVO();
			    pay.setNno(niji.getNno());
			    pay.setTitle(niji.getTitle());
			    pay.setContent(niji.getContent());
			    pay.setImg(niji.getServerImage());
			    pay.setSeller(niji.getWriter());
			    pay.setBuyer(user_id);
			    pay.setBuyer_email(user.getEmail());
			    pay.setPay_status(2);
			    pay.setPrice(niji.getPrice());
		    
			    payService.add(pay);
			    
			    System.out.println("끝");
		    
			
				return "redirect:/niji/pay/complete";
		}
		 
		@GetMapping({ "/pay/complete"})
		public String complete(Model model) throws Exception  {
		
			return "niji/pay_after";
		}
		
		
}
