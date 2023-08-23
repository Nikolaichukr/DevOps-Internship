from flask import Flask, render_template
import random

app = Flask(__name__)


cat_images = [
    "https://cdn2.thecatapi.com/images/wJyw82pIl.jpg",
    "https://cdn2.thecatapi.com/images/duo.jpg",
    "https://cdn2.thecatapi.com/images/biu.png",
    "https://cdn2.thecatapi.com/images/56i.jpg",
    "https://cdn2.thecatapi.com/images/P4xLtrwmc.jpg"
]

@app.route('/')
def index():
    random_cat_image = random.choice(cat_images)
    return render_template('index.html', cat_image=random_cat_image)

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')
