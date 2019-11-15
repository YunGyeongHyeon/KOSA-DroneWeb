package com.fireBusters.web.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fireBusters.web.dto.AcBoard;
import com.fireBusters.web.dto.AcBoardPicture;
import com.fireBusters.web.dto.AdminBoard;
import com.fireBusters.web.dto.AdminFireStation;
import com.fireBusters.web.dto.AdminLatLon;
import com.fireBusters.web.dto.ObBoard;
import com.fireBusters.web.dto.ObBoardPicture;
import com.fireBusters.web.service.AdminService;
import com.fireBusters.web.service.LoginResult;

@Controller
@RequestMapping("/admin")
public class AdminController {
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	@Autowired
	AdminService service;

	@RequestMapping("/main")
	public String main() {
		return "admin/loginForm";
	}

	@RequestMapping("/loginForm")
	public String loginForm(String error, Model model, HttpSession session) {
		try {
			if (error != null) {
				if (error.equals("fire_station_idError")) {
					model.addAttribute("fire_station_idError", "* 아이디가 존재하지 않습니다.");
				} else if (error.equals("fire_station_passwordError")) {
					model.addAttribute("fire_station_passwordError", "* 비밀번호가 틀렀습니다.");
				}
			}
		} catch (Exception e) {
			model.addAttribute("fire_station_idError", "제대로 입력해주세요.");
		}
		return "admin/loginForm";
	}

	@PostMapping("/login")
	public String login(int fire_station_id, String fire_station_password, HttpSession session) {
		session.removeAttribute("fire_station_idError");
		session.removeAttribute("fire_station_passwordError");

		LoginResult result = service.login(fire_station_id, fire_station_password);
		if (result == LoginResult.FAIL_ADMINID) {
			session.setAttribute("fire_station_idError", "* 아이디가 존재하지 않습니다.");
			return "redirect:/admin/loginForm";
		} else if (result == LoginResult.FAIL_ADMINPASSWORD) {
			session.setAttribute("fire_station_passwordError", "* 비밀번호가 틀렀습니다.");
			return "redirect:/admin/loginForm";
		}
		session.setAttribute("fire_station_id", fire_station_id);
		return "admin/complete";
	}

	@GetMapping("/complete")
	public String complete() {
		return "redirect:/admin/content";
	}

	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("fire_station_id");
		session.removeAttribute("pageNo");
		return "redirect:/admin/loginForm";
	}

	// -----------------------------------------------------------------------------------------------------------------------content
	@RequestMapping("/content")
	public String content(Model model, HttpSession session, AdminFireStation fireStation, AdminLatLon adminLatLon,
			@RequestParam(defaultValue = "0") int pageNo) {

		if (pageNo == 0) {
			Integer objPageNo = (Integer) session.getAttribute("pageNo");
			if (objPageNo == null) {
				pageNo = 1;
			} else {
				pageNo = objPageNo;
			}
		} else {
			session.setAttribute("pageNo", pageNo);
		}

		if (session.getAttribute("fire_station_id") == null) {
			System.out.println("아이디 없습니다.");
			return "redirect:/admin/loginForm";
		}
		// ---------------------------------페이징
		int rowsPerPage = 8;// 페이지당 행수
		int pagesPerGroup = 10;// 이전, 다음을 클릭했을때 나오는 그룹당 페이지 수
		int totalRowNum = service.getTotalRowNo((int) session.getAttribute("fire_station_id"));// 전체 게시물 수
		int totalPageNum = totalRowNum / rowsPerPage;// 전체 페이지 수
		if (totalRowNum % rowsPerPage != 0)
			totalPageNum++;// 뒤에 짜투리도 페이지수로 인정
		int totalGroupNum = totalPageNum / pagesPerGroup;// 전체 그룹 수
		if (totalPageNum % pagesPerGroup != 0)
			totalGroupNum++;
		int groupNo = (pageNo - 1) / pagesPerGroup + 1;// 현재페이지의 그룹번호
		int startPageNo = (groupNo - 1) * pagesPerGroup + 1;// 현재 그룹의 시작 페이지 번호
		int endPageNo = startPageNo + pagesPerGroup - 1;// 현재 그룹의 마지막 페이지 번호
		if (groupNo == totalGroupNum)
			endPageNo = totalPageNum;
		int startRowNo = (pageNo - 1) * rowsPerPage + 1;// 공식//현재시작 페이지의 행 번호
		int endRowNo = pageNo * rowsPerPage;// 현재공식//해당 페이지의 끝 행번호
		if (pageNo == totalPageNum) { // 현재 그룹의 번호가 전체 그룹 수(마지막 그룹번호)와 같다면
			endRowNo = totalRowNum; // 끝 행 번호는 전체 행 번호 수 만큼 된다
		}
		// ---------------------------------페이징

		List<AdminBoard> board = service.selectReport((int) session.getAttribute("fire_station_id"), startRowNo,endRowNo);
		AdminFireStation station = service.selectFireStation((int) session.getAttribute("fire_station_id"));

		model.addAttribute("board", board);
		model.addAttribute("station", station);

		model.addAttribute("pagesPerGroup", pagesPerGroup);
		model.addAttribute("totalPageNum", totalPageNum);
		model.addAttribute("totalGroupNum", totalGroupNum);
		model.addAttribute("groupNo", groupNo);
		model.addAttribute("startPageNo", startPageNo);
		model.addAttribute("endPageNo", endPageNo);
		model.addAttribute("pageNo", pageNo);

		return "admin/content";
	}

	// -----------------------------------------------------------------------------------------------------------------------report
	@RequestMapping("/report")
	public String report(Model model, HttpSession session, AdminFireStation fireStation, AdminLatLon adminLatLon,
			@RequestParam(defaultValue = "0") int pageNo) {

		if (pageNo == 0) {
			Integer objPageNo = (Integer) session.getAttribute("pageNo");
			if (objPageNo == null) {
				pageNo = 1;
			} else {
				pageNo = objPageNo;
			}
		} else {
			session.setAttribute("pageNo", pageNo);
		}

		if (session.getAttribute("fire_station_id") == null) {
			System.out.println("아이디 없습니다.");
			return "redirect:/admin/loginForm";
		}

		// ---------------------------------페이징
		int rowsPerPage = 8;// 페이지당 행수
		int pagesPerGroup = 10;// 이전, 다음을 클릭했을때 나오는 그룹당 페이지 수
		int totalRowNum = service.getTotalRowNo((int) session.getAttribute("fire_station_id"));// 전체 게시물 수
		int totalPageNum = totalRowNum / rowsPerPage;// 전체 페이지 수
		if (totalRowNum % rowsPerPage != 0)
			totalPageNum++;// 뒤에 짜투리도 페이지수로 인정
		int totalGroupNum = totalPageNum / pagesPerGroup;// 전체 그룹 수
		if (totalPageNum % pagesPerGroup != 0)
			totalGroupNum++;
		int groupNo = (pageNo - 1) / pagesPerGroup + 1;// 현재페이지의 그룹번호
		int startPageNo = (groupNo - 1) * pagesPerGroup + 1;// 현재 그룹의 시작 페이지 번호
		int endPageNo = startPageNo + pagesPerGroup - 1;// 현재 그룹의 마지막 페이지 번호
		if (groupNo == totalGroupNum)
			endPageNo = totalPageNum;
		int startRowNo = (pageNo - 1) * rowsPerPage + 1;// 공식//현재시작 페이지의 행 번호
		int endRowNo = pageNo * rowsPerPage;// 현재공식//해당 페이지의 끝 행번호
		if (pageNo == totalPageNum) { // 현재 그룹의 번호가 전체 그룹 수(마지막 그룹번호)와 같다면
			endRowNo = totalRowNum; // 끝 행 번호는 전체 행 번호 수 만큼 된다
		}
		// ---------------------------------페이징

		List<AdminBoard> board = service.selectReport((int) session.getAttribute("fire_station_id"), startRowNo,endRowNo);
		AdminFireStation station = service.selectFireStation((int) session.getAttribute("fire_station_id"));

		model.addAttribute("board", board);
		model.addAttribute("station", station);

		model.addAttribute("pagesPerGroup", pagesPerGroup);
		model.addAttribute("totalPageNum", totalPageNum);
		model.addAttribute("totalGroupNum", totalGroupNum);
		model.addAttribute("groupNo", groupNo);
		model.addAttribute("startPageNo", startPageNo);
		model.addAttribute("endPageNo", endPageNo);
		model.addAttribute("pageNo", pageNo);
		return "admin/report";
	}

	@RequestMapping("/obBoard")
	public String obBoard(Model model, HttpSession session, AdminFireStation fireStation, AdminLatLon adminLatLon,
			@RequestParam(defaultValue = "1") int pageNo) {

		if (session.getAttribute("fire_station_id") == null) {
			System.out.println("아이디 없습니다.");
			return "redirect:/admin/loginForm";
		}

		session.setAttribute("pageNo", pageNo);

		// ---------------------------------페이징
		int rowsPerPage = 8;// 페이지당 행수
		int pagesPerGroup = 10;// 이전, 다음을 클릭했을때 나오는 그룹당 페이지 수
		int totalRowNum = service.getTotalRowNo((int) session.getAttribute("fire_station_id"));// 전체 게시물 수
		int totalPageNum = totalRowNum / rowsPerPage;// 전체 페이지 수
		if (totalRowNum % rowsPerPage != 0)
			totalPageNum++;// 뒤에 짜투리도 페이지수로 인정
		int totalGroupNum = totalPageNum / pagesPerGroup;// 전체 그룹 수
		if (totalPageNum % pagesPerGroup != 0)
			totalGroupNum++;
		int groupNo = (pageNo - 1) / pagesPerGroup + 1;// 현재페이지의 그룹번호
		int startPageNo = (groupNo - 1) * pagesPerGroup + 1;// 현재 그룹의 시작 페이지 번호
		int endPageNo = startPageNo + pagesPerGroup - 1;// 현재 그룹의 마지막 페이지 번호
		if (groupNo == totalGroupNum)
			endPageNo = totalPageNum;
		int startRowNo = (pageNo - 1) * rowsPerPage + 1;// 공식//현재시작 페이지의 행 번호
		int endRowNo = pageNo * rowsPerPage;// 현재공식//해당 페이지의 끝 행번호
		if (pageNo == totalPageNum) { // 현재 그룹의 번호가 전체 그룹 수(마지막 그룹번호)와 같다면
			endRowNo = totalRowNum; // 끝 행 번호는 전체 행 번호 수 만큼 된다
		}
		// ---------------------------------페이징

		List<ObBoard> obBoardList = service.selectObBoardList((int) session.getAttribute("fire_station_id"), startRowNo,endRowNo);
		AdminFireStation station = service.selectObFireStation((int) session.getAttribute("fire_station_id"));

		model.addAttribute("obBoardList", obBoardList);
		model.addAttribute("station", station);

		model.addAttribute("pagesPerGroup", pagesPerGroup);
		model.addAttribute("totalPageNum", totalPageNum);
		model.addAttribute("totalGroupNum", totalGroupNum);
		model.addAttribute("groupNo", groupNo);
		model.addAttribute("startPageNo", startPageNo);
		model.addAttribute("endPageNo", endPageNo);
		model.addAttribute("pageNo", pageNo);

		return "admin/observe_board";

	}

	@RequestMapping("/obBoardPicture")
	public String obBoardPicture(int report_no, Model model, HttpSession session) {
		System.out.println(report_no);
		List<ObBoardPicture> obBoardPicture = service.selectObBoardPicture(report_no);
		model.addAttribute("obBoardPicture", obBoardPicture);
		return "admin/obBoardPicture";
	}

	@RequestMapping("/observe_map")
	public String observe_map() {
		return "admin/observe_map";
	}

	@RequestMapping("/handle")
	public String handle(HttpServletRequest request) {
		int reportNo = Integer.parseInt(request.getParameter("reportNo"));
		String handle_result = "";
		if (request.getParameter("Y") != null) {
			handle_result = "Y";
		} else if (request.getParameter("R") != null) {
			handle_result = "R";
		} else {
			handle_result = "N";
		}
		service.updateHandle(reportNo, handle_result);
		return "redirect:/admin/content";
	}

	@RequestMapping("/acBoard")
	public String acBoard(Model model, HttpSession session, AdminFireStation fireStation, AdminLatLon adminLatLon,
			@RequestParam(defaultValue = "1") int pageNo) {

		if (session.getAttribute("fire_station_id") == null) {
			System.out.println("아이디 없습니다.");
			return "redirect:/admin/loginForm";
		}

		session.setAttribute("pageNo", pageNo);

		// ---------------------------------페이징
		int rowsPerPage = 8;// 페이지당 행수
		int pagesPerGroup = 10;// 이전, 다음을 클릭했을때 나오는 그룹당 페이지 수
		int totalRowNum = service.getTotalRowNo((int) session.getAttribute("fire_station_id"));// 전체 게시물 수
		int totalPageNum = totalRowNum / rowsPerPage;// 전체 페이지 수
		if (totalRowNum % rowsPerPage != 0)
			totalPageNum++;// 뒤에 짜투리도 페이지수로 인정
		int totalGroupNum = totalPageNum / pagesPerGroup;// 전체 그룹 수
		if (totalPageNum % pagesPerGroup != 0)
			totalGroupNum++;
		int groupNo = (pageNo - 1) / pagesPerGroup + 1;// 현재페이지의 그룹번호
		int startPageNo = (groupNo - 1) * pagesPerGroup + 1;// 현재 그룹의 시작 페이지 번호
		int endPageNo = startPageNo + pagesPerGroup - 1;// 현재 그룹의 마지막 페이지 번호
		if (groupNo == totalGroupNum)
			endPageNo = totalPageNum;
		int startRowNo = (pageNo - 1) * rowsPerPage + 1;// 공식//현재시작 페이지의 행 번호
		int endRowNo = pageNo * rowsPerPage;// 현재공식//해당 페이지의 끝 행번호
		if (pageNo == totalPageNum) { // 현재 그룹의 번호가 전체 그룹 수(마지막 그룹번호)와 같다면
			endRowNo = totalRowNum; // 끝 행 번호는 전체 행 번호 수 만큼 된다
		}
		// ---------------------------------페이징

		List<AcBoard> acBoardList = service.selectAcBoardList((int) session.getAttribute("fire_station_id"), startRowNo,endRowNo);
		AdminFireStation station = service.selectAcFireStation((int) session.getAttribute("fire_station_id"));

		model.addAttribute("acBoardList", acBoardList);
		model.addAttribute("station", station);

		model.addAttribute("pagesPerGroup", pagesPerGroup);
		model.addAttribute("totalPageNum", totalPageNum);
		model.addAttribute("totalGroupNum", totalGroupNum);
		model.addAttribute("groupNo", groupNo);
		model.addAttribute("startPageNo", startPageNo);
		model.addAttribute("endPageNo", endPageNo);
		model.addAttribute("pageNo", pageNo);

		return "admin/accident_board";

	}

	@RequestMapping("/acBoardPicture")
	public String acBoardPicture(int report_no, Model model, HttpSession session) {
		List<AcBoardPicture> acBoardPicture = service.selectAcBoardPicture(report_no);
		model.addAttribute("acBoardPicture", acBoardPicture);
		return "admin/acBoardPicture";
	}

	@RequestMapping("/accident_map")
	public String accident_map() {
		return "admin/accident_map";
	}

}