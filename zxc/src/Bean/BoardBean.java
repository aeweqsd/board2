package Bean;

public class BoardBean {
	private int relative;
	private int idboard;
	private String name;
	private String content;
	private int hit;
	private String time;
	private int idmember;
	private String memberid;
	public void set_relative(int relative) {
		this.relative=relative;
	}
	public void set_idboard(int idboard) {
		this.idboard=idboard;
	}
	public void set_name(String name) {
		this.name = name;
	}
	public void set_content(String content) {
		this.content=content;
	}
	public void set_hit(int hit) {
		this.hit= hit;
	}
	public void set_time(String time) {
		this.time= time;
	}
	public void set_idmember(int idmember) {
		this.idmember =idmember;
	}public void set_memberid(String memberid) {
		this.memberid=memberid;
	}
	public int get_idboard(){
		return this.idboard;
	}public String get_name() {
		return this.name;
	}public String get_content() {
		return this.content;
	}public int get_hit() {
		return this.hit;
	}public String get_time() {
		return this.time;
	}public int get_idmember() {
		return this.idmember;
	}public String get_memberid() {
		return this.memberid;
	}public int get_relative() {
		return this.relative;
	}
}
