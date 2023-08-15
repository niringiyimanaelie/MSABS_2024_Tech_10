import argparse
import mysql.connector
import csv


def connect_to_database(hostname, username, password, database, port):
    try:
        connection = mysql.connector.connect(
            host=hostname,
            user=username,
            password=password,
            database=database,
            port=port
        )
        return connection
    except mysql.connector.Error as err:
        print("Error connecting to the database:", err)
        return None


def fetch_and_export_data(connection, table_name, csv_file_path):
    try:
        if connection.is_connected():
            cursor = connection.cursor()
            query = f"SELECT * FROM {table_name}"
            cursor.execute(query)
            result = cursor.fetchall()

            with open(csv_file_path, 'w', newline='', encoding='utf-8') as csv_file:
                csv_writer = csv.writer(csv_file)
                csv_writer.writerow([column[0]
                                    for column in cursor.description])
                csv_writer.writerows(result)

            print(f"Data exported as CSV: {csv_file_path}")
    except mysql.connector.Error as err:
        print("Error fetching and exporting data:", err)


def main():
    parser = argparse.ArgumentParser(
        description="Export data from MySQL to CSV")
    parser.add_argument('-t', '--table', required=True,
                        help="Name of the table")
    parser.add_argument('-c', '--csv', required=True,
                        help="Path to the CSV file")
    args = parser.parse_args()

    # Replace with your actual database credentials
    db_hostname = "your_db_hostname"
    db_username = "your_db_username"
    db_password = "your_db_password"
    db_name = "MSBA_Team10"
    db_port = 3306

    connection = connect_to_database(
        db_hostname, db_username, db_password, db_name, db_port)

    if connection:
        fetch_and_export_data(connection, args.table, args.csv)
        connection.close()
        print("Database connection closed")


if __name__ == "__main__":
    main()
