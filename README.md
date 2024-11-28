# car_park_app
Task: Car Check-in and Check-out System
Requirements:
1. Local Database Setup:
● Use a local database (e.g., Sqflite or Isar) to store car check-in and check-out data.
● Each car should have at least the following fields:
● carNumber (String, unique)
● checkInTime (DateTime)
● checkOutTime (nullable DateTime)

2. Check-in Flow:
● Create a screen where the user can enter a car number to check it in.
● Once checked in, the car’s information (car number and check-in time) should be stored
in the local database.
● Validate that the same car cannot be checked in again until it is checked out.


3. Display Cars Not Checked Out:
● Create a screen that displays a list of all cars that have been checked in but not yet
checked out.
● For each car, show the car number and check-in time.
4. Check-out Flow:
● Add an option (e.g., a button) next to each car in the list to check it out.
● When a car is checked out, store the checkOutTime in the database and remove it from
the list of unchecked-out cars.

5. Basic UI:
● The UI does not need to be complex, but it should be functional and easy to understand.

Bonus:
● Implement sorting or filtering for the list of cars (e.g., by check-in time).
● Add validation for empty input fields or invalid car numbers.
This task will assess your understanding of state management, local database handling, Code Structure,
and Flutter UI building skills.