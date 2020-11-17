package com.project.saleforce.service;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.saleforce.model.EmpVO;
import com.project.saleforce.repository.EmpDao;

@Service
public class EmpSrv {
	@Autowired
	EmpDao empDao;

	public void setEmp(EmpVO evo) {
		empDao.setEmp(evo);
	}

	public int idCheck(String empid) {
		return empDao.idCheck(empid);
	}

	public EmpVO setSessionLogin(EmpVO evo, HttpSession session) {
		EmpVO vo = empDao.setSessionLogin(evo);

		if (vo != null) {
			session.setAttribute("empid", vo.getEmpid());
			session.setAttribute("emppwd", vo.getEmppwd());
			session.setAttribute("empname", vo.getEmpnm());
			session.setAttribute("deptid", vo.getDeptid());
			session.setAttribute("grade", vo.getGrade());
			session.setAttribute("empauth", vo.getEmpauth());
			session.setAttribute("email", vo.getEmail());
			session.setAttribute("birth", vo.getBirth());
			session.setAttribute("regnum", vo.getRegnum());
			session.setAttribute("empaddr", vo.getEmpaddr());
			session.setAttribute("joindate", vo.getJoindate());
			session.setAttribute("emphp", vo.getEmphp());
			session.setAttribute("empcp", vo.getEmpcp());
			session.setAttribute("accountnum", vo.getAccountnum());
			session.setAttribute("hope", vo.getHope());
			session.setAttribute("licence", vo.getLicence());
			session.setAttribute("hobby", vo.getHobby());
			session.setAttribute("forte", vo.getForte());
			session.setAttribute("linguistic", vo.getLinguistic());
			session.setAttribute("reward", vo.getReward());
			session.setAttribute("nowdate", vo.getRegdate());
		}

		return vo;
	}

	public void logout(HttpSession session) {
		session.invalidate();
	}
	
	public String pwdFind(EmpVO evo) {
		return empDao.pwdFind(evo);
	}
	
	// ################################# 사원목록 소스 시작   ##################################

	
		public List<EmpVO> getEmpList(int start, int end, String searchOpt, String words) {
			return empDao.getEmpList(start, end, searchOpt, words);
		}

	
		public EmpVO getEmpListOne(String empID) {
			return empDao.getEmpListOne(empID);
		}

	
		public void setEmpOthers(EmpVO empvo) {
			empDao.setEmpOthers(empvo);
			
		}
		
		public void setRegAll(EmpVO evo) {
			empDao.setRegAll(evo);
		}

		// ################################# 사원목록 소스 끝   #################################
		
	// ### 사내연락망
		public List<EmpVO> getEmpContactList(int start, int end, String searchOpt, String words) {
			return empDao.getEmpContactList(start, end, searchOpt, words);
		}
}
