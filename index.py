import ConfigParser
from flask import Flask, render_template, redirect, url_for
app = Flask(__name__)

@app.route('/')
def root():
  return render_template('index.html'), 200

@app.route('/LCDSoundsystem')
def lcd():
  return render_template('LCD.html'), 200

@app.route("/LCD")
def relcd():
  return redirect(url_for('lcd')), 301

@app.route('/ArcadeFire')
def af():
  return render_template('AF.html'), 200

@app.route('/AF')
def reaf():
  return redirect(url_for('af')), 301

@app.route('/Radiohead')
def rh():
  return render_template('RH.html'), 200

@app.route('/RH')
def rerh():
  return redirect(url_for('rh')), 301

@app.route('/ArcticMonkeys')
def am():
  return render_template('AM.html'), 200

@app.route('/AM')
def ream():
  return redirect(url_for('am')), 301

@app.errorhandler(404)
def page_not_found(error):
  return render_template('404.html'), 404

@app.route('/config/')
def config():
  str = []
  str.append('Debug:'+app.config['DEBUG'])
  str.append('port:'+app.config['port'])
  str.append('url:'+app.config['url'])
  str.append('ip_address:'+app.config['ip_address'])
  return '/t'.join(str)

def init(app):
    config = ConfigParser.ConfigParser()
    try:
        config_location = "etc/defaults.cfg"
        config.read(config_location)

        app.config['DEBUG'] = config.get("config", "debug")
        app.config['ip_address'] = config.get("config", "ip_address")
        app.config['port'] = config.get("config", "port")
        app.config['url'] = config.get("config", "url")
    except:
        print "Could not read configs from: ", config_location

if __name__  == '__main__':
    init(app)
    app.run(
        host=app.config['ip_address'],
        port=int(app.config['port']))
