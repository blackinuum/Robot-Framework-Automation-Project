# 📘 Robot Framework Automation Project

**API Testing • UI Automation • Database Testing • POM • Data-Driven Testing**

A comprehensive Robot Framework automation portfolio demonstrating real-world QA automation skills. Perfect for entry-level **QA Engineer** and **Automation Engineer** positions.

## ✨ What's Included

- ✅ **REST API Testing** — Complete CRUD operations (GET, POST, PUT, DELETE)
- ✅ **UI Automation** — Selenium with advanced interactions (alerts, frames, tabs, drag & drop, waits)
- ✅ **Database Testing** — MySQL integration with SQL validation
- ✅ **Page Object Model (POM)** — Scalable test architecture
- ✅ **Data-Driven Testing** — Excel-based test execution
- ✅ **Custom Keywords** — Reusable automation logic
- ✅ **Professional Practices** — Screenshots, logging, error handling

---

## 📂 Project Structure

```
robot-framework-automation/
│
├── API Testing/
│   └── APItesting.robot                 # CRUD API tests
│
├── Robot Framework Practice/
│   ├── Page Objects/
│   │   └── locator.py                   # Selenium selectors
│   │
│   ├── Resource/
│   │   ├── first_resource.robot         # Custom keywords
│   │   ├── POMresources.robot           # POM keywords
│   │   ├── db_tests.robot               # Database tests
│   │   ├── Invalid_Login.robot          # Login validation
│   │   ├── Invalid_Login.xlsx           # Test data
│   │   └── basics.robot                 # UI automation basics
│   │
│   ├── basics.robot
│   └── POMtests.robot
│
├── README.md                            # This file
└── requirements.txt                     # Dependencies

```

---

## 🚀 Key Features

### 🔵 API Testing (RequestsLibrary)
**File:** `APItesting.robot`

Complete REST API validation using **jsonplaceholder.typicode.com** and **dummyjson.com**

| Operation | Implementation |
|-----------|-----------------|
| **GET** | Fetch posts by ID with status validation |
| **POST** | Create new user with dynamic input |
| **PUT** | Update post data |
| **DELETE** | Remove posts with error handling |

**Features:**
- Dynamic user input via dialogs
- Status code validation
- Response content logging
- Error handling with IF/ELSE logic

---

### 🔵 UI Automation (SeleniumLibrary)
**Files:** `basics.robot`, `advanced_login_test.robot`

Complete browser automation covering:

| Feature | Example |
|---------|---------|
| **Login/Logout** | User authentication flows |
| **Form Filling** | Input text, selections |
| **Dropdowns** | Select by index, label, value |
| **Checkboxes & Radio Buttons** | Multi-select validation |
| **Alerts** | Alert box handling (accept/dismiss) |
| **Frames & iFrames** | Navigate nested content |
| **Multiple Tabs** | Switch between windows |
| **Multiple Browsers** | Parallel browser control |
| **Mouse Actions** | Right-click, double-click, drag & drop |
| **Waits** | Implicit, explicit, timeouts |
| **Screenshots** | Page & element captures |
| **Table Handling** | Extract & validate table data |

**Advanced Concepts Demonstrated:**
```robot
Set Selenium Speed       # Automated delays
Wait Until Element Is Visible   # Explicit waits
Set Selenium Timeout     # Timeout configuration
Scroll Element Into View # Dynamic scrolling
Execute JavaScript      # Browser script execution
```

---

### 🔵 Page Object Model (POM)
**Files:** 
- `Page Objects/locator.py` — Selector definitions
- `Resource/POMresources.robot` — Shared keywords
- `POMtests.robot` — Test execution

**Architecture:**
```robot
# POM separates selectors from test logic
Variables   Page Objects/locator.py
Resource    Resource/POMresources.robot

*** Keywords ***
Login Attempt
    [Arguments]    ${username}    ${password}
    input text     ${username_field}    ${username}
    input text     ${password_field}    ${password}
    click element  ${login_button}
```

✅ **Benefits:** Scalable, maintainable, reduces code duplication

---

### 🔵 Excel Data-Driven Testing
**Files:**
- `Invalid_Login.robot` — Test template
- `Invalid_Login.xlsx` — Test data source

**How it works:**
```robot
Library   DataDriver    Resource/Invalid_Login.xlsx
Test Template  Invalid Login Test

*** Test Cases ***
LoginWithExcel    ${username}    ${password}
```

Each row in the Excel file generates a separate test execution automatically.

---

### 🔵 Database Testing
**File:** `Resource/db_tests.robot`

MySQL integration with DatabaseLibrary (PyMySQL)

**Capabilities:**

| Operation | SQL Example |
|-----------|-------------|
| **Create Table** | `Create table book(id integer, title varchar(20))` |
| **Insert Data** | `Insert into book values(3,"South Paw")` |
| **Select Query** | `select title from book where title="South Paw"` |
| **Update Row** | `Update book set title="New Dawn" where title="South Paw"` |
| **Delete Row** | `Delete from Book where id=NULL` |
| **Drop Table** | `Drop table if exists book` |
| **Count/Aggregate** | `Select COUNT(name) from employees...` |

**Configuration:**
```robot
Suite Setup  Connect To Database    pymysql    
    ...  database=${DBname}
    ...  user=${DBuser}
    ...  password=${DBpassword}
    ...  host=${DBhost}
    ...  port=${DBport}
```

---

## 🛠️ Technologies & Tools

| Tool | Purpose | Version |
|------|---------|---------|
| **Robot Framework** | Test automation framework | 7.0+ |
| **SeleniumLibrary** | UI automation | 6.0+ |
| **RequestsLibrary** | API testing | 1.3+ |
| **DatabaseLibrary** | Database testing | 1.2+ |
| **DataDriver** | Data-driven execution | 1.1+ |
| **PyMySQL** | MySQL connector | 1.0+ |
| **Python** | POM selectors | 3.8+ |

---

## 📋 Prerequisites

- **Python 3.8+**
- **MySQL Server** (for database tests)
- **Browser Driver** (ChromeDriver for Chrome, etc.)

---

## ⚙️ Installation & Setup

### 1️⃣ Clone the Repository
```bash
git clone https://github.com/yourusername/robot-framework-automation.git
cd robot-framework-automation
```

### 2️⃣ Install Dependencies
```bash
pip install -r requirements.txt
```

Or install manually:
```bash
pip install robotframework==7.0
pip install robotframework-seleniumlibrary==6.0
pip install robotframework-requests==1.3
pip install robotframework-databaselibrary==1.2
pip install robotframework-datadriver==1.1
pip install pymysql==1.0
```

### 3️⃣ Set Up WebDriver
For Selenium tests, download the appropriate browser driver:
- **Chrome:** [ChromeDriver](https://chromedriver.chromium.org/)
- **Firefox:** [GeckoDriver](https://github.com/mozilla/geckodriver/releases)
- **Edge:** [EdgeDriver](https://developer.microsoft.com/en-us/microsoft-edge/tools/webdriver/)

Add to PATH or specify in tests.

### 4️⃣ Configure Database (Optional)
For database tests, update variables in `db_tests.robot`:
```robot
${DBname}=      your_database
${DBuser}=      root
${DBpassword}=  your_password
${DBhost}=      127.0.0.1
${DBport}=      3306
```

---

## ▶️ Running Tests

### Run All Tests
```bash
robot .
```

### Run Specific Test File
```bash
robot API\ Testing/APItesting.robot
robot "Robot Framework Practice/basics.robot"
```

### Run Specific Test Suite
```bash
robot "Robot Framework Practice/"
```

### Run with Tags
```bash
robot --include smoke .
robot --exclude database .
```

### Run with Options
```bash
robot --outputdir results/ .                    # Custom output directory
robot --log NONE --report NONE .               # Minimal output
robot --dryrun .                               # Validate syntax only
robot -t "LoginTest" .                         # Run specific test
```

### Generate Reports
```bash
robot --outputdir results/ .
# Reports generated in results/ folder:
# - report.html
# - log.html
```

---

## 📊 Test Organization

| Suite | Tests | Focus |
|-------|-------|-------|
| **APItesting.robot** | GET, POST, PUT, DELETE | REST API validation |
| **basics.robot** | Login, Forms, Alerts, Tables | UI fundamentals |
| **POMtests.robot** | Page Object Model | Scalable architecture |
| **db_tests.robot** | CRUD operations | Database validation |
| **Invalid_Login.robot** | Data-driven logins | Excel integration |

---

## 💡 Key Concepts Demonstrated

✅ **Element Locators** — XPath, ID, CSS selectors  
✅ **Waits & Timeouts** — Implicit, explicit, sleep  
✅ **Custom Keywords** — Reusable test logic  
✅ **Error Handling** — IF/ELSE, TRY/EXCEPT patterns  
✅ **Assertions** — Validation & verification  
✅ **Test Data** — Dynamic inputs, Excel sources  
✅ **Page Objects** — Maintainable architecture  
✅ **Screenshots & Logs** — Test reporting  
✅ **API Validation** — Status codes, response content  
✅ **Database Integration** — SQL queries, data verification  

---

## 🎯 Interview Topics Covered

This project demonstrates competency in:

- ✅ Automation framework fundamentals
- ✅ Element identification & interaction
- ✅ Wait strategies & performance
- ✅ API testing & REST concepts
- ✅ Database validation
- ✅ Test design patterns
- ✅ Data-driven testing
- ✅ Page Object Model
- ✅ Code organization & scalability
- ✅ Debugging & reporting

Perfect for discussing during interviews with QA teams!

---

## 📝 Example Test Cases

### API Testing Example
```robot
GET Request
    create session  first_session   https://jsonplaceholder.typicode.com
    ${id}=  Get value from user     Post ID:
    ${response}=    Get Request    first_session   /posts/${id}
    Should Be Equal As Integers    ${response.status_code}    200
    log to console    ${response.content}
```

### UI Automation Example
```robot
LoginTest
    Open Browser    https://www.saucedemo.com/    chrome
    input text      id:user-name     ${username}
    input text      id:password      ${password}
    click element   id:login-button
    Wait Until Element Is Visible    xpath://div/nav/a[@id="logout_sidebar_link"]
    element should be visible        id:inventory_container
    close browser
```

### POM Example
```robot
Full Test
    set selenium speed    0.5s
    Login Attempt    ${username}    ${password}
    Page should contain    Logged In Successfully
    close browser
```

---

## 🔗 Useful Resources

- **Robot Framework Docs:** https://robotframework.org/robotframework/
- **SeleniumLibrary Docs:** https://robotframework.org/SeleniumLibrary/
- **RequestsLibrary Docs:** https://marketsquare.github.io/robotframework-requests/
- **DatabaseLibrary Docs:** https://github.com/robotframework/DatabaseLibrary

---

## 📧 Author

BAZOURHI Mohamed Saad — Fresh Graduate Information Systems Security
📍 Casablanca, Morocco  
🔗 [LinkedIn]([https://linkedin.com/in/yourprofile](https://www.linkedin.com/in/mohamed-saad-bazourhi-3b8445235/)) | 🐙 [GitHub]([https://github.com/yourusername](https://github.com/blackinuum))


