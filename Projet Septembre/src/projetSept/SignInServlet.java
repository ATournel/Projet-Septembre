package projetSept;

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String login = request.getParameter("email");
		String pwd = request.getParameter("password");
		if (login == null)
			login = "";
		if (pwd == null)
			pwd = "";

		HttpSession session = request.getSession(true);
		session.setAttribute("sessionLogin", login);
		session.setAttribute("sessionPwd", pwd);

		request.getRequestDispatcher("/signInForm.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String login = request.getParameter("email");
		String pwd = request.getParameter("password");

		HttpSession session = request.getSession(true);
		session.setAttribute("sessionLogin", login);
		session.setAttribute("sessionPwd", pwd);

		ResultSet result = null;
		Login instanceLogin = new Login();

		try {

			Class.forName("com.mysql.jdbc.Driver");

			String url = "jdbc:mysql://localhost:3306/mayagenda";
			String user = "root";
			String psw = "Ioplop88";

			Connection con = (Connection) DriverManager.getConnection(url, user, psw);

			Statement st = (Statement) con.createStatement();
			String sql = "Select mdp FROM compte WHERE pseudo='" + session.getAttribute("sessionLogin") + "'";
			result = st.executeQuery(sql);

			while (result.next()) {

				instanceLogin.setPws(result.getString("mdp"));

			}

		} catch (ClassNotFoundException e) {

			e.printStackTrace();

		} catch (SQLException e) {

			e.printStackTrace();
		}

		if ((instanceLogin.getPws()).equals(session.getAttribute("sessionPwd"))) {
			
			request.getRequestDispatcher("/pageEvenement.jsp").forward(request, response);
			session.setAttribute("isConnected", true);
		} else {
			
			request.getRequestDispatcher("/signInForm.jsp").forward(request, response);
			session.setAttribute("isConnected", false);
		}

	}

}
