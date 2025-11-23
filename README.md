📘 Robot Framework Automation Project
API Testing • UI Testing • Database Testing • POM • Data-Driven Testing

This repository contains a complete Robot Framework automation portfolio built to demonstrate real-world skills for QA Engineer & Automation Engineer roles.

It includes:

✔️ REST API Testing (GET, POST, PUT, DELETE)

✔️ UI Automation using Selenium

✔️ Database Testing (MySQL)

✔️ Page Object Model (POM)

✔️ Excel-based Data-Driven Testing

✔️ Custom Keywords

✔️ Advanced Selenium interactions (alerts, frames, tabs, drag & drop, waits…)

This project was built as a full learning path + practical demonstration suitable for junior automation positions.

📂 Project Structure
PythonProject/
│
├── API Testing/
│   └── APItesting.robot
│
├── Robot Framework Practice/
│   ├── Page Objects/
│   │   └── locator.py
│   │
│   ├── Resource/
│   │   ├── first_resource.robot
│   │   ├── Invalid_Login.robot
│   │   ├── Invalid_Login.xlsx
│   │   ├── POMresources.robot
│   │   ├── advanced_login_test.robot
│   │   ├── basics.robot
│   │   ├── Data_handling_excel.robot
│   │   ├── db_tests.robot
│   │   └── POMtests.robot

🚀 Features
🔵 1. API Testing (RequestsLibrary)

File: APItesting.robot

Includes full CRUD operations:

GET /posts/{id}

POST /users/add

PUT /posts/{id}

DELETE /posts/{id}

User input is dynamically requested using Dialogs:

Get Value From User


Validation includes:

Status codes

Response content

Error handling

🔵 2. UI Automation (SeleniumLibrary)

Multiple test suites including:

Login flows

Logout validation

Form automation

Radio buttons, checkboxes

Dropdowns (index / label / value)

Alert handling

Frame navigation

Multiple tabs & multiple browsers

Drag & drop

Scroll actions

Screenshot capturing

Mouse actions

Implicit & explicit waits

Browser navigation

Table handling

🔵 3. Page Object Model (POM)

Folder: Page Objects/

locator.py stores selectors
POMresources.robot contains shared keywords
POMtests.robot uses the POM keywords

This ensures a scalable & maintainable test structure.

🔵 4. Excel Data-Driven Testing

File:

Invalid_Login.robot

Invalid_Login.xlsx

Using DataDriver library, each test case runs automatically with every row in the Excel sheet.

🔵 5. Database Testing

File: db_tests.robot

Using DatabaseLibrary, the suite demonstrates:

Create table

Insert row

Select queries

Validations

Update & delete rows

Drop table

SQL examples:

Execute SQL String    Create table book(id integer, title varchar(20));
Query                 select title from book where title="South Paw"

🛠️ Tools & Technologies
Tool / Library	Purpose
Robot Framework	Test automation framework
SeleniumLibrary	UI automation
RequestsLibrary	API automation
DatabaseLibrary (PyMySQL)	SQL testing
DataDriver	Excel data-driven testing
Python (locator.py)	Page Object selectors
Excel	Test data source
▶️ How to Run the Tests
1️⃣ Install dependencies
pip install robotframework
pip install robotframework-seleniumlibrary
pip install robotframework-requests
pip install robotframework-databaselibrary
pip install pymysql
pip install robotframework-datadriver

2️⃣ Run a specific test file
robot APItesting.robot

3️⃣ Run a folder
robot "Robot Framework Practice"

4️⃣ Run with tags
robot --include smoke basics.robot

🧩 Project Highlights
⭐ Covers real interview topics:

Element locators

Waits & timeouts

POM

Assertions

Test data separation

Custom keywords

Reports & logs

Database validation

API validation

⭐ Clean Structure

Your folders are logically separated into:

API testing

UI testing

Resources

POM

Data-driven

This mirrors real QA automation team practices.
