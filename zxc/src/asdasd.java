

import java.io.IOException;
import java.util.StringTokenizer;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import DB.*;
import Bean.*;
/**
 * Servlet implementation class asdasd
 */
@WebServlet("/service/*")
public class asdasd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public asdasd() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
//		System.out.println(request.getParameter("remember"));
//		System.out.println(request);
//		System.out.println(request.getContextPath());
		String rpath= "";
		String url = extraction(request,response);
			if(url.equals("login"))
				login(request,response,session);
			else if(url.equals("logout"))
				logout(request,response,session);
			else if(url.equals("memberinsert"))
				member_insert(request,response);
			else if(url.equals("writing"))
				insert_board(request,response);
			else if(url.equals("boardsee"))
				select_board(request,response);
			else if(url.equals("boardmodified"))
				update_board(request,response);
			else if(url.equals("boarddelete"))
				delete_board(request,response);
			else if(url.equals("board"))
				board(request,response);
			else{
				rpath = path(url);
				RequestDispatcher Dis = request.getRequestDispatcher(rpath);
				Dis.forward(request, response);
			}
		
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
		doGet(request, response);
	}
	protected String extraction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String url = request.getRequestURI();
		String Ourl = request.getContextPath();
		StringTokenizer st = new StringTokenizer(url.substring(Ourl.length()+9),".");
		String path = st.nextToken();
		request.setAttribute("title",path);
		return path;
	}
	protected String path(String path) {
		String path2 = "/"+path+".jsp";
		return path2;
		
	}
	protected void login(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws ServletException, IOException {
		String id= request.getParameter("id");
		String password = request.getParameter("password");
		MemberBean status = new MemberBean();
		MemberBean info = new MemberBean();
		info.set_memberid(id);   			
		info.set_password(password);
		Member a = new Member();
		status = (MemberBean) DB.selectDB(a, info);
		if(password.equals(status.get_password())) {
		session.setAttribute("status", status);
	
			if(request.getParameter("remember") !=null && request.getParameter("remember").equals("1")) {
				Cookie c = new Cookie("id",request.getParameter("id"));
				c.setComment("id 정보");
				c.setMaxAge(60*60*24);
				response.addCookie(c);
				board(request,response);
			}
			else {
				board(request,response);
			}
		}
		else {
			System.out.println("로그인에 실패하였습니다");
			String path= "NewFile.jsp";
			RequestDispatcher Dis = request.getRequestDispatcher(path);
			Dis.forward(request, response);
		}
		
	}
	protected void logout(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws ServletException, IOException {
		session.invalidate();
		String path="/NewFile.jsp";
		RequestDispatcher Dis = request.getRequestDispatcher(path);
		Dis.forward(request, response);
	}
	protected void member_insert(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberid = request.getParameter("id");
		String password = request.getParameter("password");
		MemberBean info = new MemberBean();
		info.set_memberid(memberid);
		info.set_password(password);
		Member a = new Member();
		DB.insertDB(a, info);
		String path="/NewFile.jsp";
		RequestDispatcher Dis = request.getRequestDispatcher(path);
		Dis.forward(request, response);
	}
	protected void insert_board(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		BoardBean board = new BoardBean();
		board.set_content(request.getParameter("content"));
		board.set_name(request.getParameter("name"));
		int memnum = Integer.parseInt(request.getParameter("num"));
		board.set_idmember(memnum);
		board.set_hit(0);
		Board b = new Board();
		DB.insertDB(b, board);
		board(request,response);
		
	}
	protected void select_board(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		BoardBean board = new BoardBean();
		board.set_idboard(Integer.parseInt(request.getParameter("num")));
		Board b = new Board();
		request.setAttribute("see",DB.selectDB(b,board));
		String path="/boardsee.jsp";
		RequestDispatcher Dis = request.getRequestDispatcher(path);
		Dis.forward(request, response);
		
	}
	protected void update_board(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		BoardBean board = new BoardBean();
		Board b = new Board();
		request.setAttribute("see",DB.selectDB(b,board));
		String path="/boardsee.jsp";
		RequestDispatcher Dis = request.getRequestDispatcher(path);
		Dis.forward(request, response);
		
	}
	protected void delete_board(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		BoardBean board = new BoardBean();
		board.set_idboard(Integer.parseInt(request.getParameter("num")));
		Board b = new Board();
		DB.deleteDB(b, board);
		String path="/board.jsp";
		RequestDispatcher Dis = request.getRequestDispatcher(path);
		Dis.forward(request, response);
		
	}
	protected void board(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int pagenum1=1;
		request.setAttribute("pagenum", pagenum1);
		if(request.getParameter("pagenum")!=null) {
				String pagenum = request.getParameter("pagenum");
				int pa = Integer.parseInt(pagenum);
				request.setAttribute("pagenum", pa);
		}
	    String path="/board.jsp";
		RequestDispatcher Dis = request.getRequestDispatcher(path);
		Dis.forward(request, response);
		
	}

}
