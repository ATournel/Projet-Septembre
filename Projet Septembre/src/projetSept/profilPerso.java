package projetSept;

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

@WebServlet("/profilPerso")
public class profilPerso extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public profilPerso() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("in the doGet");

		String userLogin = (String) request.getParameter("userLogin");

		System.out.println(userLogin);

		request.getRequestDispatcher("/profilPerso.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("in the doPost");

		HttpSession session = request.getSession(true);
		String userLogin = (String) request.getParameter("userLogin");

		String nom = null;
		String prenom = null;
		String mail_compte = null;

		try {

			Class.forName("com.mysql.jdbc.Driver");

			String url = "jdbc:mysql://localhost:3306/mayagenda?useSSL=false";
			String user = "root";
			String psw = "ioplop88";

			Connection con = (Connection) DriverManager.getConnection(url, user, psw);

			Statement st = (Statement) con.createStatement();

			String sql = "SELECT nom, prenom, pseudo, mail_compte FROM compte WHERE pseudo= '"
					+ userLogin + "'";
			ResultSet result = st.executeQuery(sql);

			while (result.next())
				;

			nom = result.getString("nom");
			prenom = result.getString("prenom");
			mail_compte = result.getString("mail_compte");

		} catch (ClassNotFoundException e) {

			e.printStackTrace();

		} catch (SQLException e) {

			e.printStackTrace();
		}
		session.setAttribute("nomProfil", nom);

		request.getRequestDispatcher("/profilPerso.jsp").forward(request, response);
	}

}
