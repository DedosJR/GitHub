from flask import Flask, render_template
import requests

app = Flask(__name__)

@app.route('/')
def home():
    # Consuming an example API (JSONPlaceholder)
    response = requests.get('https://jsonplaceholder.typicode.com/posts')
    posts = response.json()
    return render_template('index.html', posts=posts)

if __name__ == '__main__':
    app.run(debug=True)