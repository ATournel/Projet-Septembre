
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

		String login = request.getParameter("pseudo");
		String pwd = request.getParameter("password");
		if (login == null)
			login = "";
		if (pwd == null)
			pwd = "";

		HttpSession session = request.getSession(true);
		session.setAttribute("sessionLogin", login);
		session.setAttribute("sessionPwd", pwd);

		String notLogged = "<a href='subscribe.jsp' class=\"bigLink\">INSCRIPTION</a>-<a href='Sign_in' class=\"bigLink\">CONNEXION</a>";
		session.setAttribute("connect", notLogged);

		request.getRequestDispatcher("/signInForm.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String login = request.getParameter("pseudo");
		String pwd = request.getParameter("password");

		HttpSession session = request.getSession(true);
		session.setAttribute("sessionLogin", login);
		session.setAttribute("sessionPwd", pwd);

		ResultSet result = null;
		ResultSet result2 = null;
		Login instanceLogin = new Login();

		String logged = "<form action='profilPersoSave.jsp'><input type='hidden' value='" + login
				+ "' name='userLogin'><input type='submit' class='bigLink' value='VOIR MON PROFIL'></form>";
		String notLogged = "<a href='subscribe.jsp' class=\"bigLink\">INSCRIPTION</a>-<a href='Sign_in' class=\"bigLink\">CONNEXION</a>";
		session.setAttribute("connect", notLogged);
		String mailCompte = "";

		try {

			Class.forName("com.mysql.jdbc.Driver");

			String url = "jdbc:mysql://localhost:3306/mayagenda?useSSL=false";
			String user = "root";
			String psw = "Ioplop88";


			Connection con = (Connection) DriverManager.getConnection(url, user, psw);

			Statement st = (Statement) con.createStatement();
			Statement st2 = (Statement) con.createStatement();
			String sql = "SELECT mdp FROM compte WHERE pseudo='" + session.getAttribute("sessionLogin") + "'";
			result = st.executeQuery(sql);
			instanceLogin.setPws("");

			String sql2 = "SELECT pseudo, mail_compte FROM compte WHERE pseudo='" + session.getAttribute("sessionLogin")
					+ "'";
			result2 = st2.executeQuery(sql2);

			while (result2.next()) {

				instanceLogin.setOk(true);
				mailCompte = result2.getString("mail_compte");

			}

			while (result.next()) {

				instanceLogin.setPws(result.getString("mdp"));

			}

		} catch (ClassNotFoundException e) {

			e.printStackTrace();

		} catch (SQLException e) {

			e.printStackTrace();
		}

		if (instanceLogin.getOk() == true) {
			if ((instanceLogin.getPws()).equals(session.getAttribute("sessionPwd"))) {
				System.out.println("ok");
				session.setAttribute("isConnected", true);
				session.setAttribute("connect", logged);
				session.setAttribute("mailCompte", mailCompte);

				request.getRequestDispatcher("/pageEvenement.jsp").forward(request, response);
			} else {

				request.getRequestDispatcher("/signInError.jsp").forward(request, response);
				session.setAttribute("isConnected", false);
				session.setAttribute("connect", notLogged);
			}
		} else {

			request.getRequestDispatcher("/signInError.jsp").forward(request, response);
			session.setAttribute("isConnected", false);
			session.setAttribute("connect", notLogged);
		}

	}

}
