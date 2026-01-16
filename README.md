🍔 Canteen Automation System

A web-based Food Ordering and Canteen Management System built using Python (Flask) and MySQL. This application streamlines the process of ordering food in a canteen environment, allowing students to order from a digital menu and administrators to manage orders, inventory, and users efficiently.

🚀 Features
👨‍💼 Admin Module
Dashboard: Overview of system activities.

Menu Management: Add, update, delete, and view food items with photos, prices, and availability status.

Order Management: View incoming orders, accept or reject them based on availability, and view order history (Accepted/Rejected).

User Management: Register new students/admins, view user profiles, and update or delete user data.

Wallet System: Add credits/points to student wallets for cashless transactions.

Transaction History: Track all wallet transactions.

👨‍🎓 User (Student) Module
Digital Menu: Browse food items categorized by type (Veg/Non-veg, Beverages, etc.).

Smart Cart: Add items to the cart, update quantities, and view a cost summary before checkout.

Wallet Payment: Orders are processed using the internal wallet balance.

Order History: View past orders and their current status (Pending, Accepted, Rejected).

Profile Management: View personal details and current wallet balance.

🛠️ Tech Stack
Backend: Python 3.x, Flask

Database: MySQL

Frontend: HTML5, CSS3, JavaScript (Jinja2 Templates)

File Handling: Werkzeug (for secure image uploads)

📂 Project Structure
```Bash
├── static/
│   ├── photos/          # User profile pictures
│   ├── item_photos/     # Food menu images
│   └── css/             # Stylesheets (implied)
├── templates/           # HTML files (Jinja2)
│   ├── home.html
│   ├── admin_profile.html
│   ├── user_home.html
│   └── ... (other templates)
├── MyLib.py             # Custom library for Database Connection (required)
├── app.py               # Main application entry point
└── README.md
```
⚙️ Installation & Setup
1. Clone the Repository
```
Bash
git clone https://github.com/yourusername/canteen-automation-system.git
cd canteen-automation-system
```
2. Install Dependencies
Ensure you have Python installed. Install the required libraries:

```
Bash
pip install flask mysql-connector-python werkzeug
```
3. Database Configuration
You need to set up your MySQL database.

Open your MySQL Client (e.g., Workbench, phpMyAdmin).

Create a database named canteen_db.

Run the following SQL script to create the necessary tables:

```
SQL
CREATE DATABASE canteen_db;
USE canteen_db;

-- Admin Data
CREATE TABLE admin_data (
    name VARCHAR(100),
    address VARCHAR(255),
    contact VARCHAR(20),
    email VARCHAR(100) PRIMARY KEY
);

-- Login Credentials
CREATE TABLE login_data (
    email VARCHAR(100) PRIMARY KEY,
    password VARCHAR(100),
    usertype VARCHAR(20)
);

-- User/Student Data
CREATE TABLE user_data (
    st_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    gender VARCHAR(10),
    address VARCHAR(255),
    contact VARCHAR(20),
    email VARCHAR(100),
    balance INT DEFAULT 0
);

-- Food Menu
CREATE TABLE food_category (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    price INT,
    type VARCHAR(50),
    photo VARCHAR(255),
    availability VARCHAR(20) DEFAULT 'yes'
);

-- Cart
CREATE TABLE cart_items (
    user_email VARCHAR(100),
    item_id INT,
    quantity INT,
    PRIMARY KEY (user_email, item_id)
);

-- Orders
CREATE TABLE order_data (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    food_name VARCHAR(100),
    quantity INT,
    total_price INT,
    type VARCHAR(50),
    st_id INT,
    status VARCHAR(20) DEFAULT 'pending',
    order_datetime TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Transactions
CREATE TABLE transactions_history (
    pt_id INT AUTO_INCREMENT PRIMARY KEY,
    date DATE,
    email VARCHAR(100),
    amount INT,
    st_id INT
);

-- Photo Storage Link
CREATE TABLE photo_data (
    email VARCHAR(100),
    photo VARCHAR(255)
);
```
4. Configure Connection (MyLib.py)
Since MyLib is imported in app.py, ensure you have a MyLib.py file in the root directory that handles the DB connection. It should look something like this:

```
Python
import mysql.connector

def create_connection():
    return mysql.connector.connect(
        host="localhost",
        user="root",
        password="your_password",
        database="canteen_db"
    ).cursor()

# You may need helper functions like check_photo(email) here as well.
```
5. Run the Application
```
Bash
python app.py
```
Open your browser and navigate to http://127.0.0.1:5000/.

📸 Screenshots
(Add screenshots of your Home Page, Admin Dashboard, and Menu here to make the repo attractive)

🔮 Future Improvements
Integration with an online payment gateway (Stripe/Razorpay).

Email notifications for order status updates.

Mobile-responsive UI using Tailwind CSS or Bootstrap.

🤝 Contributing
Fork the Project

Create your Feature Branch (git checkout -b feature/AmazingFeature)

Commit your Changes (git commit -m 'Add some AmazingFeature')

Push to the Branch (git push origin feature/AmazingFeature)

Open a Pull Request

📜 License
This project is licensed under the MIT License.

Developed by [Kunal Maheshwari]