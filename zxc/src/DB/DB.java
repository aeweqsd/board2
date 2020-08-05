package DB;

public class DB {
	public static void insertDB(DBUSE DB,Object a) {
		DB.insertDB(a);
	}
	public static Object selectDB(DBUSE DB,Object a) {
		return DB.selectDB(a);
	}
	public static void deleteDB(DBUSE DB,Object a) {
		DB.deleteDB(a);
	}
	public static void updateDB(DBUSE DB,Object a) {
		DB.selectDB(a);
	}
}
