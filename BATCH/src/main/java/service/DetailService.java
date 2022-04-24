package service;

import java.io.IOException;
import java.util.Optional;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import common.ActionForward;
import repository.StudentDAO;

public class DetailService implements StudentService {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

		Optional<String> optNo = Optional.ofNullable(request.getParameter("stuNo"));
		Long stuNo = Long.parseLong(optNo.orElse("0"));

		request.setAttribute("student", StudentDAO.getInstance().selectStuByNo(stuNo));

		return new ActionForward("student/detail.jsp", false);
	}

}