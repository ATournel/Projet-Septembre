package projetSept;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class SignInServlet
 */
@WebServlet("/Sign_in")
public class SignInServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignInServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String login = request.getParameter("email");
		String pwd = request.getParameter("password");
		if (login == null) login = "";
		if (pwd == null) pwd = "";
		
		HttpSession session = request.getSession(true);
		session.setAttribute("sessionLogin", login);
		session.setAttribute("sessionPwd", pwd);
		
		request.getRequestDispatcher("/signInForm.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String login = request.getParameter("email");
		String pwd = request.getParameter("password");
		
		HttpSession session = request.getSession(true);
		session.setAttribute("sessionLogin", login);
		session.setAttribute("sessionPwd", pwd);
		
		if (login.equals("Terg") && pwd.equals("toto")) {
			
			request.getRequestDispatcher("/home.jsp").forward(request, response);
			session.setAttribute("isConnected", true);
		}
		else {
			
			request.getRequestDispatcher("/signInForm.jsp").forward(request, response);
			session.setAttribute("isConnected", false);
		}
				
	}

}
