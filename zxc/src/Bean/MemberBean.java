package Bean;

public class MemberBean {
	private int idmemeber;
	private String memberid;
	private String password;
	public void set_idmember(int idmember) {
		this.idmemeber= idmember;
	}public void set_memberid(String memberid) {
		this.memberid = memberid;
	}public void set_password(String password) {
		this.password=password;
	}public int get_idmember() {
		return this.idmemeber;
	}public String get_memberid() {
		return this.memberid;
	}public String get_password() {
		return this.password; 
	}

}
