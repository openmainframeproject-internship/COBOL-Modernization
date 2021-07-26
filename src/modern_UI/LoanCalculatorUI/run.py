from ctypes import create_string_buffer, cdll, byref

from flask import Flask, render_template, flash, request, redirect
from wtforms import Form, TextField

app = Flask(__name__)
# Configurations
app.config.from_object('config')


class LoanForm(Form):
    """Class to build the form for collecting loan data.

    Attributes
    ----------
    amount : TextField
        Variable to hold the amount entered by the user through the form
    term : TextField
        Variable to hold the term entered by the user through the form
    rate : TextField
        Variable to hold the rate entered by the user through the form

    Methods
    -------
    upload_form()
        Collect data entered by user, convert to proper data types, send to COBOL Library,
        return the result to user.
    """
    amount = TextField(u'Loan Amount (In $):')
    term = TextField(u'Loan Term (In Months):')
    rate = TextField(u'Loan Interest Rate (In Percentage):')

    @app.route('/', methods=['POST', 'GET'])
    def upload_form():
        """Method to Collect data entered by user, convert to proper data types, send to COBOL
        Library, return the result to user.

        Returns
        -------
        html
            The rendered template file
        """
        form = LoanForm(request.form)

        print(form.errors)
        if request.method == 'POST' and form.validate():
            amt = request.form["amount"]
            term = request.form["term"]
            rate = request.form["rate"]
            AMOUNT = create_string_buffer(bytes(amt, 'utf-8'))
            RATE = create_string_buffer(bytes(rate, 'utf-8'))
            TERM = create_string_buffer(bytes(term, 'utf-8'))
            PAYMENT = create_string_buffer(9)
            ERROR = create_string_buffer(75)

            cbl = cdll.LoadLibrary("CalcLoan.so")
            cbl.cob_init(0, None)
            ret = cbl.CalcLoan(byref(AMOUNT), byref(RATE), byref(TERM),
                               byref(PAYMENT), byref(ERROR))
            print(ret, PAYMENT.value, ERROR.value)

            pay = PAYMENT.value.decode()
            err = ERROR.value.decode()
            cbl.cob_tidy()
            print(pay, err)
            if pay != '':
                flash("Monthly Payment Amount: " + pay, 'success')
            elif err != '':
                flash(err, 'error')
            return redirect('/')

        return render_template('form.html', form=form)


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8001, debug=True)
