import java.sql.*;
import java.util.Scanner;

public class TrackMeetInterface {

	public static void main(String[] args) throws ClassNotFoundException {

		int entry = 0;

		while (entry != 6){
			System.out.println("""
					Please select an option:\s
					1: To add a new Athlete\s
					2: To enter a new result\s
					3: To get the results for an event\s
					4: To disqualify athlete\s
					5: To score the meet\s
					6: TO QUIT""");

			Scanner sc= new Scanner(System.in);
			System.out.print("Enter Number: ");
			entry= sc.nextInt();
			System.out.println("\n");

			switch (entry) {

				case 1: // add new athlete

					System.out.println("Enter the competitor's first name: ");
					String firstNameAdd = sc.next();
					sc.nextLine();

					System.out.println("Enter the competitor's last name: ");
					String lastNameAdd = sc.next();
					sc.nextLine();

					System.out.println("Enter the competitor's gender('M' or 'F'): ");
					String genderAdd = sc.next();
					sc.nextLine();

					System.out.println("Enter the competitor's school: ");
					String schoolAdd = sc.nextLine();


					System.out.println("Enter the competitor's schoolId: ");
					int schoolIdAdd = Integer.parseInt(sc.next());

					addAthlete(firstNameAdd, lastNameAdd, genderAdd, schoolAdd, schoolIdAdd);
					break;

				case 2: // enter new result

					System.out.println("Enter the competitor's Id: ");
					int athleteIdResultAdd = Integer.parseInt(sc.next());
					sc.nextLine();

					System.out.println("Enter the competitor's school: ");
					String schoolResultAdd = sc.nextLine();

					System.out.println("Enter the competitor's event Id: ");
					int eventIdResultAdd = Integer.parseInt(sc.next());
					sc.nextLine();

					System.out.println("Enter the competitor's time or distance: ");
					Float eventTimeResultAdd = Float.valueOf(sc.next());
					sc.nextLine();

					System.out.println("Enter the competitor's placement: ");
					int placeResultAdd = Integer.parseInt(sc.next());
					sc.nextLine();

					System.out.println("Enter the competitor's points: ");
					int pointsResultAdd = Integer.parseInt(sc.next());
					sc.nextLine();

					System.out.println("Enter the if the competitor is disqualified: ");
					String disqualifiedResultAdd = sc.next();

					newResult(athleteIdResultAdd, schoolResultAdd, eventIdResultAdd, eventTimeResultAdd, placeResultAdd, pointsResultAdd, disqualifiedResultAdd);
					break;

				case 3: // view results
					System.out.println("------ Event ID's ------");
					System.out.println("1 = 100 Meter Dash - Men's");
					System.out.println("2 = 100 Meter Dash - Women's");
					System.out.println("3 = Javelin - Men's");
					System.out.println("4 = Javelin - Women's");
					System.out.println("5 = 400 Meter Dash - Men's");
					System.out.println("6 = 400 Meter Dash - Women's");
					System.out.println("7 = Discus Throw - Men's");
					System.out.println("8 = Discus Throw - Women's");

					System.out.print("Enter event ID: ");
					int eventId = sc.nextInt();

					System.out.println("\n");
					getResults(eventId);
					break;

				case 4: // to disqualify athlete

					System.out.println("Enter the athlete's ID: ");
					int disqualifiedAthleteId = sc.nextInt();

					disqualifyAthlete(disqualifiedAthleteId);
					break;


				case 5: // to get final scores of the events

					finalScore();
					break;

				case 6: // to quit
					break;
			}
		}
	}




	// Case 1
	private static void addAthlete(String firstNameAdd, String lastNameAdd, String genderAdd, String schoolAdd, int schoolIdAdd) throws ClassNotFoundException {
		Class.forName("com.mysql.cj.jdbc.Driver");

		try {
			String user = "root";
			String password = "secret";
			String myURL = "jdbc:mysql://localhost/dbyanceytrack?autoReconnect=true&useSSL=false";

			Connection conn = DriverManager.getConnection(myURL, user, password);

			Statement stmt = conn.createStatement();
			stmt.execute("INSERT INTO athletes (firstName, lastName, gender, School, SchoolId) VALUES (\"" + firstNameAdd + "\", \"" + lastNameAdd + "\", \"" + genderAdd + "\", \"" + schoolAdd + "\", " + schoolIdAdd + ");");

			System.out.println("\n");

			conn.close();

		} catch (SQLException ex) {
			System.out.println("SQLException: " + ex.getMessage());
			System.out.println("SQLState: " + ex.getSQLState());
			System.out.println("VendorError: " + ex.getErrorCode());
			ex.printStackTrace();
		}
	}




	// Case 2
	private static void newResult(int athleteIdResultAdd, String schoolResultAdd, int eventIdResultAdd, Float eventTimeResultAdd, int placeResultAdd, int pointsResultAdd, String disqualifiedResultAdd) throws ClassNotFoundException {
		Class.forName("com.mysql.cj.jdbc.Driver");

		try {
			String user = "root";
			String password = "secret";
			String myURL = "jdbc:mysql://localhost/dbyanceytrack?autoReconnect=true&useSSL=false";

			Connection conn = DriverManager.getConnection(myURL, user, password);

			Statement stmt = conn.createStatement();
			stmt.execute("INSERT INTO results (athleteId, school, eventId, eventTime, place, points, disqualified) VALUES (" + athleteIdResultAdd + ", \"" + schoolResultAdd +
					"\", " + eventIdResultAdd + ", " + eventTimeResultAdd + ", " + placeResultAdd + ", " + pointsResultAdd + ", \"" + disqualifiedResultAdd + "\");");

			System.out.println("\n");

			conn.close();

		} catch (SQLException ex) {
			System.out.println("SQLException: " + ex.getMessage());
			System.out.println("SQLState: " + ex.getSQLState());
			System.out.println("VendorError: " + ex.getErrorCode());
			ex.printStackTrace();
		}

	}






	// Case 3
	private static void getResults(int eventId) throws ClassNotFoundException {
		Class.forName("com.mysql.cj.jdbc.Driver");

		try {
			String user = "root";
			String password = "secret";
			String myURL = "jdbc:mysql://localhost/dbyanceytrack?autoReconnect=true&useSSL=false";

			Connection conn = DriverManager.getConnection(myURL, user, password);

			Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
			boolean gotResults = stmt.execute("SELECT * from results where eventId = " + eventId);

			ResultSet rs = stmt.getResultSet(); //get a "Result Set"
			rs.first();							//go to first record in the result set

			System.out.println("|Place |AthleteId  |School                       |Result |Points |Disqualified |");
			System.out.println("---------------------------------------------------------------------------------------");

			while (gotResults) {
				int athleteId = rs.getInt("athleteid");
				String school = rs.getString("school");
				float eventTime = rs.getFloat("eventTime");
				int place = rs.getInt("place");
				int points = rs.getInt("points");
				String disqualified = rs.getString("disqualified");
				System.out.println("|" + place + "\t\t|" + athleteId + "\t\t\t|" + school + "\t|"
						+ eventTime + "\t\t|" + points + "\t\t|" + disqualified + "\t\t|");
				gotResults = rs.next();
			}
			System.out.println("\n");

			conn.close();

		} catch (SQLException ex) {
			System.out.println("SQLException: " + ex.getMessage());
			System.out.println("SQLState: " + ex.getSQLState());
			System.out.println("VendorError: " + ex.getErrorCode());
			ex.printStackTrace();
		}
	}



	// Case 4
	private static void disqualifyAthlete(int disqualifiedAthleteId) throws ClassNotFoundException {

		Class.forName("com.mysql.cj.jdbc.Driver");

		try {
			String user = "root";
			String password = "secret";
			String myURL = "jdbc:mysql://localhost/dbyanceytrack?autoReconnect=true&useSSL=false";

			Connection conn = DriverManager.getConnection(myURL, user, password);

			Statement stmt = conn.createStatement();
			stmt.execute("UPDATE results SET place = NULL, points = 0, disqualified = \"Yes\" WHERE athleteId = " + disqualifiedAthleteId + ";");

			System.out.println("\n");

			conn.close();

		} catch (SQLException ex) {
			System.out.println("SQLException: " + ex.getMessage());
			System.out.println("SQLState: " + ex.getSQLState());
			System.out.println("VendorError: " + ex.getErrorCode());
			ex.printStackTrace();
		}
	}






	// Case 5
	private static void finalScore() throws ClassNotFoundException {
		Class.forName("com.mysql.cj.jdbc.Driver");

		try {
			String user = "root";
			String password = "secret";
			String myURL = "jdbc:mysql://localhost/dbyanceytrack?autoReconnect=true&useSSL=false";

			Connection conn = DriverManager.getConnection(myURL, user, password);

			Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
			boolean gotResults  = stmt.execute("Select points, school From results;");

			ResultSet rs = stmt.getResultSet();
			rs.first();

			while (gotResults) {
				int points = rs.getInt("points");
				String school = rs.getString("school");
				System.out.println(points + "\t" + school);
				gotResults = rs.next();
			}
			System.out.println("\n");


			conn.close();

		} catch (SQLException ex) {
			System.out.println("SQLException: " + ex.getMessage());
			System.out.println("SQLState: " + ex.getSQLState());
			System.out.println("VendorError: " + ex.getErrorCode());
			ex.printStackTrace();
		}
	}
}
