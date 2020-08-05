package Bean;

public class CommentBean {
	private int idcomment;
	private String content;
	private int selfkey;
	private String time;
	private int board_idboard;
	private int idmember;
	public void set_idcomment(int idcomment) {
		this.idcomment=idcomment;
	}public void set_content(String content) {
		this.content = content;
	}public void set_selfkey(int selfkey) {
		this.selfkey=selfkey;
	}public void set_time(String time) {
		this.time =time;
	}public void set_board_idboard(int board_idboard) {
		this.board_idboard=board_idboard;
	}public void set_idmember(int idmember) {
		this.idmember =idmember;
	}public int get_idcomment() {
		return this.idcomment;
	}public String get_content() {
		return this.content;
	}public int get_selfkey() {
		return this.selfkey;
	}public String get_time() {
		return this.time;
	}public int get_board_idboard() {
		return this.board_idboard;
	}public int get_idmember() {
		return this.idmember;
	}
}
