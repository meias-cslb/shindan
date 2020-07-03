package shindan;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ResultServlet
 */
@WebServlet("/result")
public class ResultServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ResultServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

//		文字化け防止
		request.setCharacterEncoding("UTF-8");
//		入力された名前を取得
		String name = request.getParameter("name");

		String jsp = null;

//		名前がnull、または空であれば
		if(name == null || name.isEmpty()) {
//			messageに「名前入れてー！」を上書き
			request.setAttribute("message", "名前入れてー！");
//			top.jspへ転送準備
			jsp = "/WEB-INF/jsp/top.jsp";
		} else {
//			診断結果とメッセージを配列に入れる
			String[] answers = {"90%", "70%", "50%", "30%"};
			String[] messages = {
					"親友レベル！たむらの魅力にドハマりしちゃったね！",
					"もう友達だね！でもまだまだたむらの魅力は満載だよ！",
					"たむらの魅力に気付いてきた？もっと知ったらハマっちゃうかもよ！",
					"まだまだたむらの魅力がわかってないね！もっと知っていこうね！"
			};

//			診断結果を判定
			int index = this.calculateIndex(request);

//			診断結果とメッセージを取得
			String answer = answers[index];
			String message = messages[index];

//			名前、診断結果、メッセージを上書き
			request.setAttribute("name", name);
			request.setAttribute("answer", answer);
			request.setAttribute("message", message);

//			result.jspに転送準備
			jsp = "/WEB-INF/jsp/result.jsp";
 		}

//		top.jsp or result.jspに転送し、表示
		RequestDispatcher dispatcher = request.getRequestDispatcher(jsp);
		dispatcher.forward(request, response);
	}

	private int calculateIndex(HttpServletRequest request) {
		int [] counts = new int[4];
		String[] parameters = {"q1", "q2", "q3", "q4", "q5"};

		Arrays.fill(counts, 0);

		for(String parameter : parameters) {
			int index = Integer.parseInt(request.getParameter(parameter));
			counts[index] = counts[index] + 1;
		}

		int index = 0;
		int count = 0;
		for(int i = 0; i < counts.length; i++) {
			if(counts[i] > count) {
				index = i;
				count = counts[i];
			}
		}

		return index;
	}

}
