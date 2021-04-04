from flask import Flask, render_template, request, jsonify


# web application
app = Flask(__name__)

# default landing page
@app.route('/')
def index():
    return render_template('/index.html')

# inspect data
@app.route('/viewer', methods=['GET','POST'])
def viewer():
    inspect = {}
    inspect['form'] = request.form
    return jsonify(inspect)

# start server
if __name__ == '__main__':
    app.run(debug=True, port=3000)

