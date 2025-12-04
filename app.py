from flask import Flask, render_template, redirect, url_for
import mysql.connector

app = Flask(__name__)

# MySQL connection
conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="",  # Your MySQL password
    database="organic_shop"
)
cursor = conn.cursor(dictionary=True)

@app.route('/')
def home():
    cursor.execute("SELECT * FROM products")
    products = cursor.fetchall()
    return render_template('index.html', products=products)

# Add to cart route
@app.route('/add_to_cart/<int:product_id>')
def add_to_cart(product_id):
    user_id = 1  # Hardcoded for now
    cursor.execute("SELECT * FROM cart WHERE user_id=%s AND product_id=%s", (user_id, product_id))
    item = cursor.fetchone()
    if item:
        cursor.execute("UPDATE cart SET quantity=quantity+1 WHERE id=%s", (item['id'],))
    else:
        cursor.execute("INSERT INTO cart (user_id, product_id, quantity) VALUES (%s, %s, %s)", (user_id, product_id, 1))
    conn.commit()
    return redirect(url_for('home'))

if __name__ == '__main__':
    app.run(debug=True)
