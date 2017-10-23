from flask import Flask, render_template
app = Flask(__name__)

@app.route('/')
def root():
  return render_template('index.html'),200

#@app.route('/static-lcd/img')
#def static_lcd_img():
 #start = '<img src="'
  #url = url_for('static', filename='lcd.jpg')
  #end = '">'
  #return start+url+end, 200

@app.errorhandler(404)
def page_not_found(error):
  return render_template('404.html'), 404

if __name__ == "__main__":
  
  app.run(host="0.0.0.0", debug=True)
